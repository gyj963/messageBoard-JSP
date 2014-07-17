package database;


import javabean.Message;

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
 * Time: 下午4:15
 * Function:display.jsp中留言的获取--servlet
 * To change this template use File | Settings | File Templates.
 */


public class SelectContent {

/*
*Function: 获取留言信息，存为ArrayList
*/
    public static ArrayList selectAll() throws SQLException {

        Connection conn=DBUtil.getConnection();
        ArrayList list=new ArrayList();

        try{
            String sql="select * from messageboard_message where del=0 order by id desc";
            Statement st=conn.createStatement();
            ResultSet rs=st.executeQuery(sql);

//            将每条记录存为Message的javabean并存进list
            while(rs.next()){
                Message ms=new Message();
                String author=rs.getString("author");
                String content=rs.getString("content");
                Date time=rs.getTimestamp("time");
                int id=rs.getInt("id");

                ms.user.setUserName(author);
                ms.setContent(content);
                ms.setTime(time);
                ms.setId(id);
                list.add(ms);
            }

            rs.close();
            st.close();
        }catch(Exception e)
        {
            e.printStackTrace();
        }finally{
           conn.close();
        }
        return list;
    }
}
