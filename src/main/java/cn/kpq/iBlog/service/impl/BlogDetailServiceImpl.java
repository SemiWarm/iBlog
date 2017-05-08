package cn.kpq.iBlog.service.impl;

import cn.kpq.iBlog.entity.BlogDetail;
import cn.kpq.iBlog.mapper.BlogDetailMapper;
import cn.kpq.iBlog.service.BlogDetailService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * blogDetailService
 * Created by alibct on 2017/5/4.
 */
@Service("blogDetailService")
public class BlogDetailServiceImpl implements BlogDetailService {

    private final BlogDetailMapper blogDetailMapper;

    @Autowired
    public BlogDetailServiceImpl(BlogDetailMapper blogDetailMapper) {
        this.blogDetailMapper = blogDetailMapper;
    }


    public BlogDetail getBlogDetailByBlogId(Serializable blogId) throws Exception {
        return blogDetailMapper.findById(blogId);
    }

    public PageInfo<BlogDetail> getAllBlogs(int pageNum, int pageSize) throws Exception {

        PageHelper.startPage(pageNum, pageSize);
        List<BlogDetail> blogDetails = blogDetailMapper.findAll();

        for (BlogDetail blogDetail : blogDetails) {
            // 处理标题
            int start = blogDetail.getBlogTitle().indexOf(" ");
            int end = blogDetail.getBlogTitle().length();
            String blogTitle = blogDetail.getBlogTitle().substring(start, end);

            blogDetail.setBlogTitle(blogTitle);

            // 处理html内容
            String blogHtmlContent = Jsoup.clean(blogDetail.getBlogHtmlContent(), new Whitelist());
            blogDetail.setBlogHtmlContent(blogHtmlContent);
        }

        return new PageInfo<BlogDetail>(blogDetails);
    }

    public PageInfo<BlogDetail> getBlogsByBlogger(Serializable createBy, int pageNum, int pageSize) throws Exception {
        PageHelper.startPage(pageNum, pageSize);
        List<BlogDetail> blogDetails = blogDetailMapper.findByBlogger(createBy);

        for (BlogDetail blogDetail : blogDetails) {
            // 处理标题
            int start = blogDetail.getBlogTitle().indexOf(" ");
            int end = blogDetail.getBlogTitle().length();
            String blogTitle = blogDetail.getBlogTitle().substring(start, end);
            blogDetail.setBlogTitle(blogTitle);
            // 处理html内容
            String blogHtmlContent = Jsoup.clean(blogDetail.getBlogHtmlContent(), new Whitelist());
            blogDetail.setBlogHtmlContent(blogHtmlContent);
        }

        return new PageInfo<BlogDetail>(blogDetails);
    }
}
