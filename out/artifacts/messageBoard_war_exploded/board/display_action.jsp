<%@ page import="javabean.messageboard_message" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="java.util.Calendar" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 13-10-3
  Time: 下午4:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String author=request.getParameter("author");
    String content=request.getParameter("content");
    Date time=new Date();

    Calendar c = Calendar.getInstance();
    time=c.getTime();
    System.out.println(time);

    messageboard_message mbm = new messageboard_message();
    mbm.setAuthor(author);
    mbm.setContent(content);
    mbm.setTime(time);

    ObjectMapper om=new ObjectMapper();
    String json=om.writeValueAsString(mbm);
    out.print(json);
%>