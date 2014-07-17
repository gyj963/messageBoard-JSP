<%@ page import="database.DBUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="javabean.User" %>
<%--
  Created by IntelliJ IDEA.
  User: 高英健
  Date: 13-10-20
  Time: 下午1:50
  Function:登陆的用户数据丢到数据库里检查看有没有对应的数据
           如果有数据则登陆成功，跳转到登陆成功的转场页
           如果没有数据则登录失败，跳转到登录失败的转场页
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path=request.getContextPath();
//    传来的数据做字符转换处理以免产生乱码
    request.setCharacterEncoding("utf-8");
    String username=request.getParameter("username");
    String password=request.getParameter("pwd");

    Connection conn= DBUtil.getConnection();
    try{
        String sql="select * from messageboard_user where username=? and password=?";
        PreparedStatement ps=conn.prepareStatement(sql);
        ps.setString(1,username);
        ps.setString(2,password);
        ResultSet rs=ps.executeQuery();
//        如果有数据就跳转到登陆成功的转场页
        if(rs.next()){
            String college=rs.getString("college");
            String classes=rs.getString("class");
            String imgName=rs.getString("imgName");

            User user=new User();
            user.setUserName(username);
            user.setCollege(college);
            user.setClasses(classes);
            user.setImgName(imgName);
            session.setAttribute("User",user);
//            跳转至登陆成功转场页
            response.sendRedirect(path+"/login/jsp/login_success.jsp");
        }
//        没有在数据库找到数据跳转至登陆失败转场页
        else{
            response.sendRedirect(path+"/login/jsp/login_false.jsp");
        }
        rs.close();
        ps.close();
    }catch (Exception e){
        e.printStackTrace();
    }finally {
        conn.close();
    }
%>