<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javabean.Message" %>
<%@ page import="javabean.Comment" %>
<%@ page import="javabean.Image" %>
<%@ page import="javabean.User" %>
<%@ page import="database.*" %>
<%--
  Created by IntelliJ IDEA.
  User: 高英健
  Date: 13-10-1
  Time: 下午4:58
  Function:通讯录界面
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
//      测试各种PATH
//    System.out.println("request.getContextPath():"+path);
//    String apath=request.getServletPath();
//    System.out.println("request.getServletPath():"+apath);
//    String bpath=request.getRealPath("");
//    System.out.println("request.getRealPath(\"\"):"+bpath);

//  当前用户信息
    User user=new User();
    String currentUser="登录";
    if(session.getAttribute("User")==null)
    {
        response.sendRedirect(path+"/login/jsp/login.jsp");
    }else{
        user=(User)session.getAttribute("User");
        currentUser=user.getUserName();
    }
    int userid=Integer.parseInt(request.getParameter("userid"));
    User thisuserinfo = SelectUser.selectById(userid);
    String thisuserinfo_username=thisuserinfo.getUserName();
    String thisuserinfo_college=thisuserinfo.getCollege();
    String thisuserinfo_class=thisuserinfo.getClasses();
    String thisuserinfo_headimg=thisuserinfo.getImgName();
    String thisuserinfo_phone=thisuserinfo.getPhone()!=null?thisuserinfo.getPhone():"无";
    String thisuserinfo_memo=thisuserinfo.getMemo()!=null?thisuserinfo.getMemo():"无";
%>

<html>
<head>
    <title>通讯录</title>
    <link href="<%=path%>/addressBook/css/body.css" rel="stylesheet" type="text/css" />
    <link href="<%=path%>/addressBook/css/content.css" rel="stylesheet" type="text/css" />
    <%--<link href="<%=path%>/addressBook/css/list.css" rel="stylesheet" type="text/css" />--%>
    <link href="<%=path%>/addressBook/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="<%=path%>/addressBook/css/bootstrap-theme.css" rel="stylesheet" type="text/css" />
    <link href="<%=path%>/addressBook/css/page.css" rel="stylesheet" type="text/css" />
    <link href="<%=path%>/addressBook/css/jquery.dataTables.css" rel="stylesheet" type="text/css" />
    <script src="<%=path%>/addressBook/script/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="<%=path%>/addressBook/script/jquery.dataTables.js" type="text/javascript"></script>
    <script src="<%=path%>/addressBook/script/bootstrap.min.js" type="text/javascript"></script>
    <script src="<%=path%>/addressBook/script/plugins.js" type="text/javascript"></script>
    <script src="<%=path%>/addressBook/script/dataTable.bootstrap.js" type="text/javascript"></script>

    <%--<link rel="stylesheet" href="<c:url value="/css/chosen.css"/>"/>--%>
</head>

<body style="background-color: #011828;">
<div class="main">

    <!--标题-->
    <div class="main_title">
        <div class="text"></div>
    </div>
    <!--工具栏(注销登录)-->
    <div class="toolbar" style=" position:absolute;top:5;right: 20;">
        <a href="<%=path%>/board/jsp/display.jsp"
           style="color: rgb(209, 251, 204);text-decoration: none;margin-right: 10px">
            留言板
        </a>
        <a href="<%=path%>/login/jsp/login.jsp"
           style="color: rgb(251,244,189);text-decoration: none;">
            当前用户：<%=currentUser%>（注销登录）
        </a>
    </div>
    <!--通讯录-->
    <div class="board">
        <div class="panel panel-default" style="padding-bottom: 15px;margin-bottom: 0px">
            <div class="panel-heading" style="position: relative">同学详细信息
                <a onclick="history.go(-1)"
                   style="text-decoration: none;position:absolute;right: 20px;cursor: pointer">返回</a>
            </div>
            <div class="cusForm"><img src="/showImg?imgName=<%=thisuserinfo_headimg%>" width=140 height=140 style="float:left">
                <div style="clear:none;">
                    <table class="table detail" style="width: 60%;margin-left: 35%">
                        <tr>
                            <th style="border: none;font-size: 40px">姓名</th>
                            <td style="border: none;font-size: 40px;color: #046a8b"><%=thisuserinfo_username%></td>
                        </tr>
                    </table>
                </div>
            </div>
            <table class="table detail" style="margin: 0% 5% 0% 0%">
                <tr>
                    <th>学院</th>
                    <td><%=thisuserinfo_college%></td>
                    <th>班级</th>
                    <td><%=thisuserinfo_class%></td>
                </tr>
                <tr>
                    <th>手机</th>
                    <td><%=thisuserinfo_phone%></td>
                    <th>备注</th>
                    <td><%=thisuserinfo_memo%></td>
                </tr>
            </table>
        </div>
    </div>

    <%--相关信息展示--%>
    <div class="information">
        <div class="info_title">
            我的信息
        </div>
        <div class="info_content">
            <p>我的大名:<%=user.getUserName()%></p>
            <p>我的学院:<%=user.getCollege()%></p>
            <p>我的班级:<%=user.getClasses()%></p>
        </div>
    </div>
</div>
</body>

</html>