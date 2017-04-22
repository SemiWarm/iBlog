package cn.kpq.iBlog.service.impl;

import cn.kpq.iBlog.entity.Blogger;
import cn.kpq.iBlog.mapper.BloggerMapper;
import cn.kpq.iBlog.service.BloggerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
