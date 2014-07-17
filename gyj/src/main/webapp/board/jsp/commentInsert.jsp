<%@ page import="database.DBUtil" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="javabean.Comment" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="javabean.User" %>
<%--
  Created by IntelliJ IDEA.
  User: 高英健
  Date: 13-10-5
  Time: 下午10:49
  Function:评论的添加后台--通过commentInsert_function.js调用
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
//    留言者信息
    User user=(User)session.getAttribute("User");
    String userName=user.getUserName();
    String college=user.getCollege();
    String classes=user.getClasses();
    String imgName=user.getImgName();
    System.out.println(userName);
    System.out.println(college);
    System.out.println(classes);
    System.out.println(imgName);
//    评论对应的留言的id
    Integer content_id=Integer.valueOf(request.getParameter("content_id"));
//    评论内容
    String content=request.getParameter("content");
//    评论时间
    Date time=new Date();
    Calendar c=Calendar.getInstance();
    time=c.getTime();

//    评论信息存入comment javabean
    Comment com=new Comment();
    com.user.setUserName(userName);
    com.user.setCollege(college);
    com.user.setClasses(classes);
    com.user.setImgName(imgName);
    com.setContent(content);
    com.setContent_id(content_id);
    com.setTime(time);

//    将评论信息存入数据库
    Connection conn= DBUtil.getConnection();
    try{
        String sql="insert into messageboard_comment values(seq_comment.nextval,?,?,?,?,0)";
        PreparedStatement ps=conn.prepareStatement(sql);
        ps.setInt(1, content_id);
        ps.setString(2,userName);
        ps.setString(3,content);
        ps.setTimestamp(4, new Timestamp(time.getTime()));
        int count=ps.executeUpdate();

//        获取刚刚存入的评论的ID
        String selSql="select seq_comment.currval from dual";
        Statement stm=conn.createStatement();
        ResultSet rs=stm.executeQuery(selSql);

        int id=0;
        if(rs.next()){
            id=rs.getInt(1);
            com.setId(id);
        }

//        后台打印新增评论的信息
        System.out.println("新增评论添加了"+count+"行");
        System.out.println("ID:"+id);
        System.out.println("content_id:"+content_id);
        System.out.println("author:"+userName);
        System.out.println("content:"+content);
        System.out.println("time:"+ com.getTime());

//        将存入了新增评论信息的javabean以json形式传回
        ObjectMapper om=new ObjectMapper();
        String json=om.writeValueAsString(com);
        out.print(json);
        ps.close();
        conn.close();
    }catch(Exception e){
        e.printStackTrace();
    }
%>
