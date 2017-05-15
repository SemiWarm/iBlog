package cn.kpq.iBlog.service;

import cn.kpq.iBlog.entity.BlogInfo;

import java.io.Serializable;
import java.util.List;

/**
 * BlogInfoService
 * Created by alibct on 2017/5/12.
 */
public interface BlogInfoService {
    int addBlogInfo(BlogInfo blogInfo) throws Exception;

    int deleteBlogInfo(BlogInfo blogInfo) throws Exception;

    int updateBlogInfo(BlogInfo blogInfo) throws Exception;

    BlogInfo getBlogInfoById(Serializable id) throws Exception;

    List<BlogInfo> getAllBlogInfo() throws Exception;
}
