package servlet;

import database.DBUtil;
import javabean.Image;
import javabean.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User:高英健
 * Date: 13-10-20
 * Time: 下午7:24
 * Function:注册提交的后台处理，因含有文件上传的东西所以用了sevlet处理
 * To change this template use File | Settings | File Templates.
 */
public class register_upload extends HttpServlet
{
    private String filePath="uploadFile";    // 文件存放目录
    private String tempPath="uploadTmp";    // 临时文件目录

    // 初始化
    public void init(ServletConfig config) throws ServletException
    {
        filePath="f://"+filePath;
        tempPath="f://"+tempPath;
        System.out.println("文件存放目录、临时文件目录准备完毕 ...");
        System.out.println("filePath:"+filePath);
        System.out.println("tempPath:"+tempPath);
    }

    // doPost
    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException
    {
//      以下保证了数据不乱码（1）

//      这句加不加都可
//      res.setCharacterEncoding("utf-8");
        req.setCharacterEncoding("utf-8");
        res.setContentType("text/plain;charset=utf-8");

        PrintWriter pw = res.getWriter();
        try{
            DiskFileItemFactory diskFactory = new DiskFileItemFactory();
            // threshold 极限、临界值，即硬盘缓存 1M
            diskFactory.setSizeThreshold(4 * 1024);
            // repository 贮藏室，即临时文件目录
            diskFactory.setRepository(new File(tempPath));

            ServletFileUpload upload = new ServletFileUpload(diskFactory);
            // 设置允许上传的最大文件大小 4M
            upload.setSizeMax(4 * 1024 * 1024);
            // 解析HTTP请求消息头
            List fileItems = upload.parseRequest(req);
            Iterator iter = fileItems.iterator();
            ArrayList list=new ArrayList();
            while(iter.hasNext())
            {
//                取出各项表单
                FileItem item = (FileItem)iter.next();
                String value=new String();
                if(item.isFormField())
                {
//                  保证数据不乱码 ||取出各项表单内容
                    value = new String(item.getString().getBytes("ISO-8859-1"),"UTF-8");
                    System.out.println("处理表单内容 ...");
//                    processFormField(item, pw);
                }else{
//                    取出上传文件的文件名
                    value = item.getName();
                    if(!value.equals(""))
                    {
                        System.out.println("处理上传的文件 ...");
                        String imgName=processUploadFile(item, pw);
                        value = imgName;
                    }
                    else{
                        value="0.jpg";
                    }
                }
                System.out.println("item.getString():"+value);
//                将表单内容添加到list中
                list.add(value);
            }// end while()

//            将list各项取出存放到各项数据中
            String username=(String)list.get(0);
            String password=(String)list.get(1);
            String college=(String)list.get(3);
            String newclass=(String)list.get(4)+"级"+(String)list.get(5)+"班";
            String phone=(String)list.get(6);
            String memo=(String)list.get(7);
            String headimg=(String)list.get(8);

//           如果用户没选择头像则将头像存为0.jpg默认头像
            if(headimg.equals("")){
                headimg=("0.jpg");
            }
            System.out.println("即将存入的注册数据：");
            System.out.println("username:"+username);
            System.out.println("password:"+password);
            System.out.println("college:"+college);
            System.out.println("newclass:"+newclass);
            System.out.println("headimg:"+headimg);
            System.out.println("phone:"+phone);
            System.out.println("memo:"+memo);

            Connection conn= DBUtil.getConnection();
            try{
//      利用college的id在数据库查找college的名字
                String colSql="select name from messageboard_college where id="+college;
                Statement stmt=conn.createStatement();
                ResultSet rs=stmt.executeQuery(colSql);
                if(rs.next()){
                    college=rs.getString(1);
                }

//        将信息存入表中
                String userSql="insert into messageboard_user values(seq_user.nextval,?,?,?,?,?,?,?)";
                PreparedStatement pstmt=conn.prepareStatement(userSql);
                pstmt.setString(1,username);
                pstmt.setString(2,password);
                pstmt.setString(3,college);
                pstmt.setString(4,newclass);
                pstmt.setString(5,headimg);
                pstmt.setString(6,phone);
                pstmt.setString(7,memo);

                int updatecount=pstmt.executeUpdate();
//        将注册成功的用户数据存入session
                User user=new User();
                user.setUserName(username);
                user.setCollege(college);
                user.setClasses(newclass);
                user.setImgName(headimg);
                HttpSession session=req.getSession();
                session.setAttribute("User", user);

                System.out.println("新增用户"+updatecount);
                System.out.println("注册用户信息：");
                System.out.println("username:"+username);
                System.out.println("password:"+password);
                System.out.println("college:"+college);
                System.out.println("class:"+newclass);
                System.out.println("headimg:"+headimg);
                System.out.println("phone:"+phone);
                System.out.println("memo:"+memo);
//        录入信息成功跳转至注册成功转场页
                String   url="/register/jsp/gotoBoard.jsp";
                req.getRequestDispatcher(url).forward(req,res);

                pstmt.close();
            }catch (Exception e){
                e.printStackTrace();
//        录入信息失败跳转至注册失败转场页
                String   url="/register/jsp/register_false.jsp";
                req.getRequestDispatcher(url).forward(req,res);
            }finally {
                conn.close();
            }

            pw.write("true");
            pw.close();

        }catch(Exception e){
            System.out.println("使用 fileupload 包时发生异常 ...");
            e.printStackTrace();
        }// end try ... catch ...

    }// end doPost()


    // 处理上传的文件
    private String processUploadFile(FileItem item, PrintWriter pw)
            throws Exception
    {
//      此时的文件名包含了完整的路径，得注意加工一下
        String filename = item.getName();
        if(filename.equals(""))
        {
            filename="0.jpg";
        }
//        截取.及后的部分即文件类型
        System.out.println("filename"+filename);
        int indexa = filename.lastIndexOf(".");
        filename = filename.substring(indexa, filename.length());
//        为确保上传文件命名不同，在原文件名前添加了时间
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date=new Date();
        String time=simpleDateFormat.format(date.getTime());
//        文件名以存入时间命名
        filename=time+filename;


        System.out.println("完整的文件名：" + filename);

        long fileSize = item.getSize();

        if("".equals(filename) && fileSize == 0)
        {
            System.out.println("文件名为空 ...");
        }

        File uploadFile = new File(filePath + "/" + filename);

//        上传文件
        item.write(uploadFile);
        pw.println(filename + " 文件保存完毕 ...");
        pw.println("文件大小为 ：" + fileSize + "\r\n");
        return filename;
    }

    // doGet
    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException
    {
        doPost(req, res);
    }
}