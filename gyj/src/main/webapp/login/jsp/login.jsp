<%@ page contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
%>
<html>
<!--
	<head>标签
	内容：页面属性、标题、css样式表
   	作者：景焱
   	最后修改时间：2013.10.17
-->
<head>
<!--登陆表单填写的检查-->
<script type="text/javascript">
function check()
{
    if(form1.username.value=="")
    {
        alert("请输入用户名");
        return false;
    }
    if(form1.pwd.value=="")
    {
        alert("请输入密码");
        return false;
    }
    return true;
}
</script>
<!-- 页面名称：登陆 -->
<title>登陆</title>
<!--以下是样式表  -->
<style type="text/css">
#apDiv2 {
	position:absolute;
	width:386px;
	height:351px;
	z-index:0;
	left: 687px;
	top: 144px;
	}
	body {
	background-image: url();
	background-repeat: no-repeat;
}
#apDiv3 {
	position:absolute;
	width:481px;
	height:65px;
	z-index:1;
	left: 172px;
	top: 54px;
	color: #000;
	text-decoration: none;
}
#apDiv3 table tr td p {
	font-family: "黑体";
	font-size: 36px;
	text-decoration: none;
}
#apDiv2 table tr td form table tr td {
	font-family: "黑体";
	font-size: 16px;
}
#apDiv1 {
	position:absolute;
	width:396px;
	height:468px;
	z-index:2;
	left: 129px;
	top: 134px;
}
#apDiv4 {
	position:absolute;
	width:82px;
	height:31px;
	z-index:3;
	left: 1020px;
	top: 75px;
}
</style>
<!-- head标签结束 -->
</head>
<!-- 主体部分 -->
<body>
<!-- apDiv3 主要内容是网页标题 同学录の留言板 -->
<div id="apDiv3" style="top: 54px; left: 227px;">
  <table height="55" border="0" align="left" cellpadding="0" cellspacing="0" style="left: 0px; width: 385px;">
    <tr>
      <td width="343" height="55" valign="bottom"><p>同学录の留言板<br></p></td>
      <td width="127" height="55" valign="bottom">好久不联系...<br></td>
    </tr>
  </table>
  <!-- apDiv4 主要内容 注册 超文本标记  链接到注册页（）user_add.jsp-->
  <div id="apDiv4" style="top: 34px; left: 875px;"><a href="<%=path%>/register/jsp/register.jsp">注册</a></div>
</div>
<!-- apDiv1 内容是登陆页上的图案 -->
<div id="apDiv1" style="top: 157px; left: 71px;"><img src="../img/login.jpg" style="left: 0px; width: 627px; top: 0px; height: 390px;"/></div>
<!-- apDiv2 主表单 用户名和密码框 -->
<div id="apDiv2" style="top: 253px; left: 751px; height: 231px;">
	<form name="form1"  method="post" action="<%=path%>/login/jsp/user_check.jsp" >
		<table cellspacing="1" cellpadding="1" border="0" style="left: 1px; width: 344px;">
			<tr class="td_header">
				<td height="44" colspan="2" align="center" valign="top"  > <p style="font-size:18px">用户登陆&nbsp;&nbsp; <br></p></td>
			</tr>
			<tr>
				<td width="141" height="43" > &nbsp;&nbsp;&nbsp;&nbsp; 用户名：</td>
				<td width="227"> 
					<input name="username" type="text" id="username" /><a style="color:red">*</a>
				</td>
			</tr>
			<tr>
				<td height="36">&nbsp;&nbsp;&nbsp;&nbsp; 密 &nbsp;&nbsp;码：</td>
				<td>
					<input name="pwd" type="password" id="pwd" /><a style="color:red">*</a>
				</td>
			</tr>
			<tr>
				<td height="78" colspan="2" align="center">
					<input type="submit" class="button" onclick="return check()" style="width:150px" value="登陆" />
	 			</td>
	 		</tr>
	  </table>
	</form>
</div>

</body>
</html>