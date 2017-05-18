package cn.kpq.iBlog.controller;

import cn.kpq.iBlog.entity.BaseResponse;
import cn.kpq.iBlog.entity.Blogger;
import cn.kpq.iBlog.service.impl.BlogServiceImpl;
import cn.kpq.iBlog.service.impl.BloggerServiceImpl;
import cn.kpq.iBlog.service.impl.BloggerStarsServiceImpl;
import cn.kpq.iBlog.service.impl.CommentsServiceImpl;
import cn.kpq.iBlog.utils.CommonDateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * 博主控制器
 * Created by alibct on 2017/4/22.
 */
@Controller
public class BloggerController {

    private final BloggerServiceImpl bloggerService;
    private final BlogServiceImpl blogService;
    private final BloggerStarsServiceImpl bloggerStarsService;
    private final CommentsServiceImpl commentsService;

    @Autowired
    public BloggerController(BloggerServiceImpl bloggerService, BlogServiceImpl blogService, BloggerStarsServiceImpl bloggerStarsService, CommentsServiceImpl commentsService) {
        this.bloggerService = bloggerService;
        this.blogService = blogService;
        this.bloggerStarsService = bloggerStarsService;
        this.commentsService = commentsService;
    }

    /**
     * 获取所有博主信息
     *
     * @return 所有博主信息
     * @throws Exception 异常
     */
    @RequestMapping(value = "/bloggers", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    @ResponseBody
    public List<Blogger> getAllBloggers() throws Exception {

        List<Blogger> bloggers = bloggerService.getAllBloggers();

        for (Blogger blogger : bloggers) {
            String newAvatar = "<button type='button' class='btn btn-success btn-xs' data-toggle='modal' data-target='#imagePreviewModal' value='" + blogger.getBloggerAvatar() + "'>预览图片</button>";
            blogger.setBloggerAvatar(newAvatar);
        }

        return bloggers;
    }

    @RequestMapping(value = "/update/blogger", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public BaseResponse<Blogger> updateBlogger(Blogger blogger) throws Exception {
        BaseResponse<Blogger> response = new BaseResponse<Blogger>();
        int result = bloggerService.updateBlogger(blogger);
        if (result > 0) {
            response.setSuccess(1);
            response.setMessage("更新成功!");
            response.setData(blogger);
        } else {
            response.setSuccess(1);
            response.setMessage("更新失败!");
            response.setData(null);
        }

        return response;
    }

    /**
     * 注册用户
     *
     * @param blogger 需要注册的用户
     * @return 注册成功的用户信息
     * @throws Exception 异常
     */
    @RequestMapping(value = "/bloggers", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public BaseResponse<Blogger> signUpBlogger(Blogger blogger) throws Exception {

        BaseResponse<Blogger> response = new BaseResponse<Blogger>();

        Date date = new Date();
        Long bloggerId = date.getTime();
        blogger.setBloggerId(bloggerId);
        blogger.setStatus(true);
        blogger.setBloggerAvatar("http://localhost:8080/upload/images/avatar.jpg");

        int result = bloggerService.addBlogger(blogger);

        if (result > 0) {
            response.setSuccess(1);
            response.setMessage("注册成功!");
            response.setData(blogger);
        } else {
            response.setSuccess(0);
            response.setMessage("注册失败!");
            response.setData(null);
        }

        return response;
    }


    @RequestMapping(value = "/signIn", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public BaseResponse<Blogger> signIn(HttpSession session, Blogger blogger) throws Exception {
        return bloggerService.signIn(session, blogger);
    }

    @RequestMapping(value = "/bloggerIndex/{bloggerId}", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    public ModelAndView bloggerIndex(@PathVariable("bloggerId") Long bloggerId) throws Exception {
        ModelAndView view = new ModelAndView("bloggerIndex");
        // 整点事情
        Blogger blogger = bloggerService.getBloggerById(bloggerId);

        String createAt = CommonDateUtils.getFromatDate(blogger.getCreateAt());

        int blogCount = blogService.getAllBlogsByBloggerId(bloggerId).size(); // 文章个数

        int blogStarCount = bloggerStarsService.getAllBloggerStarsById(bloggerId).size(); // 博主关注的人数

        int blogStaredCount = bloggerStarsService.getAllBloggerStarsByStar(bloggerId).size(); // 博主被关注次数

        view.addObject("blogCount", blogCount);
        view.addObject("blogger", blogger);
        view.addObject("blogStarCount",blogStarCount);
        view.addObject("blogStaredCount",blogStaredCount);
        view.addObject("createAt", createAt);
        return view;
    }

    @RequestMapping(value = "/bloggerCenter/{bloggerId}", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    public ModelAndView bloggerCenter(@PathVariable("bloggerId") Long bloggerId) throws Exception {

        ModelAndView view = new ModelAndView("bloggerCenter");

        Blogger blogger = bloggerService.getBloggerById(bloggerId);

        view.addObject("blogger", blogger);

        return view;
    }
}
