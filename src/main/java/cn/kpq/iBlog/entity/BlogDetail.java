package cn.kpq.iBlog.entity;

/**
 * Created by alibct on 2017/4/23.
 */
public class BlogDetail extends Blog {

    private Blogger blogger;
    private BlogInfo blogInfo;

    public Blogger getBlogger() {
        return blogger;
    }

    public void setBlogger(Blogger blogger) {
        this.blogger = blogger;
    }

    public BlogInfo getBlogInfo() {
        return blogInfo;
    }

    public void setBlogInfo(BlogInfo blogInfo) {
        this.blogInfo = blogInfo;
    }
}
