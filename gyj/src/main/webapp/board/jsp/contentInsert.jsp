<%@ page import="javabean.Message" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="database.DBUtil" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javabean.User" %>
<%--
  Created by IntelliJ IDEA.
  User: 高英健
  Date: 13-10-3
  Time: 下午4:54
  Function:留言的添加
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
//    留言内容
    String content=request.getParameter("content");
//    留言时间
    Date time=new Date();
    Calendar c = Calendar.getInstance();
    time=c.getTime();
//    留言信息装入MESSAGE JAVABEAN
    Message mbm = new Message();
    mbm.user.setUserName(userName);
    mbm.user.setCollege(college);
    mbm.user.setClasses(classes);
    mbm.user.setImgName(imgName);
    mbm.setContent(content);
    mbm.setTime(time);

//    留言信息存入数据库
    Connection conn= DBUtil.getConnection();
    try{
        String sql="insert into messageboard_message values(seq_message.nextval,?,?,?,0)";
        PreparedStatement ps=conn.prepareStatement(sql);
        ps.setString(1,user.getUserName());
        ps.setString(2,content);
        ps.setTimestamp(3, new Timestamp(time.getTime()));
        int count=ps.executeUpdate();

//        获取刚存入数据库的留言的id
        String selsql="select seq_message.currval from dual";
        Statement stmt=conn.createStatement();
        ResultSet selrs=stmt.executeQuery(selsql);
        int id=0;
        if(selrs.next()){
            id=selrs.getInt(1);
            mbm.setId(id);
            System.out.println(id);
        }

//        后台打印新增的留言信息
        System.out.println("新增留言添加了"+count+"行");
        System.out.println("ID:"+id);
        System.out.println("作者："+userName);
        System.out.println("留言:"+content);
        System.out.println("时间:"+new Timestamp(time.getTime()));
        System.out.println();

        ArrayList imgNameList=(ArrayList)session.getAttribute("imgNameList");
        session.removeAttribute("imgNameList");

        if(imgNameList!=null)
        {
            String sqlImg="insert into messageboard_img values(seq_img.nextval,?,?)";
//        留言信息的图片存入数据库
            System.out.println("插入留言图片" + imgNameList);
            for(int i=0;i<imgNameList.size();i++){
                String imgNow=(String)imgNameList.get(i);
                System.out.print("当前插入图片："+imgNow);
                PreparedStatement pstmt=conn.prepareStatement(sqlImg);
                pstmt.setInt(1,id);//留言的ID
                pstmt.setString(2,imgNow);
                int countImg = pstmt.executeUpdate();
                System.out.println("留言图片添加了"+countImg+"行");
                mbm.img.setImgName(imgNameList);
                pstmt.close();
            }
        }else
        {
            System.out.println("不插入图片");
        }

//        留言信息的JAVABEAN以json传回
        ObjectMapper om=new ObjectMapper();
        String json=om.writeValueAsString(mbm);
        System.out.println(json);
        out.print(json);
        ps.close();
    }catch (Exception e){
        e.printStackTrace();
    }finally {
        conn.close();
    }
%>