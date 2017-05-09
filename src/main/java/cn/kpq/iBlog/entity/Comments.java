package cn.kpq.iBlog.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 评论表
 * Created by alibct on 2017/5/9.
 */
public class Comments implements Serializable {

    private Long commentId; // 评论Id
    private Long blogId; // 被评论的博文
    private String commentContent; // 评论内容
    private Long commentBy; // 评论人
    private Date commentAt; // 评论时间

    public Long getCommentId() {
        return commentId;
    }

    public void setCommentId(Long commentId) {
        this.commentId = commentId;
    }

    public Long getBlogId() {
        return blogId;
    }

    public void setBlogId(Long blogId) {
        this.blogId = blogId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Long getCommentBy() {
        return commentBy;
    }

    public void setCommentBy(Long commentBy) {
        this.commentBy = commentBy;
    }

    public Date getCommentAt() {
        return commentAt;
    }

    public void setCommentAt(Date commentAt) {
        this.commentAt = commentAt;
    }

    @Override
    public String toString() {
        return "Comments{" +
                "commentId=" + commentId +
                ", blogId=" + blogId +
                ", commentContent='" + commentContent + '\'' +
                ", commentBy=" + commentBy +
                ", commentAt=" + commentAt +
                '}';
    }
}
