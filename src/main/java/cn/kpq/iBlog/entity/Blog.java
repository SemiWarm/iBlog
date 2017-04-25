package cn.kpq.iBlog.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 博文基础类
 * Created by alibct on 2017/4/23.
 */
public class Blog implements Serializable {

    private Long blogId; // 博文ID
    private String blogTitle; // 博文标题
    private String blogMarkdownContent; // 博文Markdown内容
    private String blogHtmlContent; // 博文Html内容
    private String blogThum; // 博文缩略图
    private Long wordCount; // 博文字数
    private Long createBy; // 作者Id
    private Date createAt; // 创建时间
    private Boolean status;

    public Long getBlogId() {
        return blogId;
    }

    public void setBlogId(Long blogId) {
        this.blogId = blogId;
    }

    public String getBlogTitle() {
        return blogTitle;
    }

    public void setBlogTitle(String blogTitle) {
        this.blogTitle = blogTitle;
    }

    public String getBlogMarkdownContent() {
        return blogMarkdownContent;
    }

    public void setBlogMarkdownContent(String blogMarkdownContent) {
        this.blogMarkdownContent = blogMarkdownContent;
    }

    public String getBlogHtmlContent() {
        return blogHtmlContent;
    }

    public void setBlogHtmlContent(String blogHtmlContent) {
        this.blogHtmlContent = blogHtmlContent;
    }

    public String getBlogThum() {
        return blogThum;
    }

    public void setBlogThum(String blogThum) {
        this.blogThum = blogThum;
    }

    public Long getWordCount() {
        return wordCount;
    }

    public void setWordCount(Long wordCount) {
        this.wordCount = wordCount;
    }

    public Long getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Long createBy) {
        this.createBy = createBy;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "blogId=" + blogId +
                ", blogTitle='" + blogTitle + '\'' +
                ", blogMarkdownContent='" + blogMarkdownContent + '\'' +
                ", blogHtmlContent='" + blogHtmlContent + '\'' +
                ", blogThum='" + blogThum + '\'' +
                ", wordCount=" + wordCount +
                ", createBy=" + createBy +
                ", createAt=" + createAt +
                ", status=" + status +
                '}';
    }
}
