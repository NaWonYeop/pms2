<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<body>
	<!-- 검색창 시작 -->
	<div class="row justify-content-center">
		<div class="col-sm-7">
			<aside class="single_sidebar_widget search_widget">
				<form id="search-form0">
					<div class="form-group">
						<div class="input-group mb-3">
							<div class="form-select" id="default-select" style="width: 25%;">
								<select name="type">
									<option value="" selected>전체</option>
									<option value="fnd">펀딩</option>
									<option value="ofr">구인</option>
								</select>
							</div>
							<input type="text" name="keyword" class="form-control"
								placeholder='프로젝트명을 입력해 주세요' onfocus="this.placeholder = ''"
								onblur="this.placeholder = '프로젝트명을 입력해 주세요'">
							<div class="input-group-append">
								<button class="btn" type="button" id="0" onclick="getSerchList()">
									<i class="ti-search"></i>
								</button>
							</div>
						</div>
					</div>
					<!-- 페이징 1페이지부터 2개씩 보여줄꺼다-->
					<input type="hidden" name="pageNum" value="1"> <input
						type="hidden" name="amount" value="2">
				</form>
			</aside>
		</div>
	</div>
	<!-- 검색창 끝 -->

	<div id="list">내용 들어올곳</div>

	<div id="page">페이지</div>

	<script type="text/javascript">
		function getSerchList() {
			console.log("");
			
		
			$.ajax({
				type : 'GET',
				url : "/prj/projectSerchList",
				data : $("#search-form0").serialize(),
				dataTyep: "json",
				success : function (result) {
					console.log("검색 하러감?");
					console.log(result);
					$(".card").remove();
					$(".page").remove();
					var totalPage = result.page;
					for(var i=0; i<totalPage; i++){
						$("#page").append(`
								<div class="page">
								\${result.page}
								\${result.type}
								\${result.keyword}
								<form id="search-form`+(i+1)+`" onclick="getpageList()" >
									<input type="submit" name="pageNum" class="b" id="`+(i+1)+`" value="`+(i+1)+`" >
									<input type="hidden" name="type" value="\${result.type}">
									<input type="hidden" name="keyword" value="\${result.keyword}">
									<input type="hidden" name="amount" value="\${result.amount}">
								</from>
								</div>
								`);
					}
					
					
					for (var a of result.projects){
						console.log(a);
						$("#list").append(`
								<div class="card">
								\${a.prj_id}
								\${a.prj_name}
								</div>
								`);
						for(var b in a){
							console.log("여기 좀 멈추자");
							console.log(a);
							console.log(b);
							console.log("");
						}
						
					}
				
				
					
				}
			
			})
			/* .done(console.log("갔다옴?"))
			.fail(function(data){
                console.log("에러남");
                callback(data);
            }); */
	
		}
		
		function getpageList() {
			console.log("");
		}
		
		
		function createDiv() {
			
		}
		
		
	</script>
</body>
</html>