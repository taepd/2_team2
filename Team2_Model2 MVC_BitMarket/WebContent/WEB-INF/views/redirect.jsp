<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String msg = (String)request.getAttribute("msg");
  String url = (String)request.getAttribute("url");
  
  if(msg != null && url != null){
%>
	<script>
		alert('<%= msg %>');		
	    location.href='<%=url%>';
	</script>
	
<%	  
  }
%>