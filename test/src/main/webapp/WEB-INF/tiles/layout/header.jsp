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
							<li class="nav-item active"><a class="nav-link" href="home">Home</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="about.html">About</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="cource.html">Courses</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="blog.html">Blog</a>
							</li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="blog.html"
								id="navbarDropdown" role="button" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> Pages </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="single-blog.html">Single
										blog</a> <a class="dropdown-item" href="elements.html">Elements</a>
								</div></li>
							<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="pms">PMS</a>
							</li>
							<li class="d-none d-lg-block"><a class="btn_1"
								href="loginForm">Sign in</a></li>
							<li class="d-none d-lg-block"><a class="btn_1"
								href="registerForm">Sing up</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
</header>