package cn.kpq.iBlog.pojo;

import cn.kpq.iBlog.entity.Blog;
import cn.kpq.iBlog.entity.BlogInfo;
import cn.kpq.iBlog.entity.Blogger;

import java.io.Serializable;

/**
 * BlogDetailPOJO
 * Created by alibct on 2017/5/12.
 */
public class BlogDetailPOJO implements Serializable {

    private Blog blog;
    private BlogInfo blogInfo;
    private Blogger blogger;

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public BlogInfo getBlogInfo() {
        return blogInfo;
    }

    public void setBlogInfo(BlogInfo blogInfo) {
        this.blogInfo = blogInfo;
    }

    public Blogger getBlogger() {
        return blogger;
    }

    public void setBlogger(Blogger blogger) {
        this.blogger = blogger;
    }

    @Override
    public String toString() {
        return "BlogDetailPOJO{" +
                "blog=" + blog +
                ", blogInfo=" + blogInfo +
                ", blogger=" + blogger +
                '}';
    }
}
