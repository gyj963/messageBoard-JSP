package javabean;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-10-6
 * Time: 下午12:44
 * Function:评论内容信息的javabean
 * To change this template use File | Settings | File Templates.
 */
public class Comment {
//    评论ID
    private int id;
//    对应留言ID
    private int content_id;
//    留言者信息
    public User user=new User();
//    评论内容
    private String content;
    @JsonSerialize(using = DateSerializer.class)
//    评论时间
    private Date time;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getContent_id() {

        return content_id;
    }

    public void setContent_id(int content_id) {
        this.content_id = content_id;
    }
}
