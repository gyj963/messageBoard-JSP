package javabean;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-10-19
 * Time: 下午4:50
 * To change this template use File | Settings | File Templates.
 */
public class User {
    private int userid;
    private String userName;
    private String college;
    private String classes;
    private String imgName;
    private String phone;
    private String memo;

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }
    public String getImgName() {
        return imgName;
    }

    public void setImgName(String imgName) {
        this.imgName = imgName;
    }

    public String getCollege() {

        return college;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getClasses() { return classes;}

    public void setClasses(String classes) { this.classes = classes;}

    public String getPhone() {return phone;}

    public void setPhone(String phone) {this.phone = phone;}

    public String getMemo() { return memo;}

    public void setMemo(String memo) {
        this.memo = memo;
    }

}
