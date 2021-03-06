<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>교수상담예약사이트</title>
	    		<!--common file-->
	    		<jsp:include page="common_file.jsp"></jsp:include>
				<!--//common file-->
<script type="text/javascript">
<!--


$(function(){
	$('.rollover').each(function(){
		var a = $(this);
		var img = a.find('img');
		var src_off = img.attr('src');
		var src_on = src_off.replace('_off','_on');
		$('<img />').attr('src',src_on);
		a.hover(function(){
			img.attr('src',src_on);
		},function(){
			img.attr('src',src_off);
		});
	});
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
	                <embed src="image/main.swf" quality="high" wmode="transparent"  id="onResize_example" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.adobe.com/go/getflashplayer_kr" />
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
			</div>				


	        <!--메인섹션-->
	        <div id="section2">
	        	<h1>|교수소개</h1><hr/>
	        	

















<ul class="profsList">
	<li><div>
		<span class="pic"><img alt="이충기" src="image/1.gif"/></span>
			<div class="txt">
			<span>성 명 : 이충기</span>
			<span>직 책 : 주임교수</span>
			<span>연락처 : 031-330-6780</span>
		</div>
	</li>
	<li>
		<span class="pic"><img alt="권동섭" src="image/2.gif"/></span>
		<div class="txt">
			<span>성 명 : 권동섭</span>
			<span>직 책 : 부교수</span>
			<span>연락처 : 031-330-6785</span>
		</div>
	</li>
	<li>
		<span class="pic"><img alt="권세동" src="image/3.gif"/></span>
			<div class="txt">
			<span>성 명 : 권세동</span>
			<span>직 책 : 겸임조교수</span>
			<span>연락처 : </span>
		</div>
	</li>
	<li>
		<span class="pic"><img alt="김상균" src="image/4.gif"/></span>
			<div class="txt">
			<span>성 명 : 김상균</span>
			<span>직 책 : 부교수</span>
			<span>연락처 : 031-330-6443</span>
		</div>
	</li>
	<li>
		<span class="pic"><img alt="김상귀" src="image/5.gif"/></span>
			<div class="txt">
			<span>성 명 : 김상귀</span>
			<span>직 책 : 겸임부교수</span>
			<span>연락처 : </span>
		</div>
	</li>
	<li>
		<span class="pic"><img alt="김상운" src="image/6.gif"/></span>
			<div class="txt">
			<span>성 명 : 김상운</span>
			<span>직 책 : 교수</span>
			<span>연락처 : 031-330-6437</span>
		</div>
	</li>
	<li>
		<span class="pic"><img alt="류연승" src="image/7.gif"/></span>
			<div class="txt">
			<span>성 명 : 류연승</span>
			<span>직 책 : 교수</span>
			<span>연락처 : 031-330-6781</span>
		</div>
	</li>
	<li>
		<span class="pic"><img alt="박영배" src="image/8.gif"/></span>
			<div class="txt">
			<span>성 명 : 박영배</span>
			<span>직 책 : 명예교수</span>
			<span>연락처 : </span>
		</div>
	</li>
	<li>
		<span class="pic"><img alt="박현민" src="image/9.gif"/></span>
			<div class="txt">
			<span>성 명 : 박현민</span>
			<span>직 책 : 교수</span>
			<span>연락처 : 031-330-6442</span>
		</div>
	</li>
	<li>
		<span class="pic"><img alt="신민호" src="image/10.gif"/></span>
			<div class="txt">
			<span>성 명 : 신민호</span>
			<span>직 책 : 조교수</span>
			<span>연락처 : </span>
		</div>
	</li>
	<li>
		<span class="pic"><img alt="신성효" src="image/11.gif"/></span>
			<div class="txt">
			<span>성 명 : 신성효</span>
			<span>직 책 : 겸임조교수</span>
			<span>연락처 : </span>
		</div>
	</li>
	<li>
	<span class="pic"><img alt="윤병주" src="image/12.gif"/></span>
			<div class="txt">
			<span>성 명 : 윤병주</span>
			<span>직 책 : 교수</span>
			<span>연락처 : 031-330-6439</span>
		</div>
	</li>
	<li>
		<span class="pic"><img alt="이강선" src="image/13.gif"/></span>
			<div class="txt">
			<span>성 명 : 이강선</span>
			<span>직 책 : 교수</span>
			<span>연락처 : 031-330-6444</span>
		</div>
	</li>
	<li>
		<span class="pic"><img alt="이동철" src="image/14.gif"/></span>
			<div class="txt">
			<span>성 명 : 이동철</span>
			<span>직 책 : 겸임교수</span>
			<span>연락처 : </span>
		</div>
	</li>
	<li>
		<span class="pic"><img alt="이명호" src="image/15.gif"/></span>
			<div class="txt">
			<span>성 명 : 이명호</span>
			<span>직 책 : 부교수</span>
			<span>연락처 : 031-330-6783</span>
		</div>
	</li>
	<li>
	<span class="pic"><img alt="장혁수" src="image/16.gif"/></span>
			<div class="txt">
			<span>성 명 : 장혁수</span>
			<span>직 책 : 교수</span>
			<span>연락처 : 031-330-6778</span>
		</div>
	</li>
	<li>
	<span class="pic"><img alt="전종훈" src="image/17.gif"/></span>
			<div class="txt">
			<span>성 명 : 전종훈</span>
			<span>직 책 : 교수</span>
			<span>연락처 : 031-330-6441</span>
		</div>
	</li>
	<li>
	<span class="pic"><img alt="조세형" src="image/18.gif"/></span>
			<div class="txt">
			<span>성 명 : 조세형</span>
			<span>직 책 : 교수</span>
			<span>연락처 : 031-330-6779</span>
		</div>
	</li>
	<li>
		<span class="pic"><img alt="주우석" src="image/19.gif"/></span>
			<div class="txt">
			<span>성 명 : 주우석</span>
			<span>직 책 : 교수</span>
			<span>연락처 : 031-330-6438</span>
		</div>
	</li>
	<li>
		<span class="pic"><img alt="최성운" src="image/20.gif"/></span>
			<div class="txt">
			<span>성 명 : 최성운</span>
			<span>직 책 : 교수</span>
			<span>연락처 : 031-330-6440</span>
		</div>
	</li>
	<li>
	<span class="pic"><img alt="한승철" src="image/21.gif"/></span>
			<div class="txt">
			<span>성 명 : 한승철</span>
			<span>직 책 : 조교수</span>
			<span>연락처 : 031-330-6434</span>
		</div>
	</li>
	<li>
		<span class="pic"><img alt="홍석원" src="image/22.gif"/></span>
			<div class="txt">
			<span>성 명 : 홍석원</span>
			<span>직 책 : 교수</span>
			<span>연락처 : 031-330-6777</span>
		</div>
	</li>
</ul>
</div>














	       
	        <!--//메인섹션-->
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


	</div>
</body>
</html>
	