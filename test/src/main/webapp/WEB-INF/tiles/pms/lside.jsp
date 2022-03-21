<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<ul class="nav">
		<li class="nav-item"><a class="nav-link" href="tms"> <i
				class="icon-grid menu-icon"></i> <span class="menu-title">Main</span>
		</a></li>
		<c:if test="${sessionScope.myPrj ne null }">
			<li class="nav-item"><a class="nav-link" href="msteam"> <i
					class="icon-head menu-icon"></i> <span class="menu-title">TeamMember</span>
			</a></li>

			<li class="nav-item"><a class="nav-link" href="msapplication">
					<i class="icon-layout menu-icon"></i> <span class="menu-title">Propose</span>
			</a></li>

			<li class="nav-item"><a class="nav-link" href="msprogress">
					<i class="icon-paper menu-icon"></i> <span class="menu-title">Calendar</span>
			</a></li>

			<li class="nav-item"><a class="nav-link" href="mscard"> <i
					class="icon-columns menu-icon"></i> <span class="menu-title">Card</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="msboard"> <i
					class="icon-paper menu-icon"></i> <span class="menu-title">Board</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="msnotice"> <i
					class="icon-paper menu-icon"></i> <span class="menu-title">Notice</span>
			</a></li>
		</c:if>
	</ul>
</nav>
