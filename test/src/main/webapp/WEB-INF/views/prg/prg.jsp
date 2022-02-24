<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<ul id="ul" class="list-group list-group-flush">
	<li class="list-group-item">li.m_category
		<ul class="list-group list-group-flush">
			<li class="list-group-item">li.s_category</li>
			<li class="list-group-item">li.s_category</li>
			<li class="list-group-item">li.s_category</li>
			<li class="list-group-item">li.s_category</li>
		</ul>
	</li>
	<%-- 	<c:forEach items="${list}" var="li">
	</c:forEach> --%>
</ul>
<script>
	$(function(){
		$.ajax({
		    url: "/selectListAll", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
		    method: "GET",   // HTTP 요청 메소드(GET, POST 등)
		    dataType: "json" // 서버에서 보내줄 데이터의 타입
		})
		// HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
		.done(function(json) {
		    $("<h1>").text(json.title).appendTo("body");
		    $("<div class=\"content\">").html(json.html).appendTo("body");
		})
		// HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
		.fail(function(xhr, status, errorThrown) {
		    $("#text").html("오류가 발생했다.<br>")
		    .append("오류명: " + errorThrown + "<br>")
		    .append("상태: " + status);
		});
		
		
		
		
		$("#btn").click(function(){
			
		});
	});
</script>