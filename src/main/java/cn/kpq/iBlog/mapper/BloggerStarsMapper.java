package cn.kpq.iBlog.mapper;

import cn.kpq.iBlog.entity.BloggerStars;

import java.io.Serializable;
import java.util.List;

/**
 * BloggerStarsMapper
 * Created by alibct on 2017/5/8.
 */
public interface BloggerStarsMapper {

    int add(BloggerStars bloggerStars);

    int delete(BloggerStars bloggerStars);

    BloggerStars findById(BloggerStars bloggerStars);

    List<BloggerStars> findAll();

    // 根据博主id获取博主的关注所有信息
    List<BloggerStars> findAllById(Serializable bloggerId);

    // 获取博主的被关注个数
    List<BloggerStars> findAllByStar(Serializable bloggerId);
}
