<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>(주)케이씨에스 손익 분석 시스템 - 손익 분석</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<jsp:include page="/WEB-INF/views/inc/link.jsp"></jsp:include>
</head>
<body>

<div class="main-section">
<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>

<section class="ftco-section pb-0">
<div class="container">
	<div class="row">
		<div class="col-md-12 heading-title">
			<h2 class="heading-section" style="margin-bottom: 2rem;">작성 가능한 예산 목록 : ${page.allRowCount }건</h2>
			<form action="/costBenefitAnalysis" id="dataForm" method="POST">
				<input type="hidden" name="pageNum" value="${param.pageNum }" />
				<input type="hidden" id="page" name="listPage" value="${listPage}" />
				<table class="table table-light table-hover table-borderless">
					<thead class="thead-dark">
					<tr>
						<th>OPPID</th>
						<th>프로젝트명</th>
						<th>담당자</th>
						<th>예상매출액</th>
						<th>예상매입금</th>
					</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="4" style="text-align: center;">작성된 예산 목록이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="data" items="${list}">
								<tr>
									<td onclick="location.href='/costBenefitAnalysisRegi?oppId=${data.oppId}'" style="cursor:pointer">${data.oppId}</td>
									<td>${data.projectName}</td>
									<td>${data.userNum}</td>
									<td>${data.expectedSales}</td>
									<td>${data.expectedPurchase}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>

		<div class="container pageCenter">
		<div class="pagination pagination-1 mb-4">
			<c:if test="${page.allRowCount gt 0 }">
			
			<c:if test="${page.startPage gt page.pageBlockSize }">
			<a href="/cbAnalysis?pageNum=1">1</a><p class="more-page">...</p>
			<a href="/cbAnalysis?pageNum=${page.startPage - 1 }">&laquo;</a>
			</c:if>
			
			<c:forEach begin="${page.startPage }" end="${page.endPage }" step="1" varStatus="i" >
			<c:choose>
			<c:when test="${i.current eq page.pageNum }">
				<a class="active" href="">${i.current }</a>
			</c:when>
			<c:otherwise>
				<a href="/cbAnalysis?pageNum=${i.current }">${i.current }</a>
			</c:otherwise>
			</c:choose>
			</c:forEach>
           	
           	<c:if test="${page.endPage lt page.maxPage }">
			<a href="/cbAnalysis?pageNum=${page.endPage + 1 }&#board">&raquo;</a>
			<p class="more-page">...</p>
			<a href="/cbAnalysis?pageNum=${page.maxPage }&#board">${page.maxPage }</a>
			</c:if>
           	
			</c:if>
					</div>
				</div>

			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
		</div>
	</div>
</div>
</section>

<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>

</div>

<jsp:include page="/WEB-INF/views/inc/js.jsp"></jsp:include>

</body>
</html>