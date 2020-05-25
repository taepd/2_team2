<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<select name="job">
	<c:forEach var="job" items="${requestScope.joblist }" varStatus="status">
		<c:choose>
			<c:when test="${status.index } == 0">
				<option value="${job}" selected>${job}</option>
			</c:when>
			<c:otherwise>
				<option value="${job}">${job}</option>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</select>