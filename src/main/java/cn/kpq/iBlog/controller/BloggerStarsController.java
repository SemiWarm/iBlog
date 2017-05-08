package cn.kpq.iBlog.controller;

import cn.kpq.iBlog.entity.BaseResponse;
import cn.kpq.iBlog.entity.BloggerStars;
import cn.kpq.iBlog.service.impl.BloggerStarsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by alibct on 2017/5/8.
 */
@Controller
public class BloggerStarsController {

    private final BloggerStarsServiceImpl bloggerStarsService;

    @Autowired
    public BloggerStarsController(BloggerStarsServiceImpl bloggerStarsService) {
        this.bloggerStarsService = bloggerStarsService;
    }


    @RequestMapping(value = "/bloggerStars", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    @ResponseBody
    public BaseResponse<BloggerStars> bloggerStars(BloggerStars bloggerStars) throws Exception {
        BaseResponse<BloggerStars> response = new BaseResponse<BloggerStars>();
        BloggerStars result = bloggerStarsService.getBloggerStarsById(bloggerStars);
        if (null != result) {
            response.setSuccess(1);
            response.setMessage("已关注");
            response.setData(result);
        } else {
            response.setSuccess(0);
            response.setMessage("未关注");
            response.setData(null);
        }
        return response;
    }


    @RequestMapping(value = "/bloggerStars", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public BaseResponse<BloggerStars> addBloggerStars(BloggerStars bloggerStars) throws Exception {
        BaseResponse<BloggerStars> response = new BaseResponse<BloggerStars>();
        int result = bloggerStarsService.addBloggerStars(bloggerStars);

        if (result > 0) {
            response.setSuccess(1);
            response.setMessage("关注成功");
            response.setData(null);
        } else {
            response.setSuccess(0);
            response.setMessage("关注失败");
            response.setData(null);
        }

        return response;
    }

    @RequestMapping(value = "/bloggerStars/{bloggerId}/{starBloggerId}", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    @ResponseBody
    public BaseResponse<BloggerStars> deleteBloggerStars(@PathVariable("bloggerId") Long bloggerId, @PathVariable("starBloggerId") Long starBloggerId) throws Exception {
        BaseResponse<BloggerStars> response = new BaseResponse<BloggerStars>();
        BloggerStars bloggerStars = new BloggerStars();
        bloggerStars.setBloggerId(bloggerId);
        bloggerStars.setStarBloggerId(starBloggerId);
        int result = bloggerStarsService.deleteBloggerStars(bloggerStars);

        if (result > 0) {
            response.setSuccess(1);
            response.setMessage("取消成功");
            response.setData(null);
        } else {
            response.setSuccess(0);
            response.setMessage("取消失败");
            response.setData(null);
        }

        return response;
    }

}
