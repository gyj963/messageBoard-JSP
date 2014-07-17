<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 13-10-1
  Time: 下午4:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String path = request.getContextPath();
    out.println(path);
    response.sendRedirect(path+"/login/jsp/login.jsp");
%>
<html>
<head>
    <title></title>
</head>
<body>
<a href="<%=path%>/board/jsp/display.jsp">进入留言板</a>
</body>
</html>

