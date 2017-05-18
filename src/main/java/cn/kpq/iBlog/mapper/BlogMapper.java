package cn.kpq.iBlog.mapper;

import cn.kpq.iBlog.entity.Blog;

import java.io.Serializable;
import java.util.List;

/**
 * Created by alibct on 2017/4/23.
 */
public interface BlogMapper extends BaseMapper<Blog> {

    int add(Blog blog);

    int delete(Blog blog);

    int update(Blog blog);

    Blog findById(Serializable id);

    List<Blog> findAll();

    List<Blog> findByCreateBy(Serializable bloggerId);
}
