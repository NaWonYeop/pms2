<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>로그인 폼</title>
<style>
@import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");

html {
	height: 100%;
}

body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding-top: 200px;
	padding-bottom: 40px;
	font-family: "Nanum Gothic", arial, helvetica, sans-serif;
	background-repeat: no-repeat;
}

.card {
	margin: 0 auto; /* Added */
	float: none; /* Added */
	margin-bottom: 10px; /* Added */
}

#btn-Yes {
	background-color: #e4932b;
	border: none;
}

.login .form-control {
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
}

.checkbox {
	margin-right: 20px;
	text-align: right;
}

.card-title {
	margin-left: 30px;
}

.links {
	text-align: center;
	margin-bottom: 10px;
}

a {
	color: #f58b34;
	text-decoration: none;
}

.check {
	color: red;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

	<div class="card align-middle" style="width:25rem;">
		<div class="card-title" style="margin-top:30px;">
		</div>
      <form action="userUpdateForm" method="post">
       
		<div class="card-body">
  
        <input type="text" name="id" id="id" class="form-control" placeholder="수정할 자격증" value="${user_email }" autofocus required>
        <BR>
        <input id="date" type="date"  onchange="fnc()" name="id" 
					 class="form-control" placeholder="수정할 취득날짜"  required><br>
          <input type="number" name="name" id="name" class="form-control" placeholder="수정할 경력"  required><br>
           <input type="text" name="tel" id="tel" class="form-control" placeholder="수정할 첨부파일"  required><br>
        
         <p id="check" class="check">${login_msg}</p><br/>
        <input id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit" value="개발자 정보수정">
        </div>
      </form>
		</div>
		<script type="text/javascript">

	function cancel() {
		location.href="home";
	}

	function formCheck() {
		var confirmation = confirm("등록하시겠습니까?")
		if (confirmation == true) {
			return true;
		} else {
			return false;
		}
		
	}
	function fnc() {
        var di=document.getElementById("date");
        console.log(di.value);
    }
	
</script>
		
</body>

</html>