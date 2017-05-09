package cn.kpq.iBlog.service.impl;

import cn.kpq.iBlog.entity.Comments;
import cn.kpq.iBlog.mapper.CommentsMapper;
import cn.kpq.iBlog.service.CommentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * CommentsServiceImpl
 * Created by alibct on 2017/5/9.
 */
@Service("commentsService")
public class CommentsServiceImpl implements CommentsService {

    private final CommentsMapper commentsMapper;

    @Autowired
    public CommentsServiceImpl(CommentsMapper commentsMapper) {
        this.commentsMapper = commentsMapper;
    }

    // 添加评论
    public int addComments(Comments comments) throws Exception {
        return commentsMapper.add(comments);
    }

    public Comments getCommentById(Serializable commentId) throws Exception {
        return commentsMapper.findById(commentId);
    }

    // 查询某个博文的所有评论
    public List<Comments> getAllCommentsByBlogId(Serializable blogId) throws Exception {
        return commentsMapper.findAllByBlogId(blogId);
    }
}
