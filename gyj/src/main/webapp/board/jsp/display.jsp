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
  Function:留言板界面
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
//    将留言信息取出 放在contentList中
    ArrayList contentList = SelectContent.selectAll();
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
    <title>留言板</title>
    <link rel="stylesheet" href="../css/content.css">
    <link rel="stylesheet" href="../css/comment.css">
    <link rel="stylesheet" href="../css/body.css">
    <script src="../../lib/jquery-1.10.2.js"></script>
    <script src="../../lib/jquery.uploadify.js"></script>
    <script src="../script/contentInsert_function.js" type="text/javascript" charset="utf-8"></script>
    <script src="../script/contentDel_function.js" type="text/javascript" charset="utf-8"></script>
    <script src="../script/commentInsert_function.js" type="text/javascript" charset="utf-8" ></script>
    <script src="../script/commentDel_function.js" type="text/javascript" charset="utf-8" ></script>
    <link href="../css/uploadify.css" rel="stylesheet" type="text/css"/>
    <script src="../../lib/jquery-1.10.2.js"></script>
    <script src="../../lib/jquery.uploadify.js"></script>
    <script src="../script/uploadImage.js"></script>
</head>

<body>
      <div class="main">

          <!--标题-->
          <div class="main_title">
                <div class="text"></div>
          </div>
          <!--工具栏(注销登录)-->
          <div class="toolbar" style=" position:absolute;top:5;right: 20;">
              <a href="<%=path%>/addressBook/jsp/displayAll.jsp"
                 style="color: rgb(209, 251, 204);text-decoration: none;margin-right: 10px">
                  通讯录
              </a>
              <a href="<%=path%>/login/jsp/login.jsp"
               style="color: rgb(251,244,189);text-decoration: none;">
                当前用户：<%=currentUser%>（注销登录）
             </a>
          </div>
          <!--留言板-->
          <div class="board">

              <%--输入消息框--%>
              <div class="newMessage">
                  <p style="color:#1D454F;font-weight: bold">有什么想告诉大家？</p>
                  <textarea id="content" title="留言板输入框"></textarea><br>
                  <div id="btn_upload" style="float:left"></div>
                  <input type="button" class="submit" value="提交" onclick="return getAreaText_content();"/>
                  <div class="showPage" style="border: solid 1px #88c677;padding:5px;display: none">
                  </div>
              </div>
              <!--...............................................................................
              从数据库里读取"留言信息"显示--BEGIN
              ................................................................................-->
              <%
                  for(int i=0;i< contentList.size();i++){
                      Message message= (Message)contentList.get(i);
                      String author=message.user.getUserName();
                      System.out.println(author);
                      int id=message.getId();
                      String content=message.getContent();
                      String time=simpleDateFormat.format(message.getTime());
//                      留言作者信息获取
                      User userInfo=SelectUser.select(author);
                      String userName=userInfo.getUserName();
                      String college=userInfo.getCollege();
                      String classes=userInfo.getClasses();
                      String headImg=userInfo.getImgName();
                  %>

                      <div class="container">
                          <div class="topic_author">
                              <img class="content_headimg" src="/showImg?imgName=<%=headImg%>"/>
                              <div class="content_author"><%=userName%>
                              <span><%=college%><%=classes%></span></div>
                              <span class="del" data-id="<%=id%>">X</span>
                          </div>
                          <div class="message_content">
                                  <%=content%>
                          </div>
                          <div class="media">

                          <!--...........................................................
                            从数据库读取"留言的图片信息"显示--BEGIN
                          ................................................................-->
                              <%
                                  ArrayList imgList = SelectImg.selectAll(id);
                                  for(int k=0;k<imgList.size();k++){
                                      Image img=new Image();
                                      img=(Image)imgList.get(k);
                                      String imgName=img.getImgName();
                              %>
                              <img src='/showImg?imgName=<%=imgName%>' width='400' height='250'/>
                              <%    } %>
                          <!--...........................................................
                            从数据库读取"留言的图片信息"显示--END
                          ................................................................-->
                          </div>
                          <div class="footbar">
                          <span style="float:left"><%=time%></span><span style="float:right"><a>赞(0)</a><i class="division">|</i><a class="pl" href="#">评论</a></span>
                          </div>
                          <div class="comment">
                              <div class="com_new">
                                  <textarea class="ta_comment" title="回复输入框"></textarea><br>
                                  <input type="button" value="评论" class="button_pl"/>
                              </div>

                <!--................................................................................
                从数据库里读取"此留言信息对应的评论信息"--BEGIN
                ...................................................................................-->
                 <%
                     ArrayList commentList = SelectComment.selectAll(id);
                     for(int j=0;j<commentList.size();j++){
                         Comment comment = (Comment)commentList.get(j);
                         int com_id=comment.getId();
                         int content_id=comment.getContent_id();
                         String com_author=comment.user.getUserName();
                         String com_content=comment.getContent();
                         String com_time=simpleDateFormat.format(comment.getTime());
                         //                      留言作者信息获取
                         User comUserInfo=SelectUser.select(com_author);
                         String comUserName=comUserInfo.getUserName();
                         String comUserCollege=comUserInfo.getCollege();
                         String comUserClasses=comUserInfo.getClasses();
                         String comUserHeadImg=comUserInfo.getImgName();

                         if(id==content_id){
                 %>

                              <div class="com_item">
                                  <div class="com_headimg">
                                    <img src="/showImg?imgName=<%=comUserHeadImg%>" width=30 height=30 />
                                  </div>

                                  <div class="com_content">
                                    <span class="author">
                                        <%=comUserName%>[<%=comUserCollege%><%=comUserClasses%>]
                                    </span>：<%=com_content%>
                                  </div>

                                  <div class="footbar">
                                      <span style="float:right;margin:5px 10px 0 0;"><%=com_time%>
                                              <i class="division">|</i>
                                      <a class="del_comment" href="#" data-id="<%=com_id%>">删除</a>
                                      </span>
                                  </div>
                              </div>

                   <%}}%>
                        </div>
                      <!--................................................................................
                        从数据库里读取"此留言信息对应的评论信息"--END
                       ...................................................................................-->
                      </div>
              <%}%>
              <!--...............................................................................
                从数据库里读取"留言信息"显示  --END
              ................................................................................-->
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