package cn.kpq.iBlog.service.impl;

import cn.kpq.iBlog.entity.Blog;
import cn.kpq.iBlog.entity.BlogInfo;
import cn.kpq.iBlog.mapper.BlogInfoMapper;
import cn.kpq.iBlog.mapper.BlogMapper;
import cn.kpq.iBlog.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * BlogServiceImpl
 * Created by alibct on 2017/4/23.
 */
@Service("blogService")
public class BlogServiceImpl implements BlogService {

    private final BlogMapper blogMapper;
    private final BlogInfoMapper blogInfoMapper;

    @Autowired
    public BlogServiceImpl(BlogMapper blogMapper, BlogInfoMapper blogInfoMapper) {
        this.blogMapper = blogMapper;
        this.blogInfoMapper = blogInfoMapper;
    }

    public int addBlog(Blog blog) throws Exception {
        BlogInfo blogInfo = new BlogInfo();
        blogInfo.setBlogId(blog.getBlogId());
        blogInfo.setStatus(true);
        int result = blogMapper.add(blog);
        if (result > 0) {
            blogInfoMapper.add(blogInfo);
        }
        return result;
    }

    public int deleteBlog(Blog blog) throws Exception {
        BlogInfo blogInfo = new BlogInfo();
        blogInfo.setBlogId(blog.getBlogId());
        int result = blogMapper.delete(blog);
        if (result > 0) {
            blogInfoMapper.delete(blogInfo);
        }
        return result;
    }

    public int updateBlog(Blog blog) throws Exception {
        return blogMapper.update(blog);
    }

    public Blog getBlogById(Serializable id) throws Exception {
        return blogMapper.findById(id);
    }

    public List<Blog> getAllBlogs() throws Exception {
        return blogMapper.findAll();
    }

}
