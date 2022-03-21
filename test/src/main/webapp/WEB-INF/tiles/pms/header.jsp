<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
	<div
		class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
		<a class="navbar-brand brand-logo mr-5" href="pms"><img
			src="resources/main/img/logo.png" alt="logo"></a> <a
			class="navbar-brand brand-logo-mini" href="pms"><img
			src="resources/main/img/logo.png" alt="logo"></a>
	</div>
	<div
		class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
		<button class="navbar-toggler navbar-toggler align-self-center"
			type="button" data-toggle="minimize">
			<span class="icon-menu"></span>
		</button>
		<div id="title">&nbsp;${sessionScope.myPrj == null ? '프로젝트롤 선택해주세요.' : myPrj.prj_name}</div>
		<ul class="navbar-nav navbar-nav-right">
			<li class="nav-item nav-profile dropdown"><a
				class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
				id="profileDropdown"> <i class="ti-settings text-primary"></i>
			</a>

				<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
					aria-labelledby="profileDropdown">
					<a class="dropdown-item" href="logout"> <i
						class="ti-power-off text-primary"></i> Logout
					</a> <a class="dropdown-item" href="home"> <i
						class="ti-home text-primary"></i> Home
					</a>
				</div></li>
			<li class="nav-item nav-settings d-none d-lg-flex"><a
				class="nav-link" href="#"> <i class="icon-ellipsis"></i>
			</a></li>
		</ul>
	</div>
</nav>