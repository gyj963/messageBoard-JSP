<%@ page import="java.sql.Connection" %>
<%@ page import="database.DBUtil" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: 高英健
  Date: 13-10-17
  Time: 上午11:25
  Function:将上传到本地磁盘的留言图片名字存入session
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String imgName=request.getParameter("imgName");
    if(session.getAttribute("imgNameList")==null){
        ArrayList imgListTemp=new ArrayList();
        session.setAttribute("imgNameList",imgListTemp);
    }
    ArrayList imgList=(ArrayList)session.getAttribute("imgNameList");
    imgList.add(imgName);
    session.setAttribute("imgNameList",imgList);
//    打印测试
    ArrayList imgLista=(ArrayList)session.getAttribute("imgNameList");
    System.out.print("imgList:"+imgLista);
%>