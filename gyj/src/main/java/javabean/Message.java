package javabean;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.util.ArrayList;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-10-3
 * Time: 下午6:11
 * Function:留言内容的javabean
 * To change this template use File | Settings | File Templates.
 */
public class Message {
//    留言内容
    private String content;
    @JsonSerialize(using = DateSerializer.class)
//    留言时间
    private Date time;
//    留言者学院+班级
    private String classes;
//    留言ID
    private int id;
//    留言者信息
    public User user=new User();
    //    留言图片
    public Img img=new Img();
    public class Img{
        public ArrayList imgName;

        public ArrayList getImgName() {
            return imgName;
        }

        public void setImgName(ArrayList imgName) {
            this.imgName = imgName;
        }
    }
    public int getId() {

        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Date getTime() {
        return time;

    }

    public String getContent() {


        return content;
    }
}
