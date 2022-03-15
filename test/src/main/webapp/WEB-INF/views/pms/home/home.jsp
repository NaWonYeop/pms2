<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<div class="content-wrapper">
	<div class="row">
		<div class="col-md-12 grid-margin">
			<div class="row">
				<div class="col-12 col-xl-8 mb-4 mb-xl-0">
					<h3 class="font-weight-bold">Welcome Aamir</h3>
					<h6 class="font-weight-normal mb-0">
						All systems are running smoothly! You have <span
							class="text-primary">3 unread alerts!</span>
					</h6>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-6 grid-margin stretch-card">
			<div class="card tale-bg">
				<div class="card-people mt-auto">
					<img src="resources/pms/images/dashboard/people.svg" alt="people">
					<div class="weather-info">
						<div class="d-flex">
							<div>
								<h2 class="mb-0 font-weight-normal">
									<i class="icon-sun mr-2"></i>31<sup>C</sup>
								</h2>
							</div>
							<div class="ml-2">
								<h4 class="location font-weight-normal">Bangalore</h4>
								<h6 class="font-weight-normal">India</h6>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-6 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<p class="card-title">Order Details</p>
					<p class="font-weight-500">The total number of sessions within
						the date range. It is the period time a user is actively engaged
						with your website, page or app, etc</p>
					<div class="d-flex flex-wrap mb-5">
						<div class="mr-5 mt-3">
							<p class="text-muted">Order value</p>
							<h3 class="text-primary fs-30 font-weight-medium">12.3k</h3>
						</div>
						<div class="mr-5 mt-3">
							<p class="text-muted">Orders</p>
							<h3 class="text-primary fs-30 font-weight-medium">14k</h3>
						</div>
						<div class="mr-5 mt-3">
							<p class="text-muted">Users</p>
							<h3 class="text-primary fs-30 font-weight-medium">71.56%</h3>
						</div>
						<div class="mt-3">
							<p class="text-muted">Downloads</p>
							<h3 class="text-primary fs-30 font-weight-medium">34040</h3>
						</div>
					</div>
					<canvas id="order-chart"></canvas>
				</div>
			</div>
		</div>
	</div>
</div>