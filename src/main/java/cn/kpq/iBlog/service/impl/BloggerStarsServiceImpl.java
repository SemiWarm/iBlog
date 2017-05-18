package cn.kpq.iBlog.service.impl;

import cn.kpq.iBlog.entity.BloggerStars;
import cn.kpq.iBlog.mapper.BloggerStarsMapper;
import cn.kpq.iBlog.service.BloggerStarsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * BloggerStarsServiceImpl
 * Created by alibct on 2017/5/8.
 */
@Service("bloggerStarsService")
public class BloggerStarsServiceImpl implements BloggerStarsService {

    private final BloggerStarsMapper bloggerStarsMapper;

    @Autowired
    public BloggerStarsServiceImpl(BloggerStarsMapper bloggerStarsMapper) {
        this.bloggerStarsMapper = bloggerStarsMapper;
    }

    public int addBloggerStars(BloggerStars bloggerStars) throws Exception {
        return bloggerStarsMapper.add(bloggerStars);
    }

    public int deleteBloggerStars(BloggerStars bloggerStars) throws Exception {
        return bloggerStarsMapper.delete(bloggerStars);
    }

    public BloggerStars getBloggerStarsById(BloggerStars bloggerStars) throws Exception {
        return bloggerStarsMapper.findById(bloggerStars);
    }

    public List<BloggerStars> getAllBloggerStarsById(Serializable bloggerId) throws Exception {
        return bloggerStarsMapper.findAllById(bloggerId);
    }

    public List<BloggerStars> getAllBloggerStarsByStar(Serializable bloggerId) throws Exception {
        return bloggerStarsMapper.findAllByStar(bloggerId);
    }
}
