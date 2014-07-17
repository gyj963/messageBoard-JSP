<%@ page import="java.sql.Connection" %>
<%@ page import="database.DBUtil" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%--
  Created by IntelliJ IDEA.
  User: 高英健
  Date: 13-10-4
  Time: 下午5:29
  Function：留言的删除
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
//    留言ID
    String id=request.getParameter("id");
    System.out.println("删除了留言："+id);

    Connection conn= DBUtil.getConnection();
    try{
        String sql="update messageboard_message set del=1 where id=?";
        PreparedStatement ps=conn.prepareStatement(sql);
        ps.setString(1,id);
        int count=ps.executeUpdate();
        System.out.println("删除了"+count+"条留言");
        out.print("true");//删除成功
        ps.close();
        conn.close();
    }catch (Exception e){
        e.printStackTrace();
    }finally {
        conn.close();
    }

%>