package database;

import javabean.Comment;
import javabean.Image;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-10-17
 * Time: 下午1:25
 * Function:display.jsp中留言的图片的获取--servlet
 * To change this template use File | Settings | File Templates.
 */
public class SelectImg {
/*
*Function: 查找与留言ID相匹配的图片信息，存为ArrayList
*/
    public static ArrayList selectAll(int id) throws SQLException {
        Connection conn=DBUtil.getConnection();
        ArrayList list=new ArrayList();
        try{
            String selImgSql="select * from messageboard_img where content_id="+id+" order by id desc";
            Statement ImgSt=conn.createStatement();
            ResultSet ImgRs=ImgSt.executeQuery(selImgSql);
//          将每条记录存为Image的javabean并存入list
            while(ImgRs.next()){
                Image img = new Image();
                String imgName=ImgRs.getString("name");
                img.setImgName(imgName);

                list.add(img);
            }
        } catch (Exception e){
            e.printStackTrace();
        }finally {
            conn.close();
        }
        return list;
    }
}
