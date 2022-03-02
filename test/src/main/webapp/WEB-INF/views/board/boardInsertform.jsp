<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <section class="breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner text-center">

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

  <!-- ================ contact section start ================= -->
  <section class="contact-section section_padding">
    <div class="container">
      


      <div class="row">
        <div class="col-12">
                 <div class="col-12">
         			<h2 class="contact-title col-9" style="display: inline-block;">게시판 등록</h2>
          			<c:if test="${sessionUser.user_ath eq  'master'}">
          			<h4 class="col-2" style="display: inline-block;">공지여부<input type="checkbox" id="confirm-checkbox"> <label
            for="confirm-checkbox"></label></h4>
          			</c:if>
          			
        </div>
        </div>
        <div class="col-lg-12">
          <form class="form-contact contact_form" onsubmit="return checkbox()" action="freeboardInsert" method="post" id="contactForm" novalidate="novalidate">
            <div class="row">
              <div class="col-12">
                <div class="form-group">
                  <input class="form-control" name="brd_ttl" id="brd_ttl" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Subject'" placeholder = 'Enter Subject'>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  
                    <textarea class="form-control w-100" name="brd_cnt" id="brd_nct" cols="30" rows="9" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Message'" placeholder = 'Enter Message'></textarea>
                </div>
              </div>
        
             <input type="hidden" id="user_id" name="user_id" value="${sessionUser.user_id }">
             <input type="hidden" id="brd_ntc_prop" name="brd_ntc_prop" value="0">
             
            </div>
            <div class="form-group mt-3" style="display: inline-block;" >
              <button type="submit" class="button button-contactForm btn_1" >등록</button>
            </div>
          </form>
        </div>
   
      </div>
    </div>
  </section>
  <script type="text/javascript">
  console.log(${sessionUser.user_ath});
  function checkbox() {
		if ($('input:checkbox').is(':checked') == true)
			{
				$("#brd_ntc_prop").val("1");			
			}
		return true;
	}
  </script>
</body>
</html>