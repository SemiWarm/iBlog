package cn.kpq.iBlog.service;

import cn.kpq.iBlog.entity.BloggerStars;

import java.io.Serializable;
import java.util.List;

/**
 * BloggerStarsService
 * Created by alibct on 2017/5/8.
 */
public interface BloggerStarsService {
    int addBloggerStars(BloggerStars bloggerStars) throws Exception;
    int deleteBloggerStars(BloggerStars bloggerStars) throws Exception;
    // 根据id获取某条关注信息
    BloggerStars getBloggerStarsById(BloggerStars bloggerStars) throws Exception;
    // 获取某个博主的所有关注
    List<BloggerStars> getAllBloggerStarsById(Serializable bloggerId) throws Exception;
}
