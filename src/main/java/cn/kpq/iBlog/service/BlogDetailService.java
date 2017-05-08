package cn.kpq.iBlog.service;

import cn.kpq.iBlog.entity.BlogDetail;
import com.github.pagehelper.PageInfo;

import java.io.Serializable;

/**
 * Created by alibct on 2017/5/4.
 */
public interface BlogDetailService {

    // 根据博文id获取博文信息
    BlogDetail getBlogDetailByBlogId(Serializable blogId) throws Exception;

    // 获取所有博文item
    PageInfo<BlogDetail> getAllBlogs(int pageNum, int pageSize) throws Exception;

    PageInfo<BlogDetail> getBlogsByBlogger(Serializable createBy, int pageNum, int pageSize) throws Exception;
}
