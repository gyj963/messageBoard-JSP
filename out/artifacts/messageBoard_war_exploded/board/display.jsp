<%@ page import="java.sql.Connection" %>
<%@ page import="database.DBUtil" %>
<%--
  Created by IntelliJ IDEA.
  User: gyj
  Date: 13-10-1
  Time: 下午4:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>

<html>
<head>
    <title>留言板</title>
    <link rel="stylesheet" href="css/body.css">
    <script src="../lib/jquery-1.10.2.js"></script>
    <script src="script/textarea.js" type="text/javascript" charset="utf-8"></script>
</head>

<body>
      <div class="main">
          <div class="main_title">
                某某班的悄悄话
          </div>
          <div class="board">
              <div class="newMessage">
                  <p>有什么想告诉大家？</p>
                      <textarea id="content" title="留言板输入框" style="margin: 2px 10px 10px 0px;  width: 70%;height: 100px; font-size: 14px; font-family: Tahoma; word-wrap: break-word; line-height: 18px; overflow-y: auto; overflow-x: hidden; outline: none;"></textarea><br>
                      <input type="button" value="提交" onclick="return getAreaText();"/>
              </div>
              <div class="container">
                  <div class="topic_author">
                      作者
                  </div>
                  <div class="message_content">
                       留言内容 留言内容留言内容留言内容留言内容留言内容
                      留言内容留言内容留言内容留言内容留言内容留言内容
                      留言内容留言内容留言内容留言内容留言内容留言内容
                      留言内容留言内容留言内容留言内容留言内容留言内容
                  </div>
                  <div class="media">
                      <img src="img/1.jpeg" height="30%" width="20%"/>
                  </div>
                  <div class="footbar">
                      <span style="float:left">time</span><span style="float:right"><a>赞(0)</a><i class="division">|</i><a>评论</a></span>
                  </div>
              </div>
              <div class="container">
                  <div class="topic_author">
                      作者
                  </div>
                  <div class="message_content">
                      留言内容 留言内容留言内容留言内容留言内容留言内容
                      留言内容留言内容留言内容留言内容留言内容留言内容
                      留言内容留言内容留言内容留言内容留言内容留言内容
                      留言内容留言内容留言内容留言内容留言内容留言内容
                  </div>
                  <div class="media">
                      <img src="img/1.jpeg" height="30%" width="20%"/>
                  </div>
                  <div class="footbar">
                      <span style="float:left">time</span><span style="float:right"><a>赞(0)</a><i class="division">|</i><a>评论</a></span>
                  </div>
              </div>

          </div>
          <div class="information">
              <div class="info_title">
                  我的信息
              </div>
              <div class="info_content">
                  <p class="name">小熊跳跳跳</p>
                  <p class="number">我的留言：12</p>
              </div>
              <div class="info_title">
                 留言板信息
              </div>
              <div class="info_content">
                  <p class="name">软工112班</p>
                  <p class="number">总留言：55</p>
              </div>
          </div>
      </div>
</body>
</html>