package cn.kpq.iBlog.service;

import cn.kpq.iBlog.entity.Comments;

import java.io.Serializable;
import java.util.List;

/**
 * CommentsService
 * Created by alibct on 2017/5/9.
 */
public interface CommentsService {
    int addComments(Comments comments) throws Exception;
    List<Comments> getAllCommentsByBlogId(Serializable blogId) throws Exception;
}
