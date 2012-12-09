<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<style>
.btn-danger{font-weight:900;}
</style>
<script src="js/jbootstrap.js"></script>
    <script>
    
	var array_avail_days = [];
	
    $(function() {
    	jQuery.each($('#calendarForm input[name =avail_day]'), function(i, val){
    		array_avail_days.push($(this).val().toString());
    	});    	
    	
        $( "#datepicker" ).datepicker({
        	dateFormat: "yy-mm-dd",
        	beforeShowDay: chkAvailDay,
            onSelect: function(dateText, inst) {
                var startDate = new Date(dateText);
                var selDay = startDate.getDay();
                $('#popSendForm input[name=avail_day]').val(selDay);
                
             }
        });
    });
    
    function dialogClose(){
    	$('#frmDialog').remove();
    }

    // 예약하기 버튼 누르면 실행 달력에 있는 날짜와 상담 시작시간과 끝나는 시간 정보를 저장하여 서버로 보냄 
    function save(th){
    	
    	$('#popSaveForm #counsel_date').val($('#popSendForm #datepicker').val());
    	$('#popSaveForm #counsel_starttime').val($(th).parent().parent().find('span[span_name=startTime]').text().replace(":","").trim());
    	$('#popSaveForm #counsel_endtime').val($(th).parent().parent().find('span[span_name=endTime]').text().replace(":","").trim());
	   	 $.post('insertSchDetail.do',  $('#popSaveForm').serialize(), function(data) {
		 		alert(data.message);
		});
		
    }
    
    function chkAvailDay(date) {
    	var day = date.getDay().toString();

    	if($.inArray(day, array_avail_days) == -1){
    		return [false, ""];
    	}
	        return [true,"",""];
  }
    //조회하기 누르면 실행
    function search(){
		 $.post('searchReserve.do',  $('#popSendForm').serialize(), function(data) {
			 $('#infoSchTable tr').not(':eq(0)').remove();
			 $('#searchResultTable tr').not(':eq(0)').remove();
			 
			 var newTr = '';
			 var newTd = '';
			 var startTime = '';
			 var endTime = '';
			 var dataPickerValue = $('#popSendForm #datepicker').val();
			 jQuery.each(data.infoList, function(i, val){
				 newTr = $('<tr></tr>');
				 startTime = '<td><span span_name="startTime">' +  val.start_time.substring(0, 2) + ':' +val.start_time.substring(2, 4)+ '</span> ~';
				 endTime = '<span span_name="endTime"> ' +  val.end_time.substring(0, 2) + ':' +val.end_time.substring(2, 4)+ '</span></td><td><input type="button" class="btn-mini btn-danger" id="btn_reserve" itemId="btn_reserve"  value="예약" '
				 + 'onClick="save(this)"/></td>';
				 newTd = startTime+endTime;
				 newTr.append(newTd);
				 $('#infoSchTable').append(newTr);
			 });
			 
			 //조회하기 이후 예약한 사람들 리스트를 가져옴
			 if(data.list.length == 0){  //한명도 없으면
				 newTr = $('<tr></tr>');
				newTd = $('<td colspan="2">예약된 학생이 없습니다.</td>');
				 newTr.append(newTd);
				 $('#searchResultTable').append(newTr);
			 }else{
				 jQuery.each(data.list, function(i, val){
					 newTr = $('<tr></tr>');
					newTd = '<td>' +  val.user_name + '</td>'
					+'<td td_name=search_td>' +  val.counsel_starttime.substring(0, 2) + ':' + val.counsel_starttime.substring(2, 4) + '~'
					+val.counsel_endtime.substring(0, 2) + ':' + val.counsel_endtime.substring(2, 4) + '</td>';
					 newTr.append(newTd);
					 $('#searchResultTable').append(newTr);
				 });
				
			 }

			 //예약된 시간이 있으면 버튼을 감춤
			 var chk_info_array =[];
			 var temp_start_time ='';
			 var temp_end_time ='';
			 var temp_sum ='';
			 var temp_search_td = '';
			 var isMatched = false;
			 
			 jQuery.each($('#searchResultTable tr').not(':eq(0)'), function(i, val){
				 temp_search_td = $(this).find('td[td_name=search_td]').text().trim().replace(/[:]/g, '').replace(/[~]/g, '');
				 chk_info_array.push(temp_search_td);
			 });
			 
			 jQuery.each($('#infoSchTable tr').not(':eq(0)'), function(i, val){
				 isMatched = false;
				 temp_start_time = $(this).find('span[span_name=startTime]').text().trim().replace(':', '');
				 temp_end_time = $(this).find('span[span_name=endTime]').text().trim().replace(':', '');
				 temp_sum = temp_start_time+temp_end_time;
				 $.each(chk_info_array, function(i, val){
					 
						if(val == temp_sum){
							isMatched = true;
							return false;
						}
				 });
;
				 if(isMatched == true){
					 $(this).find('input[type=button]').hide();
				 }
				 
			 });
			 
		});
    }
    </script>
    <form id="calendarForm">
    	 <c:forEach items="${list}" var="list" >  
                <input type="hidden" name="avail_day"  value="${list.avail_day}" data-name = "avail"/>
	    </c:forEach>
	</form>
	
    <form id="popSaveForm">
                <input type="hidden" name="counsel_date" id="counsel_date" value="" />
                <input type="hidden" name="counsel_starttime"  id="counsel_starttime"  value="" />
                <input type="hidden" name="counsel_endtime" id="counsel_endtime"  value="" />
                <input type="hidden" name="user_id" id="user_id"  value="${user_id}" />
	</form>

    <form id="popSendForm">
<p>Date: <input type="text" id="datepicker" readonly="readonly"  name="counsel_date"/><input type="hidden"  name="user_id" value="${user_id}"/><input type="button" value="조회하기" class="btn-mini btn-inverse" onclick="search()" style="margin-left:20px"/></p>
	<input type="hidden"  name="avail_day"  value=""/>
	</form>
	<div id="infoSch" style="margin-top:25px">
		<table id="infoSchTable" class="listtable_txt" >
		<colgroup>
			<col width="70%">
			<col width="*">
		</colgroup>
		<tr>
			<th colspan="2">상담시간</th>
		</tr>
		</table>
	</div>
	<div id="searchResult" style="margin-top:45px">
		<table id="searchResultTable" class="listtable_txt">
		<tr>
			<th>상담예약자</th>
			<th>예약시간</th>
		</tr>
		</table>
	</div>