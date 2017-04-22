package cn.kpq.iBlog.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 博主基类
 * Created by alibct on 2017/4/22.
 */
public class Blogger implements Serializable {

    private Long bloggerId;
    private String bloggerName;
    private String bloggerAccount;
    private String loginPassword;
    private String bloggerProfile;
    private String bloggerAvatar;
    private Boolean status;
    private Date createAt;

    public Long getBloggerId() {
        return bloggerId;
    }

    public void setBloggerId(Long bloggerId) {
        this.bloggerId = bloggerId;
    }

    public String getBloggerName() {
        return bloggerName;
    }

    public void setBloggerName(String bloggerName) {
        this.bloggerName = bloggerName;
    }

    public String getBloggerAccount() {
        return bloggerAccount;
    }

    public void setBloggerAccount(String bloggerAccount) {
        this.bloggerAccount = bloggerAccount;
    }

    public String getLoginPassword() {
        return loginPassword;
    }

    public void setLoginPassword(String loginPassword) {
        this.loginPassword = loginPassword;
    }

    public String getBloggerProfile() {
        return bloggerProfile;
    }

    public void setBloggerProfile(String bloggerProfile) {
        this.bloggerProfile = bloggerProfile;
    }

    public String getBloggerAvatar() {
        return bloggerAvatar;
    }

    public void setBloggerAvatar(String bloggerAvatar) {
        this.bloggerAvatar = bloggerAvatar;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    @Override
    public String toString() {
        return "Blogger{" +
                "bloggerId=" + bloggerId +
                ", bloggerName='" + bloggerName + '\'' +
                ", bloggerAccount='" + bloggerAccount + '\'' +
                ", loginPassword='" + loginPassword + '\'' +
                ", bloggerProfile='" + bloggerProfile + '\'' +
                ", bloggerAvatar='" + bloggerAvatar + '\'' +
                ", status=" + status +
                ", createAt=" + createAt +
                '}';
    }
}
