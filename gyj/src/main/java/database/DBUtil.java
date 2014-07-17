package database;

import java.sql.Statement;
import java.sql.*;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-10-3
 * Time: 下午2:38
 * Function:数据库连接关闭等方法
 * To change this template use File | Settings | File Templates.
 */
public class DBUtil {
    //        获取数据库连接
    public static Connection getConnection() throws SQLException{
        try{
            Class.forName(Constants.DRIVER);
            Connection conn= DriverManager.getConnection(Constants.URL,
                    Constants.USERNAME,Constants.PASSWORD);
            return conn;
        }catch (Exception e){
            e.printStackTrace();
            throw  new SQLException("驱动错误或连接失败");
        }
    }
    //      关闭Statement对象
   public static void closeStatement(Statement stmt) throws SQLException{
       try{
           if(stmt!=null){
                stmt.close();
           }
       }catch (SQLException e){
           throw new SQLException("关闭statement失败!");
       }
   }
    //    关闭ResultSet对象
    public  static void closeResultSet(ResultSet rs) throws SQLException{
       try{
           if(rs!=null){
               rs.close();
           }
       }catch (SQLException e){
           throw new SQLException("关闭ResultSet对象失败");
       }
    }
    //      关闭Connection对象
    public static void closeConnection(Connection conn) throws SQLException{
       try{
           if(conn!=null){
              conn.close();
           }
       }catch (SQLException e){
           throw new SQLException("关闭Connection失败");
       }
    }
}
