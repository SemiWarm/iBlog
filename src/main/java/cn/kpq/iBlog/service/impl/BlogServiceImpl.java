package cn.kpq.iBlog.service.impl;

import cn.kpq.iBlog.entity.Blog;
import cn.kpq.iBlog.entity.BlogDetail;
import cn.kpq.iBlog.entity.BlogInfo;
import cn.kpq.iBlog.mapper.BlogInfoMapper;
import cn.kpq.iBlog.mapper.BlogMapper;
import cn.kpq.iBlog.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
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

    public int updateBlog(BlogDetail blogDetail) throws Exception {

        BlogInfo blogInfo = blogDetail.getBlogInfo();
        int result = blogMapper.update(blogDetail);
        if (result > 0) {
            blogInfoMapper.update(blogInfo);
        }

        return result;
    }

    public BlogDetail getBlogById(Blog blog) throws Exception {

        BlogDetail blogDetail = new BlogDetail();

        Blog result = blogMapper.findById(blog.getBlogId());

        blogDetail.setBlogId(result.getBlogId());
        blogDetail.setBlogTitle(result.getBlogTitle());
        blogDetail.setBlogContent(result.getBlogContent());
        blogDetail.setBlogThum(result.getBlogThum());
        blogDetail.setCreateBy(result.getCreateBy());
        blogDetail.setCreateAt(result.getCreateAt());
        blogDetail.setStatus(result.getStatus());
        blogDetail.setBlogInfo(blogInfoMapper.findById(blog.getBlogId()));

        return blogDetail;
    }

    public List<BlogDetail> getAllBlogs() throws Exception {
        List<BlogDetail> blogDetails = new ArrayList<BlogDetail>();

        List<Blog> blogs = blogMapper.findAll();

        BlogDetail blogDetail;
        for (Blog blog : blogs) {
            blogDetail = new BlogDetail();
            blogDetail.setBlogId(blog.getBlogId());
            blogDetail.setBlogTitle(blog.getBlogTitle());
            blogDetail.setBlogContent(blog.getBlogContent());
            blogDetail.setBlogThum(blog.getBlogThum());
            blogDetail.setCreateBy(blog.getCreateBy());
            blogDetail.setCreateAt(blog.getCreateAt());
            blogDetail.setStatus(blog.getStatus());
            blogDetail.setBlogInfo(blogInfoMapper.findById(blog.getBlogId()));

            blogDetails.add(blogDetail);
        }

        return blogDetails;
    }
}
