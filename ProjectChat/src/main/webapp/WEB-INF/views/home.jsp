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
			<c:when test="${not empty siteUserInfo }">
				<h4>아이디:${siteUserInfo.email }</h4>
				<h4>이름:${siteUserInfo.name }</h4>
				<button onclick="location.href='logout';">로그아웃</button>
				<button onclick="location.href='chat';">채팅방 생성하기</button>
				<h3>채팅 목록</h3>
			</c:when> 
			<c:otherwise>
				<a href="login">로그인</a>
				<a href="signup">회원가입</a>
			</c:otherwise>
		</c:choose>
</body>
</html>