package database;

import javabean.Comment;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-10-8
 * Time: 下午5:17
 * Function:display.jsp评论的获取--servlet
 * To change this template use File | Settings | File Templates.
 */



public class SelectComment {

/*
*Function:将通过查找对应留言的id获取的评论信息，存为ArrayList
*/
    public static ArrayList selectAll(int id) throws SQLException{
        Connection conn=DBUtil.getConnection();
        ArrayList list=new ArrayList();
        try{
            String selComSql="select * from messageboard_comment where del=0 and content_id="+id+" order by id desc";
            Statement comSt=conn.createStatement();
            ResultSet comRs=comSt.executeQuery(selComSql);

//            将每条评论的信息存成Comment的javabean并添加到列表中
            while(comRs.next()){
                Comment com=new Comment();
                int com_id=comRs.getInt("id");
                int content_id=comRs.getInt("content_id");
                String com_author=comRs.getString("author");
                String com_content=comRs.getString("content");
                Date com_time=comRs.getTimestamp("time");

                com.setTime(com_time);
                com.setId(com_id);
                com.setContent(com_content);
                com.setContent_id(content_id);
                com.user.setUserName(com_author);

                list.add(com);

            }
        } catch (Exception e){
            e.printStackTrace();
        }finally {
            conn.close();
        }
        return list;
    }
}
