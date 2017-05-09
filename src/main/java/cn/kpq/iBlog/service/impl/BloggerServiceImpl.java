package cn.kpq.iBlog.service.impl;

import cn.kpq.iBlog.entity.BaseResponse;
import cn.kpq.iBlog.entity.Blogger;
import cn.kpq.iBlog.mapper.BloggerMapper;
import cn.kpq.iBlog.service.BloggerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.io.Serializable;
import java.util.List;

/**
 * 博主服务类实现类
 * Created by alibct on 2017/4/22.
 */
@Service("bloggerService")
public class BloggerServiceImpl implements BloggerService {

    private final BloggerMapper bloggerMapper;

    @Autowired
    public BloggerServiceImpl(BloggerMapper bloggerMapper) {
        this.bloggerMapper = bloggerMapper;
    }

    public int addBlogger(Blogger blogger) throws Exception {
        return bloggerMapper.add(blogger);
    }

    public int deleteBlogger(Blogger blogger) throws Exception {
        return bloggerMapper.delete(blogger);
    }

    public Blogger getBloggerById(Serializable id) throws Exception {
        return bloggerMapper.findById(id);
    }

    public List<Blogger> getAllBloggers() throws Exception {
        return bloggerMapper.findAll();
    }

    public BaseResponse<Blogger> signIn(HttpSession session, Blogger blogger) throws Exception {

        BaseResponse<Blogger> response = new BaseResponse<Blogger>();
        Blogger result = bloggerMapper.verifyByAccount(blogger);

        if (null != result) {
            response.setSuccess(1);
            response.setMessage("登录成功!");
            response.setData(null);

            session.setAttribute("bloggerName", result.getBloggerName());
            session.setAttribute("bloggerId", result.getBloggerId());
            session.setAttribute("bloggerAvatar", result.getBloggerAvatar());

        } else {
            response.setSuccess(0);
            response.setMessage("登录失败!");
            response.setData(null);
        }

        return response;
    }
}
