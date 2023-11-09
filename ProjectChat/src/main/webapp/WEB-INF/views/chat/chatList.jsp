<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${not empty siteUserInfo}">
	<table>
		<tr>
			<td>이름:${userName}</td>
			<td>내용:${chatting }<button onclick="">참여하기</button></td>
		</tr>
	</table>
</c:if>
</body>
</html> 