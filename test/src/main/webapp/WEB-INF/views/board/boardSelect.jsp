<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="breadcrumb ">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner text-center">
						<div class="breadcrumb_iner_item">
							<h2>Blog Single</h2>
							<p>
								Home<span>-</span>Blog Single
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->
	<!--================Blog Area =================-->
	<section class="blog_area single-post-area section_padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 posts-list">
					<div class="single-post">

						<div class="blog_details">
							<h2>${board.brd_ttl }</h2>
							<ul class="blog-info-link mt-3 mb-4">
								<li><i class="far fa-user"></i> 
									${board.user_name }
									</li>
								<li><i class="far fa-comments"></i></li>
							</ul>
							<h3>${board.brd_cnt }</h3>

						</div>
					</div>
					<div class="navigation-top">
						<div class="d-sm-flex justify-content-between text-center">

							<div class="col-sm-4 text-center my-2 my-sm-0">
								<!-- <p class="comment-count"><span class="align-middle"><i class="far fa-comment"></i></span> 06 Comments</p> -->
							</div>
							<ul class="social-icons">
								<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
								<li><a href="#"><i class="fab fa-twitter"></i></a></li>
								<li><a href="#"><i class="fab fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fab fa-behance"></i></a></li>
							</ul>
						</div>
						<div class="navigation-area">
							
						</div>
					</div>
				</div>

				<div class="comments-area col-12">
					<h4 class="fa-comments"></h4>
					<div class="comment-list comin">
						
					</div>

				</div>
				<div class="comment-form col-lg-12">
					<h4>Leave a Reply</h4>
					<form class="form-contact comment_form" action="rplInsert" id="commentForm">
						
							<div class="col-12">
								<div class="form-group">
									<textarea class="form-control w-100" name=rpl_cnt
										id="rpl_cnt" cols="30" rows="9" placeholder="Write Comment"></textarea>
								</div>
							</div>
							<input type="hidden" name="brd_id" id="brd_id" value="${board.brd_id }">
							<input type="hidden" name="user_id" id="user_id" value="${sessionUser.user_id }">
							<div class="form-group mt-3 text-right">
								<button type="submit" class="button btn_1 button-contactForm">add
									Reply</button>
							</div>
					</form>
				</div>
			</div>
			<c:if test="${sessionUser.user_id eq board.user_id }">
			<form action="freeboardUpdateform">
				<input type="submit" class="genric-btn info-border radius" value="수정"></button>
				<input type="hidden" name="brd_id" id="brd_id" value="${board.brd_id }">
			</form>
			<form action="freeboardDelete">
				<input type="submit" class="genric-btn info-border radius" value="삭제"></button>
				<input type="hidden" name="brd_id" id="brd_id" value="${board.brd_id }">
			</form>
			</c:if>
		</div>
		</div>
	</section>

	<script>
		$(function() {
			$.ajax({
				url : "replyList",
				type : "GET",
				data : {
					brd_id : "${board.brd_id}"
				}
			}).done(function(result) {
				for (var i = 0; i < result.length; i++) {	
					var date=result[i].rpl_reg_date;
						

						$(".comin").append(`
								<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-between d-flex">
									<div class="desc">
										<h2 class="comment comcntin">\${result[i].rpl_cnt}</h2>
										<div class="d-flex justify-content-between ">
											<div class="d-flex align-items-center">
												<h4 class="idd" value="\${result[i].rpl_id}" name="\${result[i].user_id}">
													\${result[i].user_name}
												</h4>
												<p class="date">
												\${result[i].rpl_date_string}
												
												
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>	
						`);
				}			
				$(".fa-comments").html(result.length + "comments");			
			}).done(function(){$(".idd[name='${sessionUser.user_id}']").each(function(index,item){
					console.log(item);
					console.log($(item).attr('value'));
					var obj="<a href='rplDelete?id="+$(item).attr('value')+"'>삭제<a>"
					
					
					$(item).append(obj)
			})	   } 
			
			);//done끝
		});//ajax끝
		
		
	</script>
</body>
</html>