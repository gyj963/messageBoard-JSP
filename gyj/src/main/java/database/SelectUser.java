package database;

import javabean.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-10-19
 * Time: 下午6:01
 * To change this template use File | Settings | File Templates.
 */
public class SelectUser {

    public static User select(String username) throws SQLException {
        Connection conn=DBUtil.getConnection();
        User user = new User();
        try{
            String selUserSql="select * from messageboard_user where username='"+username+"'";
            Statement userSt=conn.createStatement();
            ResultSet userRs=userSt.executeQuery(selUserSql);
//          将每条记录存为User的javabean并存入list
            if(userRs.next()){
                String userName=userRs.getString("userName");
                String college=userRs.getString("college");
                String classes=userRs.getString("class");
                String imgName=userRs.getString("imgName");
                String phone=userRs.getString("phone");
                String memo=userRs.getString("memo");
                user.setUserName(userName);
                user.setCollege(college);
                user.setClasses(classes);
                user.setImgName(imgName);
                user.setPhone(phone);
                user.setMemo(memo);
            }
        } catch (Exception e){
            e.printStackTrace();
        }finally {
            conn.close();
        }
        return user;
    }
    public static User selectById(int userid) throws SQLException {
        Connection conn=DBUtil.getConnection();
        User user = new User();
        try{
            String selUserSql="select * from messageboard_user where id="+userid;
            Statement userSt=conn.createStatement();
            ResultSet userRs=userSt.executeQuery(selUserSql);
//          将每条记录存为User的javabean并存入list
            if(userRs.next()){
                String userName=userRs.getString("userName");
                String college=userRs.getString("college");
                String classes=userRs.getString("class");
                String imgName=userRs.getString("imgName");
                String phone=userRs.getString("phone");
                String memo=userRs.getString("memo");
                user.setUserName(userName);
                user.setCollege(college);
                user.setClasses(classes);
                user.setImgName(imgName);
                user.setPhone(phone);
                user.setMemo(memo);
            }
        } catch (Exception e){
            e.printStackTrace();
        }finally {
            conn.close();
        }
        return user;
    }
    public static ArrayList selectAll() throws SQLException {
        Connection conn=DBUtil.getConnection();
        ArrayList list=new ArrayList();
        try{
            String selUserSql="select * from messageboard_user";
            Statement userSt=conn.createStatement();
            ResultSet userRs=userSt.executeQuery(selUserSql);
            while(userRs.next()){
                User user = new User();
                int userid=userRs.getInt("id");
                String userName=userRs.getString("userName");
                String college=userRs.getString("college");
                String classes=userRs.getString("class");
                String imgName=userRs.getString("imgName");
                String phone=userRs.getString("phone");
                String memo=userRs.getString("memo");
                user.setUserid(userid);
                user.setUserName(userName);
                user.setCollege(college);
                user.setClasses(classes);
                user.setImgName(imgName);
                user.setPhone(phone);
                user.setMemo(memo);
                list.add(user);
            }
            userRs.close();
            userSt.close();
        }catch(Exception e)
        {
            e.printStackTrace();
        }finally{
            conn.close();
        }
        return list;
    }
}
