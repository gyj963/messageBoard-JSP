package servlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-10-10
 * Time: 下午7:38
 * Function:通过图片名字从本地磁盘读取图片
 * To change this template use File | Settings | File Templates.
 */
public class imageToStream extends HttpServlet {
    public void doPost(HttpServletRequest req,HttpServletResponse res){
        String imgName=req.getParameter("imgName");

        try{
            FileInputStream hFile = new FileInputStream("f://uploadFile/"+imgName);
            int i=hFile.available(); //得到文件大小
            byte data[]=new byte[i];
            hFile.read(data);  //读数据
            res.setContentType("image/*"); //设置返回的文件类型
            OutputStream toClient=res.getOutputStream(); //得到向客户端输出二进制数据的对象
            toClient.write(data);  //输出数据
            toClient.flush();
            toClient.close();
            hFile.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void doGet(HttpServletRequest req,HttpServletResponse res){
        this.doPost(req,res);
    }
}
