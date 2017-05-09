package cn.kpq.iBlog.controller;

import cn.kpq.iBlog.entity.*;
import cn.kpq.iBlog.service.impl.BlogDetailServiceImpl;
import cn.kpq.iBlog.service.impl.BlogServiceImpl;
import cn.kpq.iBlog.service.impl.BloggerServiceImpl;
import cn.kpq.iBlog.service.impl.CommentsServiceImpl;
import cn.kpq.iBlog.utils.CommonDateUtils;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * blogService
 * Created by alibct on 2017/4/23.
 */
@Controller
public class BlogController {


    private final BlogServiceImpl blogService;
    private final BloggerServiceImpl bloggerService;
    private final BlogDetailServiceImpl blogDetailService;
    private final CommentsServiceImpl commentsService;

    @Autowired
    public BlogController(BlogServiceImpl blogService, BloggerServiceImpl bloggerService, BlogDetailServiceImpl blogDetailService, CommentsServiceImpl commentsService) {
        this.blogService = blogService;
        this.bloggerService = bloggerService;
        this.blogDetailService = blogDetailService;
        this.commentsService = commentsService;
    }

    /**
     * 添加博文
     *
     * @param blog 要添加的博文
     * @return 博文
     * @throws Exception 异常
     */
    @RequestMapping(value = "/blogs", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public BaseResponse<Blog> addBlog(Blog blog) throws Exception {

        BaseResponse<Blog> response = new BaseResponse<Blog>();

        Date date = new Date();
        // 博文id
        Long blogId = date.getTime();
        blog.setBlogId(blogId);
        blog.setStatus(true);

        int result = blogService.addBlog(blog);

        if (result > 0) {
            response.setSuccess(1);
            response.setMessage("文章保存成功!是否查看?");
            response.setData(blog);
        } else {
            response.setSuccess(0);
            response.setMessage("文章保存失败!是否重试?");
            response.setData(null);
        }

        return response;
    }

    @RequestMapping(value = "/blogs/pageNum/{pageNum}/pageSize/{pageSize}", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    @ResponseBody
    public PageInfo<BlogDetail> getAllBlogs(@PathVariable("pageNum") int pageNum, @PathVariable("pageSize") int pageSize) throws Exception {
        return blogDetailService.getAllBlogs(pageNum, pageSize);
    }


    @RequestMapping(value = "/blogs/createBy/{createBy}/pageNum/{pageNum}/pageSize/{pageSize}", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    @ResponseBody
    public PageInfo<BlogDetail> getBlogsByBlogger(@PathVariable("createBy") Long createBy, @PathVariable("pageNum") int pageNum, @PathVariable("pageSize") int pageSize) throws Exception {
        return blogDetailService.getBlogsByBlogger(createBy, pageNum, pageSize);
    }

    @RequestMapping(value = "/showBlog/id/{blogId}", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    @ResponseBody
    public ModelAndView showBlog(@PathVariable("blogId") Long blogId) throws Exception {
        ModelAndView view = new ModelAndView("showBlog");
        // 根据blogId获取需要的博文信息
        BlogDetail blogDetail = blogDetailService.getBlogDetailByBlogId(blogId);

        int start = blogDetail.getBlogTitle().indexOf(" ");
        int end = blogDetail.getBlogTitle().length();
        String blogTitle = blogDetail.getBlogTitle().substring(start, end);
        blogDetail.setBlogTitle(blogTitle);

        // 博主信息
        Blogger blogger = bloggerService.getBloggerById(blogDetail.getCreateBy());
        view.addObject("blogDetail", blogDetail);
        view.addObject("createAt", CommonDateUtils.getFromatDate(blogDetail.getCreateAt()));
        view.addObject("blogger", blogger);

        // 根据blogId获取博文的所有评论
        List<Comments> comments = commentsService.getAllCommentsByBlogId(blogId);
        view.addObject("commentsCount", comments.size());
        view.addObject("comments", comments);
        // 根据每条评论获取每个评论的博主的信息
        List<Blogger> bloggers = new ArrayList<Blogger>();
        Blogger temp;
        List<String> commentTimeList = new ArrayList<String>();
        String commentTime;
        for (Comments comment : comments) {
            temp = bloggerService.getBloggerById(comment.getCommentBy());
            bloggers.add(temp);
            commentTime = CommonDateUtils.getFromatDate(comment.getCommentAt());
            commentTimeList.add(commentTime);
        }

        view.addObject("commentBloggers", bloggers);
        view.addObject("commentTimeList", commentTimeList);

        return view;
    }


    @RequestMapping(value = "/comments", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public BaseResponse<Comments> comments(Comments comments) throws Exception {
        BaseResponse<Comments> response = new BaseResponse<Comments>();
        Date date = new Date();
        comments.setCommentId(date.getTime());
        int result = commentsService.addComments(comments);
        if (result > 0) {
            response.setSuccess(1);
            response.setMessage("评论成功!");
            response.setData(commentsService.getCommentById(comments.getCommentId()));
        } else {
            response.setSuccess(0);
            response.setMessage("评论失败!");
            response.setData(null);
        }

        return response;
    }
}
