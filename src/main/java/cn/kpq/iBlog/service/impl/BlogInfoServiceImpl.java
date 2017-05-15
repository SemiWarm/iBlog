package cn.kpq.iBlog.service.impl;

import cn.kpq.iBlog.entity.BlogInfo;
import cn.kpq.iBlog.mapper.BlogInfoMapper;
import cn.kpq.iBlog.service.BlogInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * BlogInfoServiceImpl
 * 主要用于点击量、喜欢量、收藏量和评论个数的更新操作
 * Created by alibct on 2017/5/12.
 */
@Service("blogInfoService")
public class BlogInfoServiceImpl implements BlogInfoService {

    private final BlogInfoMapper blogInfoMapper;

    @Autowired
    public BlogInfoServiceImpl(BlogInfoMapper blogInfoMapper) {
        this.blogInfoMapper = blogInfoMapper;
    }

    public int addBlogInfo(BlogInfo blogInfo) throws Exception {
        return blogInfoMapper.add(blogInfo);
    }

    public int deleteBlogInfo(BlogInfo blogInfo) throws Exception {
        return blogInfoMapper.delete(blogInfo);
    }

    public int updateBlogInfo(BlogInfo blogInfo) throws Exception {
        return blogInfoMapper.update(blogInfo);
    }

    public BlogInfo getBlogInfoById(Serializable id) throws Exception {
        return blogInfoMapper.findById(id);
    }

    public List<BlogInfo> getAllBlogInfo() throws Exception {
        return blogInfoMapper.findAll();
    }
}
