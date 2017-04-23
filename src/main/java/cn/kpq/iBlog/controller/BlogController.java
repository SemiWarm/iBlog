package cn.kpq.iBlog.controller;

import cn.kpq.iBlog.entity.BaseResponse;
import cn.kpq.iBlog.entity.Blog;
import cn.kpq.iBlog.entity.BlogDetail;
import cn.kpq.iBlog.service.impl.BlogServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * Created by alibct on 2017/4/23.
 */
@Controller
public class BlogController {

    private final BlogServiceImpl blogService;

    @Autowired
    public BlogController(BlogServiceImpl blogService) {
        this.blogService = blogService;
    }

    @RequestMapping(value = "/blogs", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public BaseResponse<BlogDetail> addBlog(Blog blog) throws Exception {

        BaseResponse<BlogDetail> response = new BaseResponse<BlogDetail>();

        Date date = new Date();
        // 博文id
        Long blogId = date.getTime();
        blog.setBlogId(blogId);
        blog.setStatus(true);

        int result = blogService.addBlog(blog);

        if (result > 0){
            response.setSuccess(1);
            response.setMessage("文章保存成功!是否查看?");
            response.setData(null);
        } else {
            response.setSuccess(0);
            response.setMessage("文章保存失败!是否重试?");
            response.setData(null);
        }

        return response;
    }
}
