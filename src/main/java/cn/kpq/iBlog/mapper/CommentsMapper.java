package cn.kpq.iBlog.mapper;

import cn.kpq.iBlog.entity.Comments;

import java.io.Serializable;
import java.util.List;

/**
 * CommentsMapper
 * Created by alibct on 2017/5/9.
 */
public interface CommentsMapper extends BaseMapper<Comments> {

    int add(Comments comments);

    int delete(Comments comments);

    int update(Comments comments);

    Comments findById(Serializable id);

    List<Comments> findAll();

    List<Comments> findAllByBlogId(Serializable blogId);
}
