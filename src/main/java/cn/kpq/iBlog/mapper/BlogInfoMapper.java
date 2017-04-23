package cn.kpq.iBlog.mapper;

import cn.kpq.iBlog.entity.BlogInfo;

import java.io.Serializable;
import java.util.List;

/**
 * Created by alibct on 2017/4/23.
 */
public interface BlogInfoMapper extends BaseMapper<BlogInfo> {

    int add(BlogInfo blogInfo);

    int delete(BlogInfo blogInfo);

    int update(BlogInfo blogInfo);

    BlogInfo findById(Serializable id);

    List<BlogInfo> findAll();
}
