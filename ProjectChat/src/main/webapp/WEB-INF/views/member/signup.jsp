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
function signupValidate(f)
{
	if(f.email.value==""){
		alert("이메일을 입력하세요");
		f.email.focus();
		return false;
	}
	if(f.name.value==""){
		alert("이름을 입력하세요"); 
		f.password.focus();
		return false;
	} 
	if(f.password.value==""){
		alert("패스워드를 입력하세요"); 
		f.password.focus();
		return false;
	} 
}
</script>
<h2>join sign up</h2>
	<form action="signup_act" method="post" onsubmit="return signupValidate(this);">
			이메일<input type="text" name="email"/>
			이름<input type="text" name="name"/>
			비밀번호<input type="password" name="password" />
			<button>확인</button>
	</form>	
</body>
</html>