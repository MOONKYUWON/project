<%@page import="org.springframework.http.HttpRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
$(document).ready(function(){
	
	$('#goWriteProfSch').click(function(){
	    var dialog = $('<div id="formDialog"></div>').dialog({
	        autoOpen: false,
	        modal: true,
	        height: 700,
	        width: 500,
            show: "blind",
            hide: "explode",
	        title: '시간 설정',
	        close: function( event, ui ) {	$('#formDialog').remove();	}
	    });
	    $(dialog).load("writeProfSch.do", function(){
	        $(this).dialog('open'); 
	    });

	});
});
</script>
	    		<!--메뉴-->
	    		<div class="navbar">
	        		<ul>
	        			<li><a href="main.do" class="rollover"><img src="image/btn_0_off.png" alt="Home" title="Home" class="hover" /></a></li>
	        			<li><a href="prof_info.do" class="rollover"><img src="image/btn_2_off.png" alt="교수소개" title="교수소개" class="hover" /></a></li>
			        	<%if("S".equals((String)session.getAttribute("user_role"))){   		%>
			        	<li><a href="listNetschCounsel.do" class="rollover"><img src="image/btn_3_off.png" alt="상담예약" title="상담예약" class="hover" /></a></li>
			        	<%} %>
			        	<%if("P".equals((String)session.getAttribute("user_role"))){   		%>
			        	<li><a href="#" class="rollover" id="goWriteProfSch"><img src="image/btn_5_off.png" alt="시간예약" title="시간예약" class="hover" /></a></li>
			        	<%} %>
			        	<li><a href="reserv_info.do" class="rollover"><img src="image/btn_4_off.png" alt="예약확인" title="예약확인" class="hover" /></a></li>
			        </ul>
				</div>
				<!--//메뉴-->