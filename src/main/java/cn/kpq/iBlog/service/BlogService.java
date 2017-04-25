package cn.kpq.iBlog.service;

import cn.kpq.iBlog.entity.Blog;
import cn.kpq.iBlog.entity.BlogDetail;
import com.github.pagehelper.PageInfo;

import java.io.Serializable;

/**
 * Created by alibct on 2017/4/23.
 */
public interface BlogService {
    int addBlog(Blog blog) throws Exception;

    int deleteBlog(Blog blog) throws Exception;

    int updateBlog(BlogDetail blogDetail) throws Exception;

    BlogDetail getBlogById(Serializable id) throws Exception;

    PageInfo<BlogDetail> getAllBlogs(int pageNum,int pageSize) throws Exception;
}
