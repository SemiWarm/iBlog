package cn.kpq.iBlog.controller;

import cn.kpq.iBlog.entity.BaseResponse;
import cn.kpq.iBlog.entity.Blogger;
import cn.kpq.iBlog.service.impl.BloggerServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @Autowired
    public BloggerController(BloggerServiceImpl bloggerService) {
        this.bloggerService = bloggerService;
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
        return bloggerService.getAllBloggers();
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
}
