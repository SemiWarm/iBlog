package cn.kpq.iBlog.service.impl;

import cn.kpq.iBlog.entity.Blog;
import cn.kpq.iBlog.entity.BlogInfo;
import cn.kpq.iBlog.entity.Blogger;
import cn.kpq.iBlog.mapper.BlogInfoMapper;
import cn.kpq.iBlog.mapper.BlogMapper;
import cn.kpq.iBlog.mapper.BloggerMapper;
import cn.kpq.iBlog.pojo.BlogDetailPOJO;
import cn.kpq.iBlog.service.BlogDetailPOJOService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * BlogDetailPOJOServiceImpl
 * Created by alibct on 2017/5/12.
 */
@Service("blogDetailPOJOService")
public class BlogDetailPOJOServiceImpl implements BlogDetailPOJOService {


    private final BlogMapper blogMapper;
    private final BlogInfoMapper blogInfoMapper;
    private final BloggerMapper bloggerMapper;

    @Autowired
    public BlogDetailPOJOServiceImpl(BlogMapper blogMapper, BlogInfoMapper blogInfoMapper, BloggerMapper bloggerMapper) {
        this.blogMapper = blogMapper;
        this.blogInfoMapper = blogInfoMapper;
        this.bloggerMapper = bloggerMapper;
    }

    public BlogDetailPOJO getBlogDetailById(Serializable id) throws Exception {
        Blog blog = blogMapper.findById(id);
        BlogInfo blogInfo = blogInfoMapper.findById(blog.getBlogId());
        Blogger blogger = bloggerMapper.findById(blog.getCreateBy());
        BlogDetailPOJO blogDetailPOJO = new BlogDetailPOJO();
        blogDetailPOJO.setBlog(blog);
        blogDetailPOJO.setBlogInfo(blogInfo);
        blogDetailPOJO.setBlogger(blogger);
        return blogDetailPOJO;
    }

    public PageInfo<BlogDetailPOJO> getAllBlogDetails(int pageNum, int pageSize) throws Exception {

        PageHelper.startPage(pageNum, pageSize);
        List<Blog> blogs = blogMapper.findAll();

        List<BlogDetailPOJO> blogDetailPOJOS = new ArrayList<BlogDetailPOJO>();
        BlogDetailPOJO blogDetailPOJO;
        for (Blog blog : blogs) {
            blogDetailPOJO = new BlogDetailPOJO();
            blogDetailPOJO.setBlog(blog);
            blogDetailPOJO.setBlogInfo(blogInfoMapper.findById(blog.getBlogId()));
            blogDetailPOJO.setBlogger(bloggerMapper.findById(blog.getCreateBy()));
            blogDetailPOJOS.add(blogDetailPOJO);
        }
        return new PageInfo<BlogDetailPOJO>(blogDetailPOJOS);
    }

    public PageInfo<BlogDetailPOJO> getAllBlogDetailsByBlogger(Serializable createBy, int pageNum, int pageSize) throws Exception {
        return null;
    }
}
