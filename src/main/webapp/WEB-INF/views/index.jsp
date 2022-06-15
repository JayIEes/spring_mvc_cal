<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/jsp/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--공통 CSS-->
<!-- <link rel="stylesheet" type="text/css" href="http://211.63.89.143/spring_mvc/common/CSS/main_20220321.css">  -->
<link rel="stylesheet" type="text/css" href="http://43.200.8.30/spring_mvc/common/CSS/main_20220321.css"> 
<style type="text/css">
th,table{border: 1px solid #cecece;}
.td{width:120px; text-align:left; vertical-align:top; height: 80px; border: 1px solid #cecece;}
.tdS{width:120px; text-align:left; vertical-align:top; height: 80px; border: 1px solid #d7e2e9;background-color: #E9F4FB;}
.sunTitle{width:120px; text-align:center; height: 20px; background-color: #E43B2E; font-weight: bold; color: #ffffff;}
.weekTitle{width:120px; text-align:center; height: 20px; background-color: #E9F1F6; font-weight: bold; color: #787878;}
.satTitle{width:120px; text-align:center; height: 20px; background-color: #89C1EF; font-weight: bold; color: #ffffff;}


.sunText{ font-weight: bold; color: red; }
.satText{ font-weight: bold; color: blue; }
.weekText{color: #333333; }
</style>
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

<script type="text/javascript">
$(function(){
	
});//ready

</script>
</head>
<body>
<div>
<div id="header">
	<div id="navbar">
		<c:import url="http://localhost/spring_mvc_work/common/jsp/navbar.jsp"/>
	</div>
</div>
<div id="container">
	<div id="calendarContainer">
	<% 
	Calendar cal=(Calendar)request.getAttribute("cal");
	int nowYear=cal.get(Calendar.YEAR);
	int nowMonth=cal.get(Calendar.MONTH)+1;
	//int nowDay=cal.get(Calendar.DAY_OF_MONTH);
	%>
	<div id="calendarHeader">
	<a href="calendar.do?param_month=<%=nowMonth-1==0?12:nowMonth-1%>&param_year=<%=
	nowMonth-1==0?nowYear-1:nowYear%>"><img src="<%=protocol+serverName+serverPath+common_img%>btn_prev.png"/></a>
	<span><%=nowYear%>.<%=nowMonth%></span>
	<a href="calendar.do?param_month=<%=nowMonth+1==13?1:nowMonth+1%>&param_year=<%=
	nowMonth+1==13?nowYear+1:nowYear%>"><img src="<%=protocol+serverName+serverPath+common_img%>btn_next.png"/></a>
	<a href="calendar.do" ><img src="<%=protocol+serverName+serverPath+common_img%>btn_today.png"/></a>
	</div>
	<div id="calendarContent">
	<table id="tableCal">
	<tr>
	<th class="sunTitle">일</th>
	<th class="weekTitle">월</th>
	<th class="weekTitle">화</th>
	<th class="weekTitle">수</th>
	<th class="weekTitle">목</th>
	<th class="weekTitle">금</th>
	<th class="satTitle">토</th>
	</tr>
	<tr>
	<%
	String dayCss="";
	for(int tempDay=1; tempDay<33;tempDay++){
		//증가하는 임시일자로 달력 객체의 일을 설정한다.
		cal.set(Calendar.DAY_OF_MONTH,tempDay);
		
		//설정된 일자를 가져와서 임시일자(tempDay)와 비교한다.
		//System.out.println(cal.get(Calendar.DAY_OF_MONTH)+"/"+tempDay);
		if(cal.get(Calendar.DAY_OF_MONTH)!=tempDay){
			//마지막 날 이후 칸 만들기 : cal 객체는 다음 달 1일을 가진다.
			for(int blankTd=cal.get(Calendar.DAY_OF_WEEK);blankTd<=Calendar.SATURDAY;blankTd++){
				
				%><td class="td"></td><% 
			}//end for
			
			break;
		}//end if
		
		switch(tempDay){//시작일이
		case 1: //1일이면 
		//1부터 1일의 요일 수보다 작을 때까지 공백 출력
			for(int blankTd=1;blankTd<cal.get(Calendar.DAY_OF_WEEK);blankTd++){
				
					%>
				<td class="td"></td>
				<%	
				}//end for
				
					
			}//switch
		
		
		//일요일이면 sunText, 평일이면 weekText, 토요일이면satText로 dayCss설정
		dayCss="weekText";
		switch(cal.get(Calendar.DAY_OF_WEEK)){
		case Calendar.SUNDAY: dayCss="sunText"; break;
		case Calendar.SATURDAY: dayCss="satText"; break;
		}//end switch
		
		
		if(tempDay==(int)request.getAttribute("today")&&nowMonth-1==Calendar.getInstance().get(Calendar.MONTH)){
			%>
			<td class="tdS"><div class="<%=dayCss%>"><%=tempDay %></div></td>
			<%
		}else{
	%>
	
	<td class="td"><div class="<%=dayCss%>"><%=tempDay %></div></td>
	<%
	}
		//토요일이면 줄 변경
		switch(cal.get(Calendar.DAY_OF_WEEK)){
		case Calendar.SATURDAY:
			%>
			</tr>
			<tr>
			<%
		}//end switch
}//end for
	%>
	</tr>
	</table>
	</div>
	</div>
	</div>
<div id="footer"></div>
</div>
</body>
</html>





