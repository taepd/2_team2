<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("userId");
	String userName = request.getParameter("userName");
	String userPass = request.getParameter("userPass");
	String userPassCheck = request.getParameter("userPassCheck");
	String gender = request.getParameter("gender");
	String userEmail = request.getParameter("userEmail");
	String userSsn = request.getParameter("userSsn1")
			+ "-"+request.getParameter("userSsn2").charAt(0)+"******";
	String userZipCode = request.getParameter("userZipCode");
	String userAddr = request.getParameter("userAddr1")
			+request.getParameter("userAddr2");
	String userPhone = request.getParameter("userPhone");
	String[] hobby = request.getParameterValues("hobby");
	String userBirthday = request.getParameter("year")
			+"년 "+request.getParameter("month")+"월 "
			+request.getParameter("day")+"일 ";
	


%>        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	서버에서 응답<br>
	ID : <%= userId %><br>
	이름 : <%= userName %><br>
	패스워드 : <%= userPass %><br>
	성별 : <%= gender %><br>
	이메일 : <%= userEmail %><br>
	주민번호 : <%= userSsn %><br>
	우편번호 : <%= userZipCode %><br>
	주소 : <%= userAddr %><br>
	핸드폰번호 : <%= userPhone %><br>
	취미:
	<%
		for(String str: hobby){
	%>
		<%=str %>&nbsp;
	<%		
		}
	%><br> 
	생년월일 : <%= userBirthday %><br>	

</body>
</html>