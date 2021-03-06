package com.manage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.manage.comm.Common;
import com.manage.mapper.AuthMapper;
import com.manage.mapper.BusinessPlanMapper;
import com.manage.service.BusinessPlanSevice;
import com.manage.service.UserService;
import com.manage.service.paging.IPagingService;
import com.manage.vo.BpReportDTO;
import com.manage.vo.BusinessPlanVO;

import lombok.Setter;

@Controller
public class BusinessPlanController {
	
	@Setter(onMethod_ = @Autowired)
	private BCryptPasswordEncoder passwordEncoder;
	
	@Setter(onMethod_ = @Autowired)
	private BusinessPlanSevice businessPlanService;
	
	@Setter(onMethod_ = @Autowired)
	private BusinessPlanMapper businessPlanMapper;
	
	@Setter(onMethod_ = @Autowired)
	private AuthMapper authMapper;
	
	@Setter(onMethod_ = @Autowired)
	private IPagingService iPagingService;
	
	@Setter(onMethod_= @Autowired)
	private UserService userService;
	
	
//	GET 방식으로 test 접근 시 test
	@GetMapping("/test")
	public String ttest(Model model, Principal principal, HttpServletResponse response) throws IOException {
		System.out.println("<< businessPlan >>\n");
		
		if (principal == null) {
			return "redirect:/";
		}
		
		Common.script(response, "alert('테스트중!!');location.href='.';");
		
		return "businessPlan/businessPlan";
	}
	
	
// 로그인 한 아이디의 권한 리스트 가져오기
	@SuppressWarnings("unchecked")
	public static List<String> getAuthUser() {
		List<String> roleNames = new ArrayList<>();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Collection<GrantedAuthority> collection = (Collection<GrantedAuthority>) auth.getAuthorities();
        
        for (GrantedAuthority authority : collection) {
            roleNames.add(authority.getAuthority());
        }
        System.out.println("권한 : " + roleNames);
       
		return roleNames;
	}
	
// 권한리스트로 부서 이름 찾기
	public static String depName(List<String> list) {
		String depName = null;
		if (list.get(0).equals("ROLE_SALES1") || list.get(0).equals("ROLE_DIRECTOR1")) {
			depName = "영업 1팀";
		} else if (list.get(0).equals("ROLE_SALES2") || list.get(0).equals("ROLE_DIRECTOR2")) {
			depName = "영업 2팀";
		} else if (list.get(0).equals("ROLE_MARKETING")) {
			depName = "마케팅";
		} else if (list.get(0).equals("ROLE_CEO")) {
			depName = "대표이사";
		}

		System.out.println(depName);
		return depName;
	}
	
	
//	GET 방식으로 businessPlan 주소 접근 시 businessPlan.jsp 페이지로 이동
	@GetMapping("/businessPlan")
	public String businessplan(Model model, Principal principal) throws IOException {
		System.out.println("<< businessPlan >>\n");
		
		if (principal == null) {
			return "redirect:/";
		}
		
		return "businessPlan/businessPlan";
	}
	
//	POST 방식으로 businessPlan 주소 접근 시 예산 작성 처리
	@PostMapping("/businessPlan")
	public ResponseEntity<String> addBusinessPlan(BusinessPlanVO businessPlanVO, Model model, Principal principal) {
		System.out.println("<< businessPlan, POST >>\n");
		
		StringBuilder sb = new StringBuilder();

		if (principal == null) {
			sb.append("<script>");
			sb.append("alert('세션이 만료되었습니다.');");
			sb.append("location.href = '/';");
			sb.append("</script>");

			return Common.alertMsg(sb.toString());
		}

		businessPlanService.insertBusinessPlan(businessPlanVO);
		
		sb.append("<script>");
		sb.append("alert('입력이 완료되었습니다.');");
		sb.append("location.href = '/';");
		sb.append("</script>");

		return Common.alertMsg(sb.toString());
	}
	
// GET 방식으로 businessPlanList 주소 접근 시 예산 작성 목록 표시
	@GetMapping("/businessPlanList")
	public String getBusinessPlanByUserNum(Principal principal, Model model, HttpServletResponse response, @RequestParam(defaultValue = "1") int pageNum, @RequestParam(required = false) String search) throws IOException { 
		System.out.println("<< businessPlanList >>\n");
		
		if (principal == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('세션이 만료되었습니다.');");
			out.println("location.href='/';");
			out.println("</script>");
			out.close();
			
			return null;
		}
		
		System.out.println("param : " + pageNum + " " + search);
		
		String userNum = userService.getUserById(principal.getName()).getUserNum(); // 현재 로그인된 사용자의 userNum 가져오기
		System.out.println("userNum : " + userNum);
		
//		로그인 한 아이디의 권한 가져오기
		List<String> auth = getAuthUser();
		String department = null;
        if ("ROLE_MARKETING".equals(auth.get(0)) || "ROLE_CEO".equals(auth.get(0))) {
        	model.addAttribute("select", depName(auth));
        	userNum = null;
        } else if ("ROLE_DIRECTOR1".equals(auth.get(0)) || "ROLE_DIRECTOR2".equals(auth.get(0))) {
        	department = depName(auth);
        	userNum = null;
        }
        
        
        int amount = 2; // 한 페이지 당 보여줄 글 갯수
        int startRow = (pageNum - 1) * amount; // 시작 행 번호
        
        List<BusinessPlanVO> list = businessPlanService.getBusinessPlanPageList(search, department, userNum, amount, startRow);;
        
        int allRowCount = 0; // 전체 행 갯수
        allRowCount = businessPlanMapper.getBusinessPlanPageCount(search, department, userNum);
        
        int maxPage = allRowCount / amount + (allRowCount % amount == 0 ? 0 : 1);
        
        int pageBlockSize = 5; // 한 페이지블록 당 페이지 갯수
        
        int startPage = ((pageNum/pageBlockSize) - (pageNum%pageBlockSize==0 ? 1 : 0)) * pageBlockSize + 1;
        
        int endPage = startPage + pageBlockSize - 1;
        if (endPage > maxPage) { // 마지막 블록에서 끝 페이지 번호 구하기
            endPage = maxPage;
        }
        
        Map<String, Integer> page = new HashMap<>();
        page.put("startPage", startPage);
        page.put("endPage", endPage);
        page.put("pageBlockSize", pageBlockSize);
        page.put("maxPage", maxPage);
        page.put("allRowCount", allRowCount);
        page.put("pageNum", pageNum);
        
        System.out.println("Page : " + page);
//		List<BusinessPlanVO> list = businessPlanService.getBusinessPlanByUserNum(userNum);
//		System.out.println("listYear : " + listYear);
//		List<Integer> listYear = businessPlanMapper.getYearBusinessPlan();
//		model.addAttribute("listYear", listYear);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		
		return "businessPlan/businessPlanList";
	}
	
//	// 사용하지 않음
//	@PostMapping("/businessPlanList")
//	public ResponseEntity<List> getBusinessPlanByUserNum(@RequestParam HashMap<String, String> params, Model model) {
//		System.out.println("listPage : " + params);
//		
//		HttpHeaders headers = new HttpHeaders();
//		
////		List<BusinessPlanVO> list2 = businessPlanService.getBusinessPlanList(params);
//		List<BusinessPlanVO> list2 = null;
//		
//		return new ResponseEntity<List>(list2, headers, HttpStatus.OK);
//	}
	 
	 
	@PostMapping("/businessPlanDtl")
	public String businessPlanDtl(@RequestParam String oppId, @RequestParam String pageNum, Model model, Principal principal, HttpServletResponse response) throws IOException {
		System.out.println("<<businessPlanDtl>>");
		
		if (principal == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('세션이 만료되었습니다.');");
			out.println("location.href='/';");
			out.println("</script>");
			out.close();
			
			return null;
		}
		
		BusinessPlanVO list = businessPlanService.businessPlanDtl(oppId);
		System.out.println(list);
		model.addAttribute("data", list);
		
		String userNum = userService.getUserById(principal.getName()).getUserNum();
		model.addAttribute("userNum", userNum);
		model.addAttribute("pageNum", pageNum);
		
		return "businessPlan/businessPlanDtl";
	}
	
