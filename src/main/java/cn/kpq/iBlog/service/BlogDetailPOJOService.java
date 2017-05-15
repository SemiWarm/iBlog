package cn.kpq.iBlog.service;

import cn.kpq.iBlog.pojo.BlogDetailPOJO;
import com.github.pagehelper.PageInfo;

import java.io.Serializable;

/**
 * BlogDetailPOJOService
 * Created by alibct on 2017/5/12.
 */
public interface BlogDetailPOJOService {

    BlogDetailPOJO getBlogDetailById(Serializable id) throws Exception;

    PageInfo<BlogDetailPOJO> getAllBlogDetails(int pageNum, int pageSize) throws Exception;

    PageInfo<BlogDetailPOJO> getAllBlogDetailsByBlogger(Serializable createBy, int pageNum, int pageSize) throws Exception;
}
