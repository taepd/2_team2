<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty sessionScope.userid||!(sessionScope.userid eq 'admin')}">
<script>location.href='Ex02_JDBC_Login.jsp'</script>
</c:if>