	@GetMapping("/bpReport")
	public String businessPlanGetReport(Principal principal, Model model, HttpServletResponse response) throws IOException {
		
		if (principal == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('세션이 만료되었습니다.');");
			out.println("location.href='/';");
			out.println("</script>");
			out.close();
			
			return null;
		}
		
//		로그인 한 아이디의 권한 가져오기
		List<String> auth = getAuthUser();
		
        if ("ROLE_MARKETING".equals(auth.get(0)) || "ROLE_CEO".equals(auth.get(0))) {
        	model.addAttribute("select", depName(auth));
        } 
        
		List<Integer> listYear = businessPlanMapper.getYearBusinessPlan();
		model.addAttribute("listYear", listYear);
		
		return "businessPlan/businessPlanGetReport";
	}
	 
	
//	@PostMapping("/bpReport")
	@RequestMapping(value = "/bpReport", method = RequestMethod.POST, produces = "application/text; charset=utf8") // 한글 깨짐으로 인해 이 코드 사용
	@ResponseBody
	public String businessPlanReport(@RequestBody BpReportDTO bpr, Principal principal) {
		if (principal == null) {
			return "";
		}
		
		String year = bpr.getYear();
		String team = bpr.getTeam();
		
		System.out.println("<< businessPlan Report, POST, " + year + ", " + team + " >>\n");

		JSONArray jArr = new JSONArray(); 
		
		if (year == null ) {
			System.out.println("year is null");
			return "";
		}
		
		System.out.println("year : " + year);

//		로그인 한 아이디의 권한 가져오기
		String depName = depName(getAuthUser());
		System.out.println("String " + depName);
		
		if ("마케팅".equals(depName) || "대표이사".equals(depName)) {
			depName = team;
        }
		System.out.println("getBPPeriodService : " + depName + " " + year);
		
		if (team == null) {
			System.out.println("team is null");
			team = depName;
		}

		// 1분기의 영업 계획 내용 (부서, 구분, 연도, 분기) < 구분 : (1. 물품, 2. 유지보수, 3. 개발) >
		List<BusinessPlanVO> list11 = businessPlanService.getBusinessPlanPeriodService(depName, 1, year, 1);
		List<BusinessPlanVO> list12 = businessPlanService.getBusinessPlanPeriodService(depName, 2, year, 1);
		List<BusinessPlanVO> list13 = businessPlanService.getBusinessPlanPeriodService(depName, 3, year, 1);
		// 2분기의 영업 계획 내용 (1. 물품, 2. 유지보수, 3. 개발)
		List<BusinessPlanVO> list21 = businessPlanService.getBusinessPlanPeriodService(depName, 1, year, 2);
		List<BusinessPlanVO> list22 = businessPlanService.getBusinessPlanPeriodService(depName, 2, year, 2);
		List<BusinessPlanVO> list23 = businessPlanService.getBusinessPlanPeriodService(depName, 3, year, 2);
		// 3분기의 영업 계획 내용 (1. 물품, 2. 유지보수, 3. 개발)
		List<BusinessPlanVO> list31 = businessPlanService.getBusinessPlanPeriodService(depName, 1, year, 3);
		List<BusinessPlanVO> list32 = businessPlanService.getBusinessPlanPeriodService(depName, 2, year, 3);
		List<BusinessPlanVO> list33 = businessPlanService.getBusinessPlanPeriodService(depName, 3, year, 3);
		// 4분기의 영업 계획 내용 (1. 물품, 2. 유지보수, 3. 개발)
		List<BusinessPlanVO> list41 = businessPlanService.getBusinessPlanPeriodService(depName, 1, year, 4);
		List<BusinessPlanVO> list42 = businessPlanService.getBusinessPlanPeriodService(depName, 2, year, 4);
		List<BusinessPlanVO> list43 = businessPlanService.getBusinessPlanPeriodService(depName, 3, year, 4);

		JSONObject jObj = new JSONObject();
		jObj.put("bp11", calcExpectedSales(list11));
		jObj.put("bp12", calcExpectedSales(list12));
		jObj.put("bp13", calcExpectedSales(list13));
		jObj.put("bp21", calcExpectedSales(list21));
		jObj.put("bp22", calcExpectedSales(list22));
		jObj.put("bp23", calcExpectedSales(list23));
		jObj.put("bp31", calcExpectedSales(list31));
		jObj.put("bp32", calcExpectedSales(list32));
		jObj.put("bp33", calcExpectedSales(list33));
		jObj.put("bp41", calcExpectedSales(list41));
		jObj.put("bp42", calcExpectedSales(list42));
		jObj.put("bp43", calcExpectedSales(list43));
		
		jObj.put("year", year);
		jObj.put("depName", depName);

		String yr = businessPlanMapper.getLastExpectedYearANDMonth(depName, "y", Integer.parseInt(year));
		String month = businessPlanMapper.getLastExpectedYearANDMonth(depName, "m", Integer.parseInt(year));
		System.out.println("year, month : " + year + ", " +month);

		if (month != null) {
			jObj.put("yr", yr); // 해당 년도 가장 마지막으로 예산 작성한 해 (확인!)
			jObj.put("month", month); //  해당 년도 가장 마지막으로 예산 작성한 달
		}

		jArr.put(jObj);
		System.out.println("jArr : " + jArr);
		
		return jArr.toString();
	}

