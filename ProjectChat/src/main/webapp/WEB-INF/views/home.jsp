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
	<h2>Chat</h2>
		<c:choose>
			<c:when test="${not empty sessionScope.siteUserInfo }">
				<h4>아이디:${sessionScope.siteUserInfo.email }</h4>
				<h4>이름:${sessionScope.siteUserInfo.name }</h4>
				<button onclick="location.href='logout';">로그아웃</button>
				 <table>
					<tr>
						<td>이름</td>  
						<td>이전대화</td> 
					</tr>
				  </table>
			</c:when>
			<c:otherwise>
				<a href="login">로그인</a>
				<a href="signup">회원가입</a>
			</c:otherwise>
		</c:choose>
</body>
</html>