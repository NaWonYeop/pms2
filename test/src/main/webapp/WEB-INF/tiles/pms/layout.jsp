<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title><tiles:getAsString name="pmstitle" /></title>

<!-- plugins:css -->
<link rel="stylesheet" href="resources/pms/vendors/feather/feather.css">
<link rel="stylesheet"
	href="resources/pms/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="resources/pms/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="resources/pms/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet"
	href="resources/pms/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" type="text/css"
	href="resources/pms/js/select.dataTables.min.css">
<!-- End plugin css for this page -->
<!-- endinject -->
<link rel="shortcut icon" href="resources/pms/images/favicon.png" />
<!-- inject:css -->
<link rel="stylesheet"
	href="resources/pms/css/vertical-layout-light/style.css">
<!-- <script src="resources/js/jquery-3.2.1.min.js"></script> -->
<!-- plugins:js -->
<script src="resources/pms/vendors/js/vendor.bundle.base.js"></script>
</head>
<body>

	<div class="container-scroller">
		<!-- partial:partials/_navbar.html -->
		<tiles:insertAttribute name="pmsheader" />
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_settings-panel.html -->
			<tiles:insertAttribute name="pmssetting" />
			<tiles:insertAttribute name="pmsrside" />
			<!-- partial -->
			<!-- partial:partials/_sidebar.html -->
			<tiles:insertAttribute name="pmslside" />
			<!-- partial -->
			<div class="main-panel">
				<tiles:insertAttribute name="pmsbody" />
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.html -->
				<tiles:insertAttribute name="pmsfooter" />
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->

	
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script src="resources/pms/vendors/chart.js/Chart.min.js"></script>
	<script src="resources/pms/vendors/datatables.net/jquery.dataTables.js"></script>
	<script
		src="resources/pms/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
	<script src="resources/pms/js/dataTables.select.min.js"></script>

	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<!-- <script src="resources/pms/js/off-canvas.js"></script>
	<script src="resources/pms/js/hoverable-collapse.js"></script> -->
	<!-- <script src="resources/pms/js/template.js"></script> -->
	<script src="resources/pms/js/settings.js"></script>
	<script src="resources/pms/js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<!-- <script src="resources/pms/js/dashboard.js"></script> -->
	<!-- <script src="resources/pms/js/Chart.roundedBarCharts.js"></script> -->
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	<!-- End custom js for this page-->


</body>
</html>