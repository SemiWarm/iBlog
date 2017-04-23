package cn.kpq.iBlog.service;

import cn.kpq.iBlog.entity.Blog;
import cn.kpq.iBlog.entity.BlogDetail;

import java.io.Serializable;
import java.util.List;

/**
 * Created by alibct on 2017/4/23.
 */
public interface BlogService {
    int addBlog(Blog blog) throws Exception;

    int deleteBlog(Blog blog) throws Exception;

    int updateBlog(BlogDetail blogDetail) throws Exception;

    BlogDetail getBlogById(Serializable id) throws Exception;

    List<BlogDetail> getAllBlogs() throws Exception;
}
