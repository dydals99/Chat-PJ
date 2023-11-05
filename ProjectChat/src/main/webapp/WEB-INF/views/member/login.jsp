<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function loginValidate(f)
{
	if(f.email.value==""){
		alert("아이디를 입력하세요");
		f.email.focus();
		return false;
	}
	if(f.password.value==""){
		alert("패스워드를 입력하세요"); 
		f.password.focus();
		return false;
	} 
}
</script>
<h2>login</h2>
	<form action="login_act" method="post" onsubmit="return loginValidate(this);">
			<input type="text" name="email" />
			<input type="password" name="password" />
			<button>확인</button>
	</form>
</body>
</html>