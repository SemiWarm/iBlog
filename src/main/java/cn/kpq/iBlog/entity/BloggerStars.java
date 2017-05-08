package cn.kpq.iBlog.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 博主关注基类
 * Created by alibct on 2017/5/8.
 */
public class BloggerStars implements Serializable{

    private Long bloggerId; // 博主Id
    private Long starBloggerId; // 被关注的博主的Id
    private Date createAt; // 创建事件

    public Long getBloggerId() {
        return bloggerId;
    }

    public void setBloggerId(Long bloggerId) {
        this.bloggerId = bloggerId;
    }

    public Long getStarBloggerId() {
        return starBloggerId;
    }

    public void setStarBloggerId(Long starBloggerId) {
        this.starBloggerId = starBloggerId;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    @Override
    public String toString() {
        return "BloggerStars{" +
                "bloggerId=" + bloggerId +
                ", starBloggerId=" + starBloggerId +
                ", createAt=" + createAt +
                '}';
    }
}
