package cn.kpq.iBlog.entity;

/**
 * Created by alibct on 2017/4/23.
 */
public class BlogDetail extends Blog {
    private BlogInfo blogInfo;

    public BlogInfo getBlogInfo() {
        return blogInfo;
    }

    public void setBlogInfo(BlogInfo blogInfo) {
        this.blogInfo = blogInfo;
    }

    @Override
    public String toString() {
        return "BlogDetail{" +
                "blogInfo=" + blogInfo +
                '}';
    }
}
