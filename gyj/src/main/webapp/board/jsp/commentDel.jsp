<%@ page import="java.sql.Connection" %>
<%@ page import="database.DBUtil" %>
<%@ page import="java.sql.Statement" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%--
  Created by IntelliJ IDEA.
  User: 高英健
  Date: 13-10-5
  Time: 下午10:50
  Function:评论的删除后台--通过commentDel_function.js调用
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
//    评论ID
    Integer com_id=Integer.valueOf(request.getParameter("com_id"));
    System.out.println("删除了评论："+com_id);

    Connection conn= DBUtil.getConnection();
    try{
        String sql="update messageboard_comment set del=1 where id="+com_id;//数据库中del标记为1表示已删除
        Statement stmt=conn.createStatement();
        int count=stmt.executeUpdate(sql);
        System.out.println("删除"+count+"条评论成功");
        out.print("true");
        stmt.close();
    }catch (Exception e){
        e.printStackTrace();
    }finally {
        conn.close();
    }
%>