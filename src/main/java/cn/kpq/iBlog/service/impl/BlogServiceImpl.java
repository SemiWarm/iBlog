package cn.kpq.iBlog.service.impl;

import cn.kpq.iBlog.entity.Blog;
import cn.kpq.iBlog.entity.BlogDetail;
import cn.kpq.iBlog.entity.BlogInfo;
import cn.kpq.iBlog.mapper.BlogInfoMapper;
import cn.kpq.iBlog.mapper.BlogMapper;
import cn.kpq.iBlog.mapper.BloggerMapper;
import cn.kpq.iBlog.service.BlogService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by alibct on 2017/4/23.
 */
@Service("blogService")
public class BlogServiceImpl implements BlogService {

    private final BlogMapper blogMapper;
    private final BloggerMapper bloggerMapper;
    private final BlogInfoMapper blogInfoMapper;

    @Autowired
    public BlogServiceImpl(BlogMapper blogMapper, BloggerMapper bloggerMapper, BlogInfoMapper blogInfoMapper) {
        this.blogMapper = blogMapper;
        this.bloggerMapper = bloggerMapper;
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

    public BlogDetail getBlogById(Serializable id) throws Exception {

        BlogDetail blogDetail = new BlogDetail();

        Blog result = blogMapper.findById(id);

        blogDetail.setBlogId(result.getBlogId());
        blogDetail.setBlogTitle(result.getBlogTitle());
        blogDetail.setBlogMarkdownContent(result.getBlogMarkdownContent());
        blogDetail.setBlogHtmlContent(result.getBlogHtmlContent());
        blogDetail.setBlogThum(result.getBlogThum());
        blogDetail.setWordCount(result.getWordCount());
        blogDetail.setCreateBy(result.getCreateBy());
        blogDetail.setCreateAt(result.getCreateAt());
        blogDetail.setStatus(result.getStatus());
        blogDetail.setBlogInfo(blogInfoMapper.findById(id));

        return blogDetail;
    }

    public PageInfo<BlogDetail> getAllBlogs(int pageNum, int pageSize) throws Exception {

        PageHelper.startPage(pageNum, pageSize);
        List<Blog> blogs = blogMapper.findAll();

        List<BlogDetail> blogDetails = new ArrayList<BlogDetail>();
        BlogDetail blogDetail;
        for (Blog blog : blogs) {
            blogDetail = new BlogDetail();
            // 设置博主信息
            blogDetail.setBlogger(bloggerMapper.findById(blog.getCreateBy()));
            // 设置博文信息
            blogDetail.setBlogId(blog.getBlogId());

            // 处理标题
            int start = blog.getBlogTitle().indexOf(" ");
            int end = blog.getBlogTitle().length();
            String blogTitle = blog.getBlogTitle().substring(start, end);

            blogDetail.setBlogTitle(blogTitle);
            blogDetail.setBlogMarkdownContent(blog.getBlogMarkdownContent());

            // 处理html内容
            String blogHtmlContent = Jsoup.clean(blog.getBlogHtmlContent(), new Whitelist());
            blogDetail.setBlogHtmlContent(blogHtmlContent);

            blogDetail.setBlogThum(blog.getBlogThum());
            blogDetail.setCreateBy(blog.getCreateBy());
            blogDetail.setCreateAt(blog.getCreateAt());
            blogDetail.setStatus(blog.getStatus());
            blogDetail.setBlogInfo(blogInfoMapper.findById(blog.getBlogId()));

            blogDetails.add(blogDetail);
        }

        return new PageInfo<BlogDetail>(blogDetails);
    }
}
