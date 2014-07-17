<%--
  Created by IntelliJ IDEA.
  User: 高英健
  Date: 13-10-20
  Time: 下午3:52
  Function:注册失败的转场页
           2秒跳转至注册页
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path=request.getContextPath();
%>
<html>
<head>
    <title>注册失败</title>
    <%--<meta name='keywords' content='$webdb[metakeywords]'>--%>
    <style type='text/css'>
        A
        {
            text-decoration: none;
        }
        a:hover
        {
            text-decoration: underline;
        }
        BODY
        {
            font-family: Verdana;
            font-size: 12px;
            margin: 0;
            color: #000000;
            background: #ffffff;
        }
        TD
        {
            border-right: 1px;
            border-top: 0px;
            font-size: 9pt;
            color: #000000;
        }
        .index_font
        {
            color: #3A4F6C;
            background-color: #EBEBEB;
            font-weight: bold;
            padding: 5px;
        }
    </style>
</head>

<meta http-equiv='refresh' CONTENT='2;URL=<%=path%>/register/jsp/register.jsp'>
<body vlink='#333333' link='#333333'>
<br>
<table width='100%' border='0' cellspacing='0' cellpadding='0' height='90%' align='center'>
    <tr align='center' valign='middle'>
        <td>
            <table border='0' cellspacing='1' cellpadding='10' bgcolor='#666666' width='600'>
                <tr>
                    <td class='index_font' align='center' bgcolor="#9999cc">
                        <p>
                            <meta content="Microsoft FrontPage 4.0" name="GENERATOR">
                            <style>
                                .proccess
                                {
                                    background: #ffffff;
                                    border-bottom: 1px solid;
                                    border-left: 1px solid;
                                    border-right: 1px solid;
                                    border-top: 1px solid;
                                    height: 8px;
                                    margin: 3px;
                                    width: 8px;
                                }
                            </style>
                        <div align="center">
                            <table align="center" height="70%" valign="middle">
                                <tbody>
                                <tr>
                                    <td align="middle">
                                        <!--  Displaytext-->
                                        已有此用户名   <font class="fontbig">请重新注册.....
                                        <!--End Displaytext-->
                                        <div align="center">
                                            <form method="post" name="proccess">
                                                <script language="javascript">
                                                    for (i = 0; i < 30; i++) document.write("<input class=proccess>")
                                                </script>
                                            </form>
                                        </div>
                                    </font>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div align="center">
                                <script language="JavaScript">
                                    var p = 0, j = 0;
                                    var c = new Array("lightskyblue", "white")
                                    setInterval('proccess();', 100)
                                    function proccess() {
                                        document.forms.proccess.elements[p].style.background = c[j];
                                        p += 1;
                                        if (p == 30) { p = 0; j = 1 - j; }
                                    }
                                </script>
                            </div>
                        </div>
                        <a href='<%=path%>/register/jsp/register.jsp' class='index_font'>
                            如果您的浏览器没有自动跳转,请点击这里
                        </a></p>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>