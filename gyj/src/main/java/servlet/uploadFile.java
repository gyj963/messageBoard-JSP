package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

import javabean.Image;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.fileupload.disk.*;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-10-10
 * Time: 下午7:38
 * Function:文件上传--servlet
 * To change this template use File | Settings | File Templates.
 */

public class uploadFile extends HttpServlet
{
    private String filePath;    // 文件存放目录  
    private String tempPath;    // 临时文件目录  

    // 初始化  
    public void init(ServletConfig config) throws ServletException
    {
        super.init(config);
        // 从配置文件中获得初始化参数  
        filePath = config.getInitParameter("filepath");
        tempPath = config.getInitParameter("temppath");

        ServletContext context = getServletContext();

//        filePath = context.getRealPath(filePath);
//        tempPath = context.getRealPath(tempPath);
        filePath="f://"+filePath;
        tempPath="f://"+tempPath;
        System.out.println("文件存放目录、临时文件目录准备完毕 ...");
        System.out.println("filePath:"+filePath);
        System.out.println("tempPath"+tempPath);
    }

    // doPost  
    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException
    {
        res.setContentType("text/plain;charset=gbk");
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
            while(iter.hasNext())
            {
                FileItem item = (FileItem)iter.next();
                if(item.isFormField())
                {
                    System.out.println("处理表单内容 ...");
                    processFormField(item, pw);
                }else{
                    System.out.println("处理上传的文件 ...");
                    processUploadFile(item, pw);

                }
            }// end while()
            pw.write("true");
            pw.close();

        }catch(Exception e){
            System.out.println("使用 fileupload 包时发生异常 ...");
            e.printStackTrace();
        }// end try ... catch ...

    }// end doPost()


    // 处理表单内容  
    private void processFormField(FileItem item, PrintWriter pw)
            throws Exception
    {
        String name = item.getFieldName();
        String value = item.getString();
        pw.println(name + " : " + value + "\r\n");
    }

    // 处理上传的文件  
    private void processUploadFile(FileItem item, PrintWriter pw)
            throws Exception
    {

        // 此时的文件名包含了完整的路径，得注意加工一下  
        String filename = item.getName();
        System.out.println("完整的文件名：" + filename);

//        int index = filename.lastIndexOf("\\");
//        filename = filename.substring(index + 1, filename.length());

//        截取.及后的部分即文件类型
        int indexa = filename.lastIndexOf(".");
        filename = filename.substring(indexa, filename.length());
//        为确保上传文件命名不同，在原文件名前添加了时间
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date=new Date();
        String time=simpleDateFormat.format(date.getTime());
//        文件名以存入时间命名
        filename=time+filename;

        long fileSize = item.getSize();

        if("".equals(filename) && fileSize == 0)
        {
            System.out.println("文件名为空 ...");
            return;
        }

        File uploadFile = new File(filePath + "/" + filename);
        item.write(uploadFile);
        pw.println(filename + " 文件保存完毕 ...");
        pw.println("文件大小为 ：" + fileSize + "\r\n");

        Image image=new Image();
        image.setImgName(filePath + "/" + filename);


        pw.write(image.getImgName());
        System.out.println(image.getImgName());
    }

    // doGet  
    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException
    {
        doPost(req, res);
    }
} 