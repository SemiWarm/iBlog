package cn.kpq.iBlog.entity;

import java.io.Serializable;

/**
 * 首页博文列表pojo
 * Created by alibct on 2017/4/23.
 */
public class BlogDetail extends Blog implements Serializable {

    private String blogTags; // 博文标签
    private Long blogHits; // 博文点击量
    private Long blogCollections; // 博文收藏量
    private Long blogComments; // 博文评论个数
    private Long blogStars; // 博文喜欢量
    private String bloggerName; // 博主昵称
    private String bloggerAvatar; // 博主头像

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

    public Long getBlogComments() {
        return blogComments;
    }

    public void setBlogComments(Long blogComments) {
        this.blogComments = blogComments;
    }

    public Long getBlogStars() {
        return blogStars;
    }

    public void setBlogStars(Long blogStars) {
        this.blogStars = blogStars;
    }

    public String getBloggerName() {
        return bloggerName;
    }

    public void setBloggerName(String bloggerName) {
        this.bloggerName = bloggerName;
    }

    public String getBloggerAvatar() {
        return bloggerAvatar;
    }

    public void setBloggerAvatar(String bloggerAvatar) {
        this.bloggerAvatar = bloggerAvatar;
    }

    @Override
    public String toString() {
        return "BlogDetail{" +
                "blogTags='" + blogTags + '\'' +
                ", blogHits=" + blogHits +
                ", blogCollections=" + blogCollections +
                ", blogComments=" + blogComments +
                ", blogStars=" + blogStars +
                ", bloggerName='" + bloggerName + '\'' +
                ", bloggerAvatar='" + bloggerAvatar + '\'' +
                '}';
    }
}
