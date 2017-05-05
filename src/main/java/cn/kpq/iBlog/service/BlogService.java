package cn.kpq.iBlog.service;

import cn.kpq.iBlog.entity.Blog;

import java.io.Serializable;
import java.util.List;

/**
 * Created by alibct on 2017/4/23.
 */
public interface BlogService {

    int addBlog(Blog blog) throws Exception;

    int deleteBlog(Blog blog) throws Exception;

    int updateBlog(Blog blog) throws Exception;

    Blog getBlogById(Serializable id) throws Exception;

    List<Blog> getAllBlogs() throws Exception;
}
