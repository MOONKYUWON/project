<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
  		<!--common file-->
  		<jsp:include page="common_file.jsp"></jsp:include>
  		   <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  		           <script src="js/jbootstrap.js"></script>
	<!--//common file-->
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
	<script>
	$(document).ready(function(){
		$('#user_pass').keypress(function(e){
			if(e.keyCode==13){
				$('#frmThis').submit();
			}	
		});
		
		$('#btn_login').click(function(){
			$('#frmThis').submit();
			
		});
		 
		$('#btn_register').click(function(){
		    var dialog = $('<div id="formDialog"></div>').dialog({
		        autoOpen: false,
		        modal: true,
		        height: 700,
		        width: 600,
	            show: "blind",
	            hide: "explode",
		        title: '회원 가입하기',
		        close: function( event, ui ) {	$('#frmDialog').remove();	}
		    });
		    $(dialog).load("goRegister.do", function(){
		        $(this).dialog('open'); 
		    });

		});
	});
	</script>
  </head>

  <body>

    <div class="container">

      <form class="form-signin" action="login_ok.do"  method="post"  id="frmThis">
        <h2 class="form-signin-heading">Please sign in</h2>
        <input type="text"  name="user_id" id="user_id" class="input-block-level" placeholder="ID">
        <input type="password" name="user_pass"  id="user_pass" class="input-block-level" placeholder="Password">

        <div style="text-align:center">
        <input class="btn btn-primary" type="button" value="Log in" id="btn_login" >
		<input type="button" class="btn btn-danger"  id="btn_register" value="회원가입">
		</div>
      </form>

    </div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

  </body>

</html>