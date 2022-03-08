<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="main_menu home_menu" style="background-color: #fff;">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-12">
				<nav class="navbar navbar-expand-lg navbar-light">
					<a class="navbar-brand" href="home"> <img
						src="resources/main/img/logo.png" alt="logo">
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div
						class="collapse navbar-collapse main-menu-item justify-content-end"
						id="navbarSupportedContent">
						<ul class="navbar-nav align-items-center">
							<li class="nav-item active"><a class="nav-link" href="freeBoard">게시판</a></li>
							<li class="nav-item"><a class="nav-link" href="jobSelectList">구직</a></li>
							<li class="nav-item"><a class="nav-link" href="projectSearchPage?type=ofr&keyword=&pageNum=1&amount=5">구인</a></li>
							<li class="nav-item"><a class="nav-link" href="projectSearchPage?type=fnd&keyword=&pageNum=1&amount=5">펀딩</a></li>
							
							
							<li class="nav-item"><a class="nav-link" href="pms">PMS</a></li>
							
							<c:if test="${sessionUser ne null }">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="mypage"
									id="navbarDropdown" >My Page </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown">
										<a class="dropdown-item" href="myProject">프로젝트 관리</a>
										<a class="dropdown-item" href="myfunding">펀딩내역</a>
										<a class="dropdown-item" href="">개인정보 변경</a>
										<a class="dropdown-item" href="">개발자 정보변경</a>
										<a class="dropdown-item" href="Withdrawal">회원탈퇴</a>
									</div></li>
							</c:if>
							
							<c:if test="${sessionUser eq null }">
								<li class="d-none d-lg-block"><a class="genric-btn primary-border radius"
									href="loginForm">Sign in</a></li>
							</c:if>
							<c:if test="${sessionUser ne null }">
								<li class="d-none d-lg-block"><a class="genric-btn primary-border radius"
									href="logout">Logout</a></li>
							</c:if>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
</header>