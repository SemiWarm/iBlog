package cn.kpq.iBlog.service;

import cn.kpq.iBlog.entity.Image;

import java.io.Serializable;
import java.util.List;

/**
 * 图片服务类
 * Created by alibct on 2017/4/8.
 */
public interface ImageService {

    int addImage(Image image) throws Exception;

    int deleteImage(Image image) throws Exception;

    int updateImage(Image image) throws Exception;

    Image getImageById(Serializable id) throws Exception;

    List<Image> getAllImages() throws Exception;

    List<Image> getImagesByType(Serializable imageType) throws Exception;
}
