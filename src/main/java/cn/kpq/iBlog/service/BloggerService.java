package cn.kpq.iBlog.service;

import cn.kpq.iBlog.entity.BaseResponse;
import cn.kpq.iBlog.entity.Blogger;

import javax.servlet.http.HttpSession;
import java.io.Serializable;
import java.util.List;

/**
 * 博主服务接口
 * Created by alibct on 2017/4/22.
 */
public interface BloggerService {

    int addBlogger(Blogger blogger) throws Exception;

    int deleteBlogger(Blogger blogger) throws Exception;

    Blogger getBloggerById(Serializable id) throws Exception;

    List<Blogger> getAllBloggers() throws Exception;

    public List<Blogger> getAllBloggersByBloggerName(String searchText) throws Exception;

    BaseResponse<Blogger> signIn(HttpSession session, Blogger blogger) throws Exception;
}
