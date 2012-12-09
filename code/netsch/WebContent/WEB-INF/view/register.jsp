<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
$(document).ready(function(){
	
	$('#pop_phone_number').keypress(function(event){
	    if (event.which && (event.which > 47 && event.which < 58 || event.which == 8)) {
	    } else {
	        event.preventDefault();
	    }
	});
	
	$('#confirm').click(function(){
		var user_id = $('#pop_user_id').val();
		if(user_id==""){
			alert('아이디를 입력해 주세요');
			$('#pop_user_id').select();
			return false;
		}
		var user_pass 		= $('#pop_user_pass').val();
		if(user_pass==""){
			alert('패스워드 입력해 주세요');
			$('#pop_user_pass').select();
			return false;
		}
		var user_name		 = $('#pop_user_name').val();
		if(user_name==""){
			alert('이름을 입력해 주세요');
			$('#pop_user_name').select();
			return false;
		}
		var user_email		 = $('#pop_user_email').val();
		if(user_email==""){
			alert('이메일을 입력해 주세요');
			$('#pop_user_email').select();
			return false;
		}
		var phone_number= $('#pop_phone_number').val();
		if(phone_number==""){
			alert('전화번호를 입력해 주세요');
			$('#pop_phone_number').select();
			return false;
		}
		
		var re_user_pass 		= $('#re_pop_user_pass').val();
		if(re_user_pass!=user_pass){
			alert('패스워드가 서로 틀립니다');
			$('#pop_user_pass').select();
			return false;			
		}
		$('#registerForm').submit();
	});
});
</script>
    <link href="css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }

    </style>
    <link href="css/bootstrap-responsive.css" rel="stylesheet">

  </head>

  <body>

      <form class="form-signin" action="register_ok.do"  method="post" id="registerForm">
        ID : <input type="text"  name="user_id" class="input-block-level" placeholder="ID" id="pop_user_id" maxlength="15">
        PassWord : <input type="password" name="user_pass" class="input-block-level" placeholder="Password" id="pop_user_pass" maxlength="15">
        PassWord(re) : <input type="password" name="re_user_pass" class="input-block-level" placeholder="Password" id="re_pop_user_pass" maxlength="15">
        Name : <input type="text"  name="user_name" class="input-block-level" placeholder="Name" id="pop_user_name" maxlength="15">
        Email : <input type="text"  name="user_email" class="input-block-level" placeholder="Email" id="pop_user_email" maxlength="50">
         Phone : <input type="text"  name="phone_number" class="input-block-level" placeholder="010-0000-0000" id="pop_phone_number" maxlength="15">
         Class : 
         <div style="text-align:left;margin-top:10px">
         <input type="radio"  name="user_role"  value="S" checked>학생
         <input type="radio"  name="user_role"  value="P">교수
		</div>
         <div style="text-align:center;margin-top:10px">
        <button class="btn btn-primary" type="button" id="confirm">확인</button>
        </div>
      </form>
    <script src="js/bootstrap.js">
    </script>

  </body>

</html>