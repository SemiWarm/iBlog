package cn.kpq.iBlog.mapper;

import cn.kpq.iBlog.entity.BlogDetail;

import java.io.Serializable;
import java.util.List;

/**
 * ...
 * Created by alibct on 2017/5/4.
 */
public interface BlogDetailMapper extends BaseMapper<BlogDetail> {
    // 根据id获取Blog信息
    BlogDetail findById(Serializable blogId);

    // 获取Blog列表
    List<BlogDetail> findAll();
}
