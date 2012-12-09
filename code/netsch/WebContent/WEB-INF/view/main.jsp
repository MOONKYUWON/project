<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>교수상담예약사이트</title>
 		<jsp:include page="common_file.jsp"></jsp:include>
<script type="text/javascript">
<!--
$(function() {
	$("#image_list").jQBanner({	//롤링을 할 영역의 ID 값
		nWidth:120,					//영역의 width
		nHeight:130,				//영역의 height
		nCount:20,					//돌아갈 이미지 개수
		isActType:"up",				//움직일 방향 (left, right, up, down)
		nOrderNo:1,					//초기 이미지
		nDelay:1500					//롤링 시간 타임 (1000 = 1초)
		/*isBtnType:"li"*/			//라벨(버튼 타입) - 여기는 안쓰임
		}
	);
	
});
//-->
</script>



</head>

<body>

	<div id="wrap">
		<!--header-->
		<div id="header">
	    	<div class="header_area">
	        	<div class="top_area">
	            	<h1 class="logo"><img src="image/logo.png" alt="교수상담예약사이트" /></h1>
	                <div id="login_main" >
	                	<a href="logout.do">
	                		<%=session.getAttribute("user_name") %>님 환영 합니다.<img class="input-image" src="image/btn_logout.gif" alt="로그아웃" />
	                	</a>
	                </div>
	            </div>
	        </div>
	        <!--메인플래시이미지-->
	        <div id="fullscreen">
	        	<!--
	        	<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" name="onResize_example" width="100%" height="430" align="middle" id="onResize_example">
	        		<param name="allowScriptAccess" value="sameDomain" />
	        		<param name="allowFullScreen" value="false" />
	                <param name="movie" value="image/main4.swf" />
	                <param name="quality" value="high" />
	                <param name="wmode" value="transparent" />-->
	                <embed src="image/main4.swf" quality="high" wmode="transparent"  id="onResize_example" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.adobe.com/go/getflashplayer_kr" />
	            <!--</object>-->
	        </div>
	        <!--//메인플래시이미지-->
	    </div>
	    <!--//header-->


	    <!--containter-->
	    <div id="container">
	    	<div id="section1">
	    		<!--메뉴-->
	    		<jsp:include page="navbar.jsp"></jsp:include>
				<!--//메뉴-->
				<br>
			</div>



	        <div id="section2">
	        	<div class="notice">
	        		<!--공지사항-->
	        		<div id="tabWrap">
	                    <ul class="tab">
	                        <li><h1>	|Home</h1></li>
	                    </ul>
	                    <div id="content1">
         					<img src="image/visual_02.jpg">
		                </div>
		                <script type="text/javascript">initTabMenu("tabWrap");</script>
		            <noscript>공지사항탭구성</noscript>
		            <!--//공지사항-->
		        </div>
			</div>
		</div>
		    <div id="section3">
<!-- 		    	<a href="prof_info.do"><h1>	|교수페이지 바로가기</h1></a><br/>
		    	<div id="image_list">
					<div class="clsBannerScreen">
						<div class="images" style="display:block"><a href=""><img src="image/1.gif" alt="이충기"/></a></div>
						<div class="images"><a href=""><img src="image/2.gif" alt="권동섭"/></a></div>
						<div class="images"><a href=""><img src="image/3.gif" alt="권세동"/></a></div>
						<div class="images"><a href=""><img src="image/4.gif" alt="김상균"/></a></div>
						<div class="images"><a href=""><img src="image/5.gif" alt="김상귀"/></a></div>
						<div class="images"><a href=""><img src="image/6.gif" alt="김상운"/></a></div>
						<div class="images"><a href=""><img src="image/7.gif" alt="류연승"/></a></div>
						<div class="images"><a href=""><img src="image/8.gif" alt="박영배"/></a></div>
						<div class="images"><a href=""><img src="image/9.gif" alt="박현민"/></a></div>
						<div class="images"><a href=""><img src="image/10.gif" alt="신민호"/></a></div>
						<div class="images"><a href=""><img src="image/11.gif" alt="신성효"/></a></div>
						<div class="images"><a href=""><img src="image/12.gif" alt="윤병주"/></a></div>
						<div class="images"><a href=""><img src="image/13.gif" alt="이강선"/></a></div>
						<div class="images"><a href=""><img src="image/14.gif" alt="이동철"/></a></div>
						<div class="images"><a href=""><img src="image/15.gif" alt="이명호"/></a></div>
						<div class="images"><a href=""><img src="image/16.gif" alt="장혁수"/></a></div>
						<div class="images"><a href=""><img src="image/17.gif" alt="전종훈"/></a></div>
						<div class="images"><a href=""><img src="image/18.gif" alt="조세형"/></a></div>
						<div class="images"><a href=""><img src="image/19.gif" alt="주우석"/></a></div>
						<div class="images"><a href=""><img src="image/20.gif" alt="최성운"/></a></div>
						<div class="images"><a href=""><img src="image/21.gif" alt="한승철"/></a></div>
						<div class="images"><a href=""><img src="image/22.gif" alt="홍석원"/></a></div>
					</div>
				</div>
 -->			</div>
		</div>
	</div>
		<!--containter-->


	    <!--footer-->
		<div id="copyright">
			<P>명지대학교 컴퓨터공학과 웹프로그래밍 프로젝트.</P>
			<P>Made by. 문규원 박남영 권순길 김가람</P>	
			<P>Adress : (우)449-728 경기도 용인시 처인구 명지로 116(031)330-6114</P>
			<p>Tel: 010-2373-6630</p>
			<p>Email: k211191@nate.com
			<p>Copyright ⓒ 2012 MYONGJI UNIV Student. All Rights Reserved.</p>
		</div>
</body>
</html>