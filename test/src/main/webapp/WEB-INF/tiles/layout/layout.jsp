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


 <link rel="icon" href="resources/main/img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/main/css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="resources/main/css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="resources/main/css/owl.carousel.min.css">
    <!-- themify CSS -->
    <link rel="stylesheet" href="resources/main/css/themify-icons.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="resources/main/css/flaticon.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="resources/main/css/magnific-popup.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="resources/main/css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="resources/main/css/style.css">
	 <link rel="stylesheet" href="resources/main/css/nice-select.css">

<script src="resources/css/bootstrap.css"></script>
<script src="resources/css/bootstrap.min.css"></script>
<script src="resources/js/bootstrap.js"></script>
<script src="resources/js/bootstrap.js"></script>
<script src="resources/js/jquery-3.2.1.min.js"></script>


<title><tiles:getAsString name="title" /></title>
</head>
<body>
	 <!--::header part start::-->
    <tiles:insertAttribute name="header" />
    <!-- Header part end-->

    <tiles:insertAttribute name="body" />

    <!-- footer part start-->
    <tiles:insertAttribute name="footer" />
    <!-- footer part end-->

    <!-- jquery plugins here-->
    <!-- jquery -->
    <script src="resources/main/js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="resources/main/js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="resources/main/js/bootstrap.min.js"></script>
    <!-- easing js -->
    <script src="resources/main/js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="resources/main/js/swiper.min.js"></script>
    <!-- swiper js -->
    <script src="resources/main/js/masonry.pkgd.js"></script>
    <!-- particles js -->
    <script src="resources/main/js/owl.carousel.min.js"></script>
    <script src="resources/main/js/jquery.nice-select.min.js"></script>
    <!-- swiper js -->
    <script src="resources/main/js/slick.min.js"></script>
    <script src="resources/main/js/jquery.counterup.min.js"></script>
    <script src="resources/main/js/waypoints.min.js"></script>
    <!-- custom js -->
    <script src="resources/main/js/custom.js"></script>
</body>
</html>