	public int calcExpectedSales(List<BusinessPlanVO> list) {
		int expectedSales = 0; // 예상매출액

		for (BusinessPlanVO bp : list) {
			expectedSales += bp.getExpectedSales();
		}

		return expectedSales;
	}
	 
//	@GetMapping("/bPUpdate")
//	public String businessPlanUpdate(String oppId, Model model, HttpSession session) {
//		System.out.println("<< bPUpdate, GET >>\n");
//		
//		BusinessPlanVO list = businessPlanService.businessPlanDtl(oppId);
//		
//		model.addAttribute("data", list);
//		
//		return "businessPlan/businessPlanUpdate";
//	}
	
	@PostMapping("/bPUpdate")
	public String businessPlanUpdate(String oppId, String pageNum, Model model, Principal principal, HttpSession session, HttpServletResponse response) throws IOException {
		System.out.println("<< bPUpdate, POST >>\n");
		
		if (principal == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('세션이 만료되었습니다.');");
			out.println("location.href='/';");
			out.println("</script>");
			out.close();
			
			return null;
		}
		
		String userNum = userService.getUserById(principal.getName()).getUserNum();
		
		BusinessPlanVO bp = businessPlanService.businessPlanDtl(oppId);
		System.out.println("bp.getUserNum() : " + bp.getUserNum() + " / principal-userNum : " + userNum);
			
		if (!bp.getUserNum().equals(userNum)) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			
			return "forward:businessPlanDtl";
		}
		
		model.addAttribute("data", bp);
		
		return "businessPlan/businessPlanUpdate";
	}
	
	@PostMapping("/businessPlanUpdate") 
	public String businessPlanUpdate(String oppId, String pageNum, BusinessPlanVO b, Model model, Principal principal, HttpServletResponse response) throws IOException {
		System.out.println("<< businessPlan Update, POST >>\n");
		
		if (principal == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('세션이 만료되었습니다.');");
			out.println("location.href='/';");
			out.println("</script>");
			out.close();
			
			return null;
		}
		
		System.out.println(b);
		
		String userNum = userService.getUserById(principal.getName()).getUserNum();
		
		boolean isSuccess = businessPlanService.businessPlanUpdate(b, userNum);
		
		
		if(!isSuccess) { // 수정 실패
			System.out.println("수정 실패!");
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 작성자가 다릅니다!');");
			out.println("location.href='/businessPlanList?pageNum=" + pageNum + "';");
			out.println("</script>");
			out.close();
			
			return null;
		}
    
		System.out.println("수정 성공#####################");
		// 글 수정 성공 이후 글목록으로 리다이렉트
		
		return "forward:businessPlanDtl";
	
	}
	 
	@PostMapping("/bpDel")
	public void businessPlanDel(String oppId, Principal principal, HttpServletResponse response) throws IOException {
        System.out.println("<< businessPlanDel >>");
        
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        if (principal == null) {
        	out.println("<script>");
            out.println("alert('세션이 만료되었습니다.');");
            out.println("location.href='/';");
            out.println("</script>");
            out.close();
        	
        	return;
		}
        
        String userNum = userService.getUserById(principal.getName()).getUserNum();
        
        boolean isSuccess = businessPlanService.businessPlanDel(oppId, userNum);
        
        String msg = null;
        if (isSuccess) {
        	msg = "삭제되었습니다.";
        } else {
        	msg = "잘못된 접근입니다.";
        }
        out.println("<script>");
        out.println("alert('" + msg + "');");
        out.println("location.href='/businessPlanList';");
        out.println("</script>");
        out.close();
        return;
    }
	  
	@PostMapping("/bpReport/Detail")
	public String businessPlanReportDetail() {

		return "businessPlan/businessPlanReportDetail";
	}

}
