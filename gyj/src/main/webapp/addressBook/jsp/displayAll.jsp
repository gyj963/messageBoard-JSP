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

//    格式化时间
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd    HH:mm:ss");
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
%>

<html>
<head>
    <title>通讯录</title>
    <link href="<%=path%>/addressBook/css/body.css" rel="stylesheet" type="text/css" />
    <link href="<%=path%>/addressBook/css/content.css" rel="stylesheet" type="text/css" />
    <%--<link href="<%=path%>/addressBook/css/list.css" rel="stylesheet" type="text/css" />--%>
    <link href="<%=path%>/addressBook/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="<%=path%>/addressBook/css/bootstrap-theme.css" rel="stylesheet" type="text/css" />
    <link href="<%=path%>/addressBook/css/jquery.dataTables.css" rel="stylesheet" type="text/css" />
    <script src="<%=path%>/addressBook/script/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="<%=path%>/addressBook/script/jquery.dataTables.js" type="text/javascript"></script>
    <script src="<%=path%>/addressBook/script/bootstrap.min.js" type="text/javascript"></script>
    <script src="<%=path%>/addressBook/script/plugins.js" type="text/javascript"></script>
    <script src="<%=path%>/addressBook/script/dataTable.bootstrap.js" type="text/javascript"></script>
    <script type="text/javascript">
            $(function(){
                $(".dataTable").dataTable();
            });
    </script>
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
          <div  id="tableDiv" class="panel" style="height:500px">
              <div class="panel-heading"><strong>所有同学信息</strong></div>
              <div class="panel-body" >
                  <form  name="frm" method="post">
                      <%--<c:if test="${userList!=null&&userList.size()>0}">--%>
                          <table width="100%" class="table table-condensed table-striped dataTable table-bordered  table-hover">
                              <thead>
                              <tr style="background: #d7e6ea">
                                  <th scope="col" width="15%" >序号</th>
                                  <th scope="col" width="20%">姓名</th>
                                  <th scope="col" width="25%">学院</th>
                                  <th scope="col" width="20%">班级</th>
                                  <th scope="col" width="20%">详细</th>
                              </tr>
                              </thead>
                              <tbody>
                              <%
                                  ArrayList userList = SelectUser.selectAll();
                                  for(int j=0;j<userList.size();j++){
                                      User addressuser = (User)userList.get(j);
                                      int addressuser_index=j+1;
                                      String addressuser_username=addressuser.getUserName();
                                      String addressuser_college=addressuser.getCollege();
                                      String addressuser_class=addressuser.getClasses();
                                      int addressuser_id=addressuser.getUserid();
                              %>
                                  <tr>
                                      <td><%=addressuser_index%></td>
                                      <td><%=addressuser_username%></td>
                                      <td><%=addressuser_college%></td>
                                      <td><%=addressuser_class%></td>
                                      <%--<td><a id="del"  class="btn btn-default btn-xs " role="button" href="<c:url value="/bill/billDel.action?billId=${li.billId}"/>" onclick="return delBill()">删&nbsp;&nbsp;除</a></td>--%>
                                      <td><a class="btn btn-default btn-xs " role="button" href="personinfodetail.jsp?userid=<%=addressuser_id%>">详&nbsp;&nbsp;细</a></td>
                                  </tr>
                              <%}%>
                              </tbody>
                          </table>
                  </form>
              </div>
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