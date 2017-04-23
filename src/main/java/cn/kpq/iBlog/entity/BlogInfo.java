package cn.kpq.iBlog.entity;

import java.io.Serializable;

/**
 * 博文信息基础类
 * Created by alibct on 2017/4/23.
 */
public class BlogInfo implements Serializable {

    private Long blogId; // 博文Id
    private String blogGroup; // 博文所属分组
    private String blogCategory; // 博文所属分类
    private String blogTopic; // 博文所属专题
    private String blogTags; // 博文标签
    private Long blogHits; // 博文点击量
    private Long blogCollections; // 博文收藏量
    private Long blogStars; // 博文喜欢量
    private Long blogComments; // 博文评论个数
    private Boolean status;

    public Long getBlogId() {
        return blogId;
    }

    public void setBlogId(Long blogId) {
        this.blogId = blogId;
    }

    public String getBlogGroup() {
        return blogGroup;
    }

    public void setBlogGroup(String blogGroup) {
        this.blogGroup = blogGroup;
    }

    public String getBlogCategory() {
        return blogCategory;
    }

    public void setBlogCategory(String blogCategory) {
        this.blogCategory = blogCategory;
    }

    public String getBlogTopic() {
        return blogTopic;
    }

    public void setBlogTopic(String blogTopic) {
        this.blogTopic = blogTopic;
    }

    public String getBlogTags() {
        return blogTags;
    }

    public void setBlogTags(String blogTags) {
        this.blogTags = blogTags;
    }

    public Long getBlogHits() {
        return blogHits;
    }

    public void setBlogHits(Long blogHits) {
        this.blogHits = blogHits;
    }

    public Long getBlogCollections() {
        return blogCollections;
    }

    public void setBlogCollections(Long blogCollections) {
        this.blogCollections = blogCollections;
    }

    public Long getBlogStars() {
        return blogStars;
    }

    public void setBlogStars(Long blogStars) {
        this.blogStars = blogStars;
    }

    public Long getBlogComments() {
        return blogComments;
    }

    public void setBlogComments(Long blogComments) {
        this.blogComments = blogComments;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "BlogInfo{" +
                "blogId=" + blogId +
                ", blogGroup='" + blogGroup + '\'' +
                ", blogCategory='" + blogCategory + '\'' +
                ", blogTopic='" + blogTopic + '\'' +
                ", blogTags='" + blogTags + '\'' +
                ", blogHits=" + blogHits +
                ", blogCollections=" + blogCollections +
                ", blogStars=" + blogStars +
                ", blogComments=" + blogComments +
                ", status=" + status +
                '}';
    }
}
