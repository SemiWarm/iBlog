package cn.kpq.iBlog.mapper;

import cn.kpq.iBlog.entity.Blogger;

import java.io.Serializable;
import java.util.List;

/**
 * 博主Mapper接口
 * Created by alibct on 2017/4/22.
 */
public interface BloggerMapper extends BaseMapper<Blogger> {

    int add(Blogger blogger);

    int delete(Blogger blogger);

    int update(Blogger blogger);

    Blogger findById(Serializable id);

    List<Blogger> findAll();

    Blogger verifyByAccount(Blogger blogger);

    List<Blogger> findAllByBloggerName(String searchText);
}
