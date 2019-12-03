<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>(주)케이씨에스 영업 관리 시스템</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/css?family=Prata&display=swap" rel="stylesheet">

<link rel="stylesheet"
	href="resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="resources/css/animate.css">

<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">

<link rel="stylesheet" href="resources/css/aos.css">

<link rel="stylesheet" href="resources/css/ionicons.min.css">

<link rel="stylesheet"
	href="resources/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="resources/css/nouislider.css">


<link rel="stylesheet" href="resources/css/flaticon.css">
<link rel="stylesheet" href="resources/css/icomoon.css">
<link rel="stylesheet" href="resources/css/style.css">

<!-- Favicon -->
<link href="resources/images/kcsfav.png" rel="shortcut icon" />
</head>
<body>
<script>
function loginProcess(){
	document.loginForm.action = "/logout";
	document.loginForm.method = "POST";
	document.loginForm.submit();
}
</script>

	<div class="main-section">

		<nav
			class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-info ftco-navbar-custom"
			id="ftco-navbar">
			<div class="container">
				<a class="navbar-brand" href="main.html"><img
					src="resources/images/kcs.png" height="45px"></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#ftco-nav" aria-controls="ftco-nav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="oi oi-menu"></span> Menu
				</button>
				<div class="collapse navbar-collapse" id="ftco-nav">
					<ul class="navbar-nav ml-auto">
						<li class="dropdown nav-item"><a href="#"
							class="dropdown-toggle nav-link icon d-flex align-items-center"
							data-toggle="dropdown"> 영업 관리 <b class="caret"></b>
						</a>
							<div class="dropdown-menu dropdown-menu-left">
								<a href="/businessPlan" class="dropdown-item">예산 작성</a>
								<a href="/businessPlanList" class="dropdown-item">예산 목록</a>
							</div></li>
						<li class="nav-item"><a href="#"
							class="nav-link icon d-flex align-items-center">Download</a></li>
						<li class="nav-item"><a href="#"
							class="nav-link icon d-flex align-items-center"><i
								class="ion-logo-facebook"></i></a></li>
						<li class="nav-item"><a href="#"
							class="nav-link icon d-flex align-items-center"><i
								class="ion-logo-twitter"></i></a></li>
						<li class="nav-item"><a href="#"
							class="nav-link icon d-flex align-items-center"><i
								class="ion-logo-instagram"></i></a></li>

					</ul>
				<sec:authorize access="isAuthenticated()">
					<c:set var="userId"><sec:authentication property="principal.user.userId"/></c:set>
					<div style="min-width: 100px;">
					<form name="loginForm" >
						${userId } | <a href="#" onclick="loginProcess();">로그아웃</a>
