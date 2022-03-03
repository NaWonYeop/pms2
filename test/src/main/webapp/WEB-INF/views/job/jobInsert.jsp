<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .name {
            font-weight: bold;
            font-size: large;
        }

        .button {
            margin-right: 2%;
        }
    </style>
</head>
<body>
	<div class="container">
        <div class="row">
            <div class="col-12">
                <h2 class="contact-title">등록하기</h2>
            </div>
            <div class="col-lg-8">
            <form class="form-contact contact_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <p>이름</p>
                            <div class="name">김고기</div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="form-group">
                        <p>제목</p>
                        <input class="form-control" name="title" id="title" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Title'" placeholder = 'Enter Title'>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="form-group">
                            <p>내용</p>
                            <textarea class="form-control w-100" name="content" id="content" cols="30" rows="9" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Content'" placeholder = 'Enter Content'></textarea>
                        </div>
                    </div>
                    <div class="col-9">
                        <div class="form-group mt-3">
                            <button type="submit" class="button">등록하기</button>
                            <button type="submit" class="button">취소하기</button>
                        </div>
                    </div>
                </div>
                
            </form>
            </div>
            <div class="col-lg-4">
            <div class="media contact-info">
                <span class="contact-info__icon"><i class="ti-home"></i></span>
                <div class="media-body">
                <h3>Buttonwood, California.</h3>
                <p>Rosemead, CA 91770</p>
                </div>
            </div>
            <div class="media contact-info">
                <span class="contact-info__icon"><i class="ti-tablet"></i></span>
                <div class="media-body">
                <h3>00 (440) 9865 562</h3>
                <p>Mon to Fri 9am to 6pm</p>
                </div>
            </div>
            <div class="media contact-info">
                <span class="contact-info__icon"><i class="ti-email"></i></span>
                <div class="media-body">
                <h3>support@colorlib.com</h3>
                <p>Send us your query anytime!</p>
                </div>
            </div>
            </div>
        </div>
    </div>
</body>
</html>