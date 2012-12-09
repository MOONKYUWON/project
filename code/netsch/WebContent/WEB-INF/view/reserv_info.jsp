<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
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
	                <embed src="image/main1.swf" quality="high" wmode="transparent"  id="onResize_example" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.adobe.com/go/getflashplayer_kr" />
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
	        <div id="section2">
			<!--메인섹션-->
	        	<h1>|예약확인</h1><hr/>
	        	<table class="listtable_txt">
	        		<colgroup>
	        			<col width="20%">
	        			<col width="30%">
	        			<col width="*">
	        		</colgroup>
	        		<tr>
			        	<%if("P".equals((String)session.getAttribute("user_role"))){   		%>
	        			<th>학생명</th>
	        			<%} %>
			        	<%if("S".equals((String)session.getAttribute("user_role"))){   		%>
	        			<th>교수명</th>
	        			<%} %>
	        			<th>상담일</th>
	        			<th>상담시간</th>	        			
	        		</tr>
	             <c:choose>
			        <c:when test="${empty list}">
			            <tr><td colspan="3">예약 목록이 없습니다.</td></tr>
			        </c:when>
			       <c:otherwise> 
			    	 <c:forEach items="${list}" var="list" >  
			              <tr>
			                <td>${list.user_name}</td>
			                <td>${list.counsel_date}</td>
			                <td>${list.counsel_starttime} ~ ${list.counsel_endtime}</td>
			              </tr>
	                 </c:forEach>
				   </c:otherwise>
				</c:choose>
	        	</table>
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
	