<!-- 						<button>로그아웃</button> -->
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					</form>
					</div>
				</sec:authorize>
				</div>
			</div>
		</nav>
		<!-- END nav -->

		<section class="hero-wrap js-fullheight">
			<div class="container">
				<div
					class="row description js-fullheight align-items-center justify-content-center">
					<div class="col-md-8 text-center">
						<div class="text">
							<h1>Tools UI Kit.</h1>
							<h4 class="mb-5">Free Bootstrap 4 UI Kit on Tools Design.</h4>
							<p>
								<a href="#" class="btn btn-white px-4 py-3"><i
									class="ion-ios-cloud-download mr-2"></i>Download Tools</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="ftco-section pb-0">
			<div class="container">
				<div class="row">
					<div class="col-md-12 heading-title">
						<h1>Basic Elements</h1>
					</div>
				</div>
			</div>
		</section>

		<section class="ftco-section" id="buttons">
			<div class="container">
				<div class="row mb-5">
					<div class="col-md-12">
						<h2 class="heading-section">
							Buttons <br> <small>Pick your style</small>
						</h2>
					</div>
					<div class="col-md-12">
						<button type="button" class="btn btn-primary">Default</button>
						<button type="button" class="btn btn-primary btn-round">Round</button>
						<button type="button" class="btn btn-primary btn-round">
							<i class="ion-ios-heart"></i> With Icon
						</button>
						<button type="button" class="btn btn-primary btn-fab btn-round">
							<i class="ion-ios-heart"></i>
						</button>
						<button type="button" class="btn btn-link">Simple</button>
					</div>
				</div>

				<div class="row mb-5">
					<div class="col-md-12">
						<h2 class="heading-section">
							<small>Pick your size</small>
						</h2>
					</div>
					<div class="col-md-12 mb-3">
						<button type="button" class="btn btn-primary btn-sm">Small
							Size</button>
						<button type="button" class="btn btn-primary">Regular
							Size</button>
						<button type="button" class="btn btn-primary btn-lg">Large
							Size</button>
					</div>
					<div class="col-md-12">
						<button type="button" class="btn btn-outline-primary btn-sm">Small
							Size</button>
						<button type="button" class="btn btn-outline-primary">Regular
							Size</button>
						<button type="button" class="btn btn-outline-primary btn-lg">Large
							Size</button>
					</div>
				</div>

				<div class="row mb-5">
					<div class="col-md-12">
						<h2 class="heading-section">
							<small>Pick your color</small>
						</h2>
					</div>
					<div class="col-md-12 mb-3">
						<button type="button" class="btn btn-primary">Primary</button>
						<button type="button" class="btn btn-secondary">Secondary</button>
						<button type="button" class="btn btn-success">Success</button>
						<button type="button" class="btn btn-danger">Danger</button>
						<button type="button" class="btn btn-warning">Warning</button>
						<button type="button" class="btn btn-info">Info</button>
						<button type="button" class="btn btn-light">Light</button>
						<button type="button" class="btn btn-dark">Dark</button>
					</div>
					<div class="col-md-12">
						<button type="button" class="btn btn-outline-primary">Primary</button>
						<button type="button" class="btn btn-outline-secondary">Secondary</button>
						<button type="button" class="btn btn-outline-success">Success</button>
						<button type="button" class="btn btn-outline-danger">Danger</button>
						<button type="button" class="btn btn-outline-warning">Warning</button>
						<button type="button" class="btn btn-outline-info">Info</button>
						<button type="button" class="btn btn-outline-light">Light</button>
						<button type="button" class="btn btn-outline-dark">Dark</button>
					</div>
				</div>

				<div class="row mb-5">
					<div class="col-md-12">
						<h2 class="heading-section">
							<small>Links</small>
						</h2>
					</div>
					<div class="col-md-12 mb-2">
						<a href="#" class="btn btn-primary btn-link" role="button">Primary
							link</a> <a href="#" class="btn btn-secondary btn-link" role="button">Secondary
							link</a> <a href="#" class="btn btn-success btn-link" role="button">Success
							link</a> <a href="#" class="btn btn-danger btn-link" role="button">Danger
							link</a> <a href="#" class="btn btn-warning btn-link" role="button">Warning
							link</a> <a href="#" class="btn btn-info btn-link" role="button">Info
							link</a> <a href="#" class="btn btn-dark btn-link" role="button">Dark
							link</a>
					</div>
				</div>

				<div class="row mb-5">
					<div class="col-md-12">
						<h2 class="heading-section">
							<small>Disabled Buttons</small>
						</h2>
					</div>
					<div class="col-md-12 mb-2">
						<a href="#" class="btn btn-primary btn-lg disabled" role="button"
							aria-disabled="true">Primary link</a> <a href="#"
							class="btn btn-success btn-lg disabled" role="button"
							aria-disabled="true">Link</a>
					</div>
				</div>

				<div class="row mb-5">
					<div class="col-md-12">
						<h2 class="heading-section">
							<small>Block Level Buttons</small>
						</h2>
					</div>
					<div class="col-md-12 mb-2">
						<button type="button" class="btn btn-primary btn-lg btn-block">Block
							Level Primary</button>
						<button type="button" class="btn btn-secondary btn-lg btn-block">Block
							Level Secondary</button>
					</div>
				</div>
			</div>
		</section>
		<!-- - - - - -end- - - - -  -->

		<section class="ftco-section bg-light" id="inputs">
			<div class="container">
				<div class="row mb-5">
					<div class="col-md-12">
						<h2 class="heading-section">Inputs</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-3 col-sm-4">
						<div class="form-group has-default">
							<input type="text" class="form-control" placeholder="Default">
						</div>
					</div>
					<div class="col-lg-3 col-sm-4">
						<div class="form-group">
							<input type="email" id="email" class="form-control" required>
							<label class="form-control-placeholder" for="email">With
								Floating Label</label> <span class="bmd-help">We'll never share
								your email with anyone else.</span>
						</div>
					</div>
					<div class="col-lg-3 col-sm-4">
						<div class="form-group has-success">
							<input type="text" class="form-control" id="exampleInput2"
								required> <label for="exampleInput2"
								class="form-control-placeholder">Success input</label> <span
								class="icon success"> <i class="ion-ios-checkmark"></i>
							</span>
						</div>
					</div>
					<div class="col-lg-3 col-sm-4">
						<div class="form-group has-danger">
							<input type="text" class="form-control" id="exampleInput3"
								required> <label for="exampleInput3"
								class="form-control-placeholder">Error input</label> <span
								class="icon clear"> <i class="ion-ios-close"></i>
							</span>
						</div>
					</div>
					<div class="col-lg-3 col-sm-4">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i
										class="ion-ios-people"></i>
									</span>
								</div>
								<input type="text" class="form-control"
									placeholder="With Material Icons">
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-sm-4">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i
										class="ion-logo-ionic"></i>
									</span>
								</div>
								<input type="text" class="form-control"
									placeholder="With Ionicons Icons">
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- - - - - -end- - - - -  -->

		<section class="ftco-section" id="checkRadios">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<h2 class="heading-section mb-4">Checkboxes</h2>
						<div class="form-check">
							<label class="custom-control fill-checkbox"> <input
								type="checkbox" class="fill-control-input"> <span
								class="fill-control-indicator"></span> <span
								class="fill-control-description">Unchecked</span>
							</label>
						</div>
						<div class="form-check">
							<label class="custom-control fill-checkbox"> <input
								type="checkbox" class="fill-control-input" checked> <span
								class="fill-control-indicator"></span> <span
								class="fill-control-description">Checked</span>
							</label>
						</div>
						<div class="form-check disabled">
							<label class="custom-control fill-checkbox"> <input
								type="checkbox" class="fill-control-input" disabled> <span
								class="fill-control-indicator"></span> <span
								class="fill-control-description">Disabled Unchecked</span>
							</label>
						</div>
						<div class="form-check disabled">
							<label class="custom-control fill-checkbox"> <input
								type="checkbox" class="fill-control-input" checked disabled>
								<span class="fill-control-indicator"></span> <span
								class="fill-control-description">Disabled Checked</span>
							</label>
						</div>
					</div>

					<div class="col-md-3">
						<h2 class="heading-section mb-4">Radio Buttons</h2>
						<div class="form-radio">
							<div class="radio">
								<label> <input type="radio" name="radio-input">
									Radio os off <span class="checkmark"></span>
								</label>
							</div>
						</div>
						<div class="form-radio">
							<div class="radio">
								<label> <input type="radio" name="radio-input" checked
									disabled> Radio is on <span class="checkmark"></span>
								</label>
							</div>
						</div>
						<div class="form-radio">
							<div class="radio">
								<label> <input type="radio" name="radio-input">
									Radio os off <span class="checkmark"></span>
								</label>
							</div>
						</div>
						<div class="form-radio disabled">
							<div class="radio">
								<label> <input type="radio" name="radio-input" disabled>
									Disabled radio is off <span class="checkmark"></span>
								</label>
							</div>
						</div>
					</div>

					<div class="col-md-3">
						<h2 class="heading-section mb-4">Toggle Buttons</h2>
						<div class="form-check">
							<label class="custom-control ios-switch"> <input
								type="checkbox" class="ios-switch-control-input" checked>
								<span class="ios-switch-control-indicator"></span> <span
								class="ios-switch-control-description">Toggle is on</span>
							</label>
						</div>
						<div class="form-check">
							<label class="custom-control ios-switch"> <input
								type="checkbox" class="ios-switch-control-input"> <span
								class="ios-switch-control-indicator"></span> <span
								class="ios-switch-control-description">Toggle is off</span>
							</label>
						</div>
					</div>

					<div class="col-md-3">
						<h2 class="heading-section mb-4">Sliders</h2>
						<div id="slider" class="no-uicustom mb-4"></div>
						<div id="slider-2" class="no-uicustom"></div>
					</div>

				</div>
			</div>
		</section>
		<!-- - - - - -end- - - - -  -->

		<section class="ftco-section" id="sliders">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<h2 class="heading-section mb-4">Progress bars</h2>
						<div class="progress" style="height: 4px;">
							<div class="progress-bar" role="progressbar" style="width: 25%;"
								aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
						<div class="progress" style="height: 4px;">
							<div class="progress-bar bg-success" role="progressbar"
								style="width: 40%" aria-valuenow="40" aria-valuemin="0"
								aria-valuemax="100"></div>
						</div>
						<div class="progress" style="height: 4px;">
							<div class="progress-bar bg-warning" role="progressbar"
								style="width: 60%" aria-valuenow="60" aria-valuemin="0"
								aria-valuemax="100"></div>
						</div>
						<div class="progress" style="height: 4px;">
							<div class="progress-bar bg-danger" role="progressbar"
								style="width: 80%" aria-valuenow="80" aria-valuemin="0"
								aria-valuemax="100"></div>
						</div>
					</div>
					<div class="col-md-6">
						<h2 class="heading-section mb-4">Paginations</h2>
						<div class="pagination pagination-1 mb-4">
							<a href="#">&laquo;</a> <a class="active" href="#">1</a> <a
								href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
							<a href="#">&raquo;</a>
						</div>

						<div class="pagination pagination-2">
							<a href="#" class="pageitem">Previous</a> <a href="#">1</a> <a
								href="#" class="active">2</a> <a href="#">3</a> <a href="#">4</a>
							<a href="#">5</a> <a href="#">6</a> <a href="#">7</a> <a href="#"
								class="pageitem">Next</a>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- - - - - -end- - - - -  -->

		<section class="ftco-section" id="menus">
			<div class="container">
				<div class="row">
					<div class="col-md-6 mb-4 pb-2 mb-md-0 pb-md-0">
						<h2 class="heading-section mb-4">Menu</h2>
						<nav class="navbar navbar-expand-lg navbar-light bg-warning">
							<a class="navbar-brand" href="#">Menu</a>
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarsExample01"
								aria-controls="navbarsExample01" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="oi oi-menu"></span>
							</button>
							<div class="collapse navbar-collapse" id="navbarsExample01">
								<ul class="navbar-nav">
									<li class="nav-item d-flex active"><a
										class="nav-link d-flex align-items-center" href="#">Home <span
											class="sr-only">(current)</span></a></li>
									<li class="nav-item d-flex"><a
										class="nav-link d-flex align-items-center" href="#">Features</a>
									</li>
									<li class="nav-item d-flex"><a
										class="nav-link d-flex align-items-center" href="#">Pricing</a>
									</li>
									<li class="nav-item d-flex"><a
										class="nav-link d-flex align-items-center disabled" href="#">Disabled</a>
									</li>
								</ul>
							</div>
						</nav>
					</div>
					<div class="col-md-6 mb-4 pb-2 mb-md-0 pb-md-0">
						<h2 class="heading-section mb-4">Menu with Icons</h2>
						<nav class="navbar navbar-expand-lg navbar-light bg-info">
							<a class="navbar-brand" href="#">Menu</a>
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarsExample02"
								aria-controls="navbarsExample02" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="oi oi-menu"></span>
							</button>
							<div class="collapse navbar-collapse ml-auto"
								id="navbarsExample02">
								<ul class="navbar-nav ml-auto">
									<li class="nav-item d-flex"><a href="#"
										class="nav-link d-flex align-items-center icon"><i
											class="ion-ios-send"></i></a></li>
									<li class="nav-item d-flex"><a href="#"
										class="nav-link d-flex align-items-center icon"><i
											class="ion-logo-buffer"></i></a></li>
									<li class="dropdown nav-item d-flex"><a href="#"
										class="dropdown-toggle nav-link d-flex align-items-center icon"
										data-toggle="dropdown"> <i class="ion-ios-settings"></i> <b
											class="caret"></b>
									</a>
										<div class="dropdown-menu dropdown-menu-right">
											<h6 class="dropdown-header">Dropdown header</h6>
											<a href="#" class="dropdown-item">Action</a> <a href="#"
												class="dropdown-item">Another action</a> <a href="#"
												class="dropdown-item">Something else here</a>
											<div class="dropdown-divider"></div>
											<a href="#" class="dropdown-item">Separated link</a>
											<div class="dropdown-divider"></div>
											<a href="#" class="dropdown-item">One more separated link</a>
										</div></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</section>
		<!-- - - - - -end- - - - -  -->

		<section class="ftco-section" id="navigations">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h2 class="heading-section mb-4">Navigations</h2>
					</div>
				</div>
			</div>
			<div class="container-fluid px-md-0">
				<div class="row no-gutters">
					<div class="col-md-12">
						<nav class="navbar navbar-expand-lg navbar-light bg-primary">
							<a class="navbar-brand" href="#">Primary Color</a>
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarsExample03"
								aria-controls="navbarsExample03" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="oi oi-menu"></span>
							</button>

							<div class="collapse navbar-collapse" id="navbarsExample03">
								<ul class="navbar-nav mr-auto">
									<li class="nav-item d-flex active"><a
										class="nav-link d-flex align-items-center" href="#">Discover
											<span class="sr-only">(current)</span>
									</a></li>
									<li class="nav-item d-flex"><a
										class="nav-link d-flex align-items-center" href="#">Profile</a>
									</li>
									<li class="nav-item d-flex"><a
										class="nav-link d-flex align-items-center" href="#">Settings</a>
									</li>
								</ul>
								<form class="form-inline my-2 my-lg-0">
									<input class="form-control mr-sm-2" type="search"
										placeholder="Search" aria-label="Search">
									<button class="btn btn-warning my-2 my-sm-0" type="submit">Search</button>
								</form>
							</div>
						</nav>
					</div>
				</div>
			</div>

			<div class="container-fluid px-md-0">
				<div class="row no-gutters">
					<div class="col-md-12">
						<nav class="navbar navbar-expand-lg navbar-light bg-info">
							<a class="navbar-brand" href="#">Info Color</a>
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarsExample04"
								aria-controls="navbarsExample04" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="oi oi-menu"></span>
							</button>

							<div class="collapse navbar-collapse" id="navbarsExample04">
								<ul class="navbar-nav ml-auto">
									<li class="nav-item d-flex active"><a
										class="nav-link d-flex align-items-center" href="#">Home <span
											class="sr-only">(current)</span></a></li>
									<li class="nav-item d-flex"><a
										class="nav-link d-flex align-items-center" href="#">Link</a></li>
									<li class="nav-item d-flex dropdown"><a
										class="nav-link d-flex align-items-center dropdown-toggle"
										href="#" id="navbarDropdown" role="button"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> Dropdown </a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdown">
											<a class="dropdown-item" href="#">Action</a> <a
												class="dropdown-item" href="#">Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Something else here</a>
										</div></li>
									<li class="nav-item d-flex"><a
										class="nav-link d-flex align-items-center disabled" href="#">Disabled</a>
									</li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>

			<div class="container-fluid px-md-0">
				<div class="row no-gutters">
					<div class="col-md-12">
						<nav class="navbar navbar-expand-lg navbar-light bg-danger">
							<a class="navbar-brand" href="#">Danger Color</a>
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarsExample05"
								aria-controls="navbarsExample05" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="oi oi-menu"></span>
							</button>

							<div class="collapse navbar-collapse" id="navbarsExample05">
								<ul class="navbar-nav ml-auto">
									<li class="nav-item d-flex active"><a href="#"
										class="nav-link d-flex align-items-center icon"><i
											class="ion-ios-compass"></i></a></li>
									<li class="nav-item d-flex"><a href="#"
										class="nav-link d-flex align-items-center icon"><i
											class="ion-ios-contact"></i></a></li>
									<li class="dropdown nav-item d-flex"><a href="#"
										class="dropdown-toggle nav-link d-flex align-items-center icon"
										data-toggle="dropdown"> <i class="ion-ios-settings"></i> <b
											class="caret"></b>
									</a>
										<div class="dropdown-menu dropdown-menu-right">
											<h6 class="dropdown-header">Dropdown header</h6>
											<a href="#" class="dropdown-item">Action</a> <a href="#"
												class="dropdown-item">Another action</a> <a href="#"
												class="dropdown-item">Something else here</a>
											<div class="dropdown-divider"></div>
											<a href="#" class="dropdown-item">Separated link</a>
											<div class="dropdown-divider"></div>
											<a href="#" class="dropdown-item">One more separated link</a>
										</div></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>

			<div class="container-fluid px-md-0">
				<div class="row no-gutters">
					<div class="col-md-12">
						<nav class="navbar navbar-expand-lg navbar-light bg-warning">
							<a class="navbar-brand" href="#">Info Color</a>
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarsExample06"
								aria-controls="navbarsExample06" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="oi oi-menu"></span>
							</button>

							<div class="collapse navbar-collapse" id="navbarsExample06">
								<ul class="navbar-nav ml-auto">
									<li class="nav-item active d-flex"><a
										class="nav-link d-flex align-items-center" href="#">Home <span
											class="sr-only">(current)</span></a></li>
									<li class="nav-item d-flex"><a href="#"
										class="nav-link icon d-flex align-items-center"><i
											class="ion-ios-compass mr-1"></i> Discover</a></li>
									<li class="nav-item d-flex"><a href="#"
										class="nav-link icon d-flex align-items-center"><i
											class="ion-ios-contact mr-1"></i> Profile</a></li>
									<li class="dropdown nav-item d-flex"><a href="#"
										class="dropdown-toggle nav-link icon d-flex align-items-center"
										data-toggle="dropdown"> <i class="ion-ios-settings mr-1"></i>
											Settings <b class="caret"></b>
									</a>
										<div class="dropdown-menu dropdown-menu-right">
											<h6 class="dropdown-header">Dropdown header</h6>
											<a href="#" class="dropdown-item">Action</a> <a href="#"
												class="dropdown-item">Another action</a> <a href="#"
												class="dropdown-item">Something else here</a>
											<div class="dropdown-divider"></div>
											<a href="#" class="dropdown-item">Separated link</a>
											<div class="dropdown-divider"></div>
											<a href="#" class="dropdown-item">One more separated link</a>
										</div></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>

			<div class="container-fluid px-md-0">
				<div class="row no-gutters">
					<div class="col-md-12">
						<nav class="navbar navbar-expand-lg navbar-light bg-dark">
							<a class="navbar-brand" href="#">Dark Color</a>
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarsExample07"
								aria-controls="navbarsExample07" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="oi oi-menu"></span>
							</button>

							<div class="collapse navbar-collapse" id="navbarsExample07">
								<ul class="navbar-nav ml-auto">
									<li class="nav-item df-elx active"><a
										class="nav-link d-flex align-items-center" href="#">Home <span
											class="sr-only">(current)</span></a></li>
									<li class="nav-item df-elx"><a
										class="nav-link d-flex align-items-center" href="#">Link</a></li>
									<li class="nav-item df-elx dropdown"><a
										class="nav-link d-flex align-items-center dropdown-toggle"
										href="#" id="navbarDropdown" role="button"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> Dropdown </a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdown">
											<a class="dropdown-item" href="#">Action</a> <a
												class="dropdown-item" href="#">Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Something else here</a>
										</div></li>
									<li class="nav-item df-elx"><a
										class="nav-link d-flex align-items-center disabled" href="#">Disabled</a>
									</li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>

			<div class="container-fluid navbar-transparent px-md-0 img pb-md-5"
				style="background-image: url(resources/images/bg_1.jpg); height: 400px;">
				<div class="overlay"></div>
				<div class="row no-gutters pt-md-4 pb-md-5">
					<div class="col-md-12">
						<nav class="navbar navbar-expand-lg navbar-light bg-transparent">
							<a class="navbar-brand" href="#">Background image</a>
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarsExample08"
								aria-controls="navbarsExample08" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="oi oi-menu"></span>
							</button>

							<div class="collapse navbar-collapse" id="navbarsExample08">
								<ul class="navbar-nav ml-auto">
									<li class="nav-item d-flex active"><a
										class="nav-link d-flex align-items-center" href="#">Home <span
											class="sr-only">(current)</span></a></li>
									<li class="nav-item d-flex"><a
										class="nav-link d-flex align-items-center" href="#">Link</a></li>
									<li class="nav-item d-flex dropdown"><a
										class="nav-link d-flex align-items-center dropdown-toggle"
										href="#" id="navbarDropdown" role="button"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> Dropdown </a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdown">
											<a class="dropdown-item" href="#">Action</a> <a
												class="dropdown-item" href="#">Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Something else here</a>
										</div></li>
									<li class="nav-item d-flex"><a
										class="nav-link d-flex align-items-center disabled" href="#">Disabled</a>
									</li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</section>
		<!-- - - - - -end- - - - -  -->

		<section class="ftco-section" id="navigationTabs">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<h2 class="heading-section mb-4">Navigation Tabs</h2>
						<div class="tabulation">
							<ul class="nav nav-tabs">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#home">Home</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#menu1">Profile</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#menu2">Messages</a></li>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content border border-top-0">
								<div class="tab-pane container p-4 active" id="home">
									<p>Far far away, behind the word mountains, far from the
										countries Vokalia and Consonantia, there live the blind texts.
										Separated they live in Bookmarksgrove right at the coast of
										the Semantics, a large language ocean.</p>
								</div>
								<div class="tab-pane container p-4 fade" id="menu1">
									<p>Far far away, behind the word mountains, far from the
										countries Vokalia and Consonantia, there live the blind texts.
										Separated they live in Bookmarksgrove right at the coast of
										the Semantics, a large language ocean.</p>
								</div>
								<div class="tab-pane container p-4 fade" id="menu2">
									<p>Far far away, behind the word mountains, far from the
										countries Vokalia and Consonantia, there live the blind texts.
										Separated they live in Bookmarksgrove right at the coast of
										the Semantics, a large language ocean.</p>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<h2 class="heading-section mb-4">Badges</h2>
						<span class="badge badge-pill badge-secondary p-2 px-3">Default</span>
						<span class="badge badge-pill badge-primary p-2 px-3">Primary</span>
						<span class="badge badge-pill badge-info p-2 px-3">Info</span> <span
							class="badge badge-pill badge-success p-2 px-3">Success</span> <span
							class="badge badge-pill badge-warning p-2 px-3">Warning</span> <span
							class="badge badge-pill badge-danger p-2 px-3">Danger</span> <span
							class="badge badge-pill badge-rose p-2 px-3">Rose</span>
					</div>
				</div>
			</div>
		</section>
		<!-- - - - - -end- - - - -  -->

		<section class="ftco-section" id="notifications">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h2 class="heading-section mb-4">Notifications</h2>
						<div class="alert alert-info">
							<div class="container">
								<div class="d-flex">
									<div class="alert-icon">
										<i class="ion-ios-information-circle-outline"></i>
									</div>
									<p class="mb-0 ml-2">
										<b>Info alert:</b> You&apos;ve got some friends nearby, stop
										looking at your phone and find them...
									</p>
								</div>
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true"><i class="ion-ios-close"></i></span>
								</button>
							</div>
						</div>
						<div class="alert alert-success">
							<div class="container">
								<div class="d-flex">
									<div class="alert-icon">
										<i class="ion-ios-checkmark-circle"></i>
									</div>
									<p class="mb-0 ml-2">
										<b>Success Alert:</b> Yuhuuu! You&apos;ve got your $11.99
										album from The Weeknd
									</p>
								</div>
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true"><i class="ion-ios-close"></i></span>
								</button>
							</div>
						</div>
						<div class="alert alert-warning">
							<div class="container">
								<div class="d-flex">
									<div class="alert-icon">
										<i class="ion-ios-warning"></i>
									</div>
									<p class="mb-0 ml-2">
										<b>Warning Alert:</b> Hey, it looks like you still have the
										&quot;copyright &#xA9; 2015&quot; in your footer. Please
										update it!
									</p>
								</div>
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true"><i class="ion-ios-close"></i></span>
								</button>
							</div>
						</div>
						<div class="alert alert-danger">
							<div class="container">
								<div class="d-flex">
									<div class="alert-icon">
										<i class="ion-ios-information-circle-outline"></i>
									</div>
									<p class="mb-0 ml-2">
										<b>Error Alert:</b> Damn man! You screwed up the server this
										time. You should find a good excuse for your Boss...
									</p>
								</div>
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true"><i class="ion-ios-close"></i></span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- - - - - -end- - - - -  -->

		<section class="ftco-section" id="typography">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h2 class="heading-section mb-4">Typography</h2>
						<div class="typo">
							<h1>
								<span class="typo-note">Header 1</span>Thinking in textures
							</h1>
						</div>
						<div class="typo">
							<h2>
								<span class="typo-note">Header 2</span>Thinking in textures
							</h2>
						</div>
						<div class="typo">
							<h3>
								<span class="typo-note">Header 3</span>Thinking in textures
							</h3>
						</div>
						<div class="typo">
							<h4>
								<span class="typo-note">Header 4</span>Thinking in textures
							</h4>
						</div>
						<div class="typo">
							<h5>
								<span class="typo-note">Header 5</span>Thinking in textures
							</h5>
						</div>
						<div class="typo">
							<h6>
								<span class="typo-note">Header 6</span>Thinking in textures
							</h6>
						</div>
						<div class="typo">
							<p>
								<span class="typo-note">Paragraph</span> I will be the leader of
								a company that ends up being worth billions of dollars, because
								I got the answers. I understand culture. I am the nucleus. I
								think that&#x2019;s a responsibility that I have, to push
								possibilities, to show people, this is the level that things
								could be at.
							</p>
						</div>
						<div class="typo">
							<span class="typo-note">Quote</span>
							<div class="blockquote">
								<p>I will be the leader of a company that ends up being
									worth billions of dollars, because I got the answers. I
									understand culture. I am the nucleus. I think that&#x2019;s a
									responsibility that I have, to push possibilities, to show
									people, this is the level that things could be at.</p>
								<small> &mdash; Jason Hodson, Web Designer </small>
							</div>
						</div>
						<div class="typo">
							<span class="typo-note">Muted Text</span>
							<p class="text-muted">I will be the leader of a company that
								ends up being worth billions of dollars, because I got the
								answers...</p>
						</div>
						<div class="typo">
							<span class="typo-note">Primary Text</span>
							<p class="text-primary">I will be the leader of a company
								that ends up being worth billions of dollars, because I got the
								answers...</p>
						</div>
						<div class="typo">
							<span class="typo-note">Info Text</span>
							<p class="text-info">I will be the leader of a company that
								ends up being worth billions of dollars, because I got the
								answers...</p>
						</div>
						<div class="typo">
							<span class="typo-note">Success Text</span>
							<p class="text-success">I will be the leader of a company
								that ends up being worth billions of dollars, because I got the
								answers...</p>
						</div>
						<div class="typo">
							<span class="typo-note">Warning Text</span>
							<p class="text-warning">I will be the leader of a company
								that ends up being worth billions of dollars, because I got the
								answers...</p>
						</div>
						<div class="typo">
							<span class="typo-note">Danger Text</span>
							<p class="text-danger">I will be the leader of a company that
								ends up being worth billions of dollars, because I got the
								answers...</p>
						</div>
						<div class="typo">
							<h2>
								<span class="typo-note">Small Tag</span> Header with small
								subtitle <br> <small>Use &quot;small&quot; tag for
									the headers</small>
							</h2>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- - - - - -end- - - - -  -->

		<section class="ftco-section" id="images">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h2 class="heading-section mb-4">Images</h2>
						<div class="row">
							<div class="col-md-3 text-center">
								<h2 class="heading-section mb-4">
									<small>Rounded Image</small>
								</h2>
								<img src="resources/images/avatar.jpg" alt="Round Image"
									class="rounded img-fluid image">
							</div>
							<div class="col-md-3 text-center">
								<h2 class="heading-section mb-4">
									<small>Circle Image</small>
								</h2>
								<img src="resources/images/avatar.jpg" alt="Circle Image"
									class="rounded-circle img-fluid image">
							</div>
							<div class="col-md-3 text-center">
								<h2 class="heading-section mb-4">
									<small>Rounded Raised</small>
								</h2>
								<img src="resources/images/avatar.jpg" alt="Thumbnail Image"
									class="img-raised rounded img-fluid image">
							</div>

							<div class="col-md-3 text-center">
								<h2 class="heading-section mb-4">
									<small>Circle Raised</small>
								</h2>
								<img src="resources/images/avatar.jpg" alt="Thumbnail Image"
									class="img-raised rounded-circle thumbnail img-fluid image">
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- - - - - -end- - - - -  -->

		<section class="ftco-section bg-light" id="javascriptsComponents">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h2 class="heading-section mb-4">Javascripts Components</h2>
					</div>
					<div class="col-md-12">
						<div class="row">
							<div class="col-lg-6">
								<div class="w-100 mb-4">
									<h2 class="heading-section">
										<small>Modals</small>
									</h2>
									<button type="button" class="btn btn-primary"
										data-toggle="modal" data-target="#exampleModalCenter">
										Launch demo modal</button>

									<!-- Modal -->
									<div class="modal fade" id="exampleModalCenter" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalCenterTitle"
										aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered"
											role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLongTitle">Modal
														title</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<p>Far far away, behind the word mountains, far from
														the countries Vokalia and Consonantia, there live the
														blind texts. Separated they live in Bookmarksgrove right
														at the coast of the Semantics, a large language ocean.</p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Close</button>
													<button type="button" class="btn btn-primary">Save
														changes</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="w-100">
									<h2 class="heading-section">
										<small>Datetimepickers</small>
									</h2>
									<div class="w-100">
										<form action="" method="post" class="datepickers">
											<div class="form-group">
												<!-- <label class="label-control" for="id_start_datetime">Datetime picker</label> -->
												<div class="input-group date" id="id_0">
													<input type="text" value="10/01/2019 05:32:00 PM"
														class="form-control" required />
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>

							<div class="col-lg-6">
								<div class="w-100 mb-4">
									<h2 class="heading-section">
										<small>Popovers</small>
									</h2>
									<button type="button" class="btn btn-secondary"
										data-container="body" data-toggle="popover"
										data-placement="top"
										data-content="Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.">
										On top</button>

									<button type="button" class="btn btn-secondary"
										data-container="body" data-toggle="popover"
										data-placement="right"
										data-content="Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.">
										On right</button>

									<button type="button" class="btn btn-secondary"
										data-container="body" data-toggle="popover"
										data-placement="bottom"
										data-content="Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.">
										On bottom</button>

									<button type="button" class="btn btn-secondary"
										data-container="body" data-toggle="popover"
										data-placement="left"
										data-content="Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.">
										On left</button>
								</div>

								<div class="w-100">
									<h2 class="heading-section">
										<small>Tooltip</small>
									</h2>
									<button type="button" class="btn btn-secondary"
										data-toggle="tooltip" data-placement="top"
										title="Tooltip on top">On top</button>
									<button type="button" class="btn btn-secondary"
										data-toggle="tooltip" data-placement="right"
										title="Tooltip on right">On right</button>
									<button type="button" class="btn btn-secondary"
										data-toggle="tooltip" data-placement="bottom"
										title="Tooltip on bottom">On bottom</button>
									<button type="button" class="btn btn-secondary"
										data-toggle="tooltip" data-placement="left"
										title="Tooltip on left">On left</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- - - - - -end- - - - -  -->

		<section class="ftco-section ftco-section-2 bg-primary" id="carousel">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-5">
						<h2 class="heading-section mb-4 pb-md-3">Bootstrap Carousel</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.
							Separated they live in Bookmarksgrove right at the coast of the
							Semantics, a large language ocean.</p>
						<p>A small river named Duden flows by their place and supplies
							it with the necessary regelialia. It is a paradisematic country,
							in which roasted parts of sentences fly into your mouth.</p>
						<p>
							<a href="#" class="btn btn-white">See all components</a>
						</p>
					</div>
					<div class="col-md-7">
						<div id="demo" class="carousel slide" data-ride="carousel">

							<!-- Indicators -->
							<ul class="carousel-indicators">
								<li data-target="#demo" data-slide-to="0" class="active"></li>
								<li data-target="#demo" data-slide-to="1"></li>
								<li data-target="#demo" data-slide-to="2"></li>
							</ul>

							<!-- The slideshow -->
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="resources/images/slider-1.jpg" alt=""
										class="img-fluid rounded">
								</div>
								<div class="carousel-item">
									<img src="resources/images/slider-2.jpg" alt=""
										class="img-fluid rounded">
								</div>
								<div class="carousel-item">
									<img src="resources/images/slider-3.jpg" alt=""
										class="img-fluid rounded">
								</div>
							</div>

							<!-- Left and right controls -->
							<a class="carousel-control-prev" href="#demo" data-slide="prev">
								<span class="ion-ios-arrow-round-back"></span>
							</a> <a class="carousel-control-next" href="#demo" data-slide="next">
								<span class="ion-ios-arrow-round-forward"></span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- - - - - -end- - - - -  -->

		<section class="ftco-section ftco-section-2">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-9 text-center">
						<h2 class="heading-section mb-4 pb-md-3">Completed with
							examples</h2>
						<p>The kit comes with three pre-built pages to help you get
							started faster. You can change the text and images and you're
							good to go. More importantly, looking at them will give you a
							picture of what you can built with this powerful kit.</p>
					</div>
				</div>
			</div>
		</section>
		<!-- - - - - -end- - - - -  -->

		<section
			class="ftco-section ftco-section-2 section-signup page-header img"
			style="background-image: url(resources/images/bg_2.jpg);">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-6 ml-auto mr-auto">
						<div class="card card-login py-4">
							<form class="form-login" method="" action="">
								<div class="card-header card-header-primary text-center">
									<h4 class="card-title">Login</h4>
									<div class="social-line">
										<a href="#"
											class="btn-icon d-flex align-items-center justify-content-center">
											<i class="ion-logo-facebook"></i>
										</a> <a href="#"
											class="btn-icon d-flex align-items-center justify-content-center">
											<i class="ion-logo-twitter"></i>
										</a> <a href="#"
											class="btn-icon d-flex align-items-center justify-content-center">
											<i class="ion-logo-googleplus"></i>
										</a>
									</div>
								</div>
								<!-- <p class="description text-center">Or Be Classical</p> -->
								<div class="card-body p-4">
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text"> <i
												class="ion-ios-contact"></i>
											</span>
										</div>
										<input type="text" class="form-control"
											placeholder="First Name...">
									</div>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text"> <i
												class="ion-ios-paper-plane"></i>
											</span>
										</div>
										<input type="email" class="form-control"
											placeholder="Email...">
									</div>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text"> <i
												class="ion-ios-lock"></i>
											</span>
										</div>
										<input type="password" class="form-control"
											placeholder="Password...">
									</div>
								</div>
								<div class="footer text-center">
									<a href="#" class="btn btn-primary">Get Started</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- - - - - -end- - - - -  -->

		<section class="ftco-section ftco-section-2 bg-light" id="cards">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h2 class="heading-section mb-4 pb-md-3">Cards Styles</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<h2 class="heading-section mb-4 pb-md-3">
							<small>Cards Default</small>
						</h2>
						<div class="card">
							<h5 class="card-header py-4">Featured</h5>
							<div class="card-body">
								<h5 class="card-title">Special title treatment</h5>
								<p class="card-text">With supporting text below as a natural
									lead-in to additional content. A small river named Duden flows
									by their place and supplies it with the necessary regelialia.
									It is a paradisematic country, in which roasted parts of
									sentences fly into your mouth.</p>
								<a href="#" class="btn btn-primary">Go somewhere</a>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<h2 class="heading-section mb-4 pb-md-3">
							<small>Cards with image</small>
						</h2>
						<div class="card">
							<img src="resources/images/bg_1.jpg" class="card-img-top"
								alt="...">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content. A small
									river named Duden flows by their place.</p>
							</div>
						</div>
					</div>

					<div class="col-md-4">
						<h2 class="heading-section mb-4 pb-md-3">
							<small>Cards w/ Header &amp; Footer</small>
						</h2>
						<div class="card text-center">
							<h5 class="card-header py-4">Featured</h5>
							<div class="card-body">
								<h5 class="card-title">Special title treatment</h5>
								<p class="card-text">With supporting text below as a natural
									lead-in to additional content. It is a paradisematic country,
									in which roasted parts of sentences fly into your mouth.</p>
								<a href="#" class="btn btn-primary">Go somewhere</a>
							</div>
							<div class="card-footer text-muted">2 days ago</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- - - - - -end- - - - -  -->

		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>

	</div>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.easing.1.3.js"></script>
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<script src="resources/js/jquery.stellar.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/aos.js"></script>

	<script src="resources/js/nouislider.min.js"></script>
	<script src="resources/js/moment-with-locales.min.js"></script>
	<script src="resources/js/bootstrap-datetimepicker.min.js"></script>
	<script src="resources/js/main.js"></script>

</body>
</html>