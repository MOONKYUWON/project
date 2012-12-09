<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<style>
.btn-danger{font-weight:900;}
</style>
<script src="js/jbootstrap.js"></script>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.timepicker{width:80px;}
.ml15{margin-left: 15px;}
.btn-warning{font-weight:900;}
.btn-primary{font-weight:900;}
</style>
<script>

function del(th){
	$(th).parent().parent().remove();
}

$(document).ready(function(){
	$('.timepicker').timepicker({ 'timeFormat': 'H:i' });
	$(':input[name=end_time]').on('changeTime', function(a) {
		var start_time = $(this).parent().parent().find(':input[name=start_time]').val().replace(':', '');
		if( start_time >= $(this).val().replace(':', '')){
			alert('시작 시간 이후로 선택해 주세요');
			return false;
		}
	});
	
	$('#cancel').click(function(){
		$('#formDialog').dialog( "remove" );
	});

	
	$('#add_btn').click(function(){
		var newTr = '<tr tr_name="data_tr">'
			+'<td><select name="avail_day"  class="w_80">'
   			+'<option value=""  selected>--선택하세요--</option>'
   			+'<option value="MON" >월</option>'
   			+'<option value="TUE" >화</option>'
   			+'<option value="WED" >수</option>'
   			+'<option value="THU" >목</option>'
   			+'<option value="FRI" >금</option>'
   			+'</select></td>'
   			+'<td><input type="text" value="" class="timepicker" name="start_time"> ~ <input type="text" value="" class="timepicker" name="end_time"></td>'
   			+'<td><input type="button" value="삭제" onclick="del(this)" class="btn-mini btn-danger ml15"  /></td>'
   		+'</tr>';
   		$('#pop_schTable').append(newTr);
	   		$('.timepicker').timepicker({ 'timeFormat': 'H:i' });

	});

});

function save(){
	
	var cnt = $('#pop_schTable tr[tr_name=data_tr]');
	var avail_day = [];
	var start_time = [];
	var end_time = [];
	 var avail_day_temp;
	 var start_time_temp;
	 var end_time_temp;
	var valid = true;
	 
	jQuery.each(cnt, function(i, val){
			 avail_day_temp = $(this).find('select[name=avail_day] > option:selected').val();
			 start_time_temp = $(this).find(':input[name=start_time]').val().replace(":","");
			 end_time_temp = $(this).find(':input[name=end_time]').val().replace(":","");
			 if(start_time_temp ==''){
				 alert('시작 시간을 입력해 주세요');
				 $(this).find(':input[name=start_time]').select();
				 valid = false;
				 return false;
			 }
			 
			 if(end_time_temp ==''){
				 alert('끝나는 시간을 입력해 주세요');
				 $(this).find(':input[name=end_time]').select();
				 valid = false;
				 return false;
			 }
			 		 
			 avail_day.push(avail_day_temp);
			 start_time.push(start_time_temp);
			 end_time.push(end_time_temp);

	});
	
	if(valid == false){
		return false;
	}
	
	 $('#schForm #rCnt').val(cnt.length);	
	 $('#schForm input[name=avail_day]').val(avail_day);
	 $('#schForm input[name=start_time]').val(start_time);
	 $('#schForm input[name=end_time]').val(end_time);
	 $.post('insertProfSch.do',  $('#schForm').serialize(), function(data) {
		 		alert(data.message);
	});

	 
}
</script>
  </head>

  <body>
		<form name = "frmTest" method="post" action="insertProfSch.do" id="schForm" >
			<input type="hidden" name="avail_day" value=""/>
			<input type="hidden" name="start_time" value=""/>
			<input type="hidden" name="end_time" value=""/>
			<input type="hidden" name="rCnt"  id="rCnt" value=""/>
		</form>
	
      <form action="register_ok.do"  method="post" id="registerForm" >
      	<input type="button" value="추가"  id="add_btn"  class="btn-mini btn-warning"  style="margin-bottom:15px;"/>
      	<table class="listtable_txt" id="pop_schTable">
       		<colgroup>
       			<col width="10%">
       			<col width="*">
       			<col width="10%">
       		</colgroup>
       		<tr>
       			<th>요일</th>
       			<th>시간설정</th>
       			<th></th>
       		</tr>

             <c:choose>
		        <c:when test="${!empty list}"> 
			    	 <c:forEach items="${list}" var="list" >
			       		<tr tr_name = "data_tr">
			       			<td><select name="avail_day"  class="w_80">
			       			<option value="MON" <c:if test="${list.avail_day == 'MON'}"> selected</c:if>> 월</option>
			       			<option value="TUE"  <c:if test="${list.avail_day == 'TUE'}"> selected</c:if>>화</option>
			       			<option value="WED"  <c:if test="${list.avail_day == 'WED'}"> selected</c:if>>수</option>
			       			<option value="THU"  <c:if test="${list.avail_day == 'THU'}"> selected</c:if>>목</option>
			       			<option value="FRI"  <c:if test="${list.avail_day == 'FRI'}"> selected</c:if>>금</option>
			       			</select></td>
			       			<td><input type="text" value="${fn:substring(list.start_time,0,2)}:${fn:substring(list.start_time,2,4)}" class="timepicker" name="start_time"> ~ <input type="text" value="${fn:substring(list.end_time,0,2)}:${fn:substring(list.end_time,2,4)}" class="timepicker" name="end_time"></td>
			       			<td><input type="button" value="삭제" onclick="del(this)" class="btn-mini btn-danger ml15"  /></td>
			       		</tr>
					</c:forEach>
		        </c:when>
		       <c:otherwise> 
       		<tr tr_name = "data_tr">
       			<td><select name="avail_day"  class="w_80">
       			<option value="MON"  selected>월</option>
       			<option value="TUE" >화</option>
       			<option value="WED" >수</option>
       			<option value="THU" >목</option>
       			<option value="FRI" >금</option>
       			</select></td>
       			<td><input type="text" value="" class="timepicker" name="start_time"> ~ <input type="text" value="" class="timepicker" name="end_time"></td>
       			<td><input type="button" value="삭제" onclick="del(this)"class="btn-mini btn-danger ml15"  /></td>
       		</tr>
       		
       		<tr tr_name = "data_tr">
       			<td><select name="avail_day"  class="w_80">
       			<option value="MON" >월</option>
       			<option value="TUE"   selected>화</option>
       			<option value="WED" >수</option>
       			<option value="THU" >목</option>
       			<option value="FRI" >금</option>
       			</select></td>
       			<td><input type="text" value="" class="timepicker" name="start_time"> ~ <input type="text" value="" class="timepicker" name="end_time"></td>
       			<td><input type="button" value="삭제" onclick="del(this)"class="btn-mini btn-danger ml15"  /></td>
       		</tr>
       		
       		<tr tr_name = "data_tr">
       			<td><select name="avail_day"  class="w_80">
       			<option value="MON"  >월</option>
       			<option value="TUE" >화</option>
       			<option value="WED"  selected>수</option>
       			<option value="THU" >목</option>
       			<option value="FRI" >금</option>
       			</select></td>
       			<td><input type="text" value="" class="timepicker" name="start_time"> ~ <input type="text" value="" class="timepicker" name="end_time"></td>
       			<td><input type="button" value="삭제" onclick="del(this)"class="btn-mini btn-danger ml15"  /></td>
       		</tr>
       		
       		<tr tr_name = "data_tr">
       			<td><select name="avail_day"  class="w_80">
       			<option value="MON"  >월</option>
       			<option value="TUE" >화</option>
       			<option value="WED" >수</option>
       			<option value="THU"  selected>목</option>
       			<option value="FRI" >금</option>
       			</select></td>
       			<td><input type="text" value="" class="timepicker" name="start_time"> ~ <input type="text" value="" class="timepicker" name="end_time"></td>
       			<td><input type="button" value="삭제" onclick="del(this)"class="btn-mini btn-danger ml15"  /></td>
       		</tr>
       		
       		<tr tr_name = "data_tr">
       			<td><select name="avail_day"  class="w_80">
       			<option value="MON"  >월</option>
       			<option value="TUE" >화</option>
       			<option value="WED" >수</option>
       			<option value="THU" >목</option>
       			<option value="FRI"  selected>금</option>
       			</select></td>
       			<td><input type="text" value="" class="timepicker" name="start_time"> ~ <input type="text" value="" class="timepicker" name="end_time"></td>
       			<td><input type="button" value="삭제" onclick="del(this)"class="btn-mini btn-danger ml15"  /></td>
       		</tr>



				   </c:otherwise>
				</c:choose>
       	</table>
       	<div style="text-align:center;margin-top:30px">
       	<input type="button" value="저장"  onclick="save()" class=" btn-large btn-primary"   />
       	</div>
      </form>
  </body>

</html>