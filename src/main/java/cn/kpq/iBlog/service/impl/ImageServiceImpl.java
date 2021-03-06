package cn.kpq.iBlog.service.impl;

import cn.kpq.iBlog.entity.Image;
import cn.kpq.iBlog.mapper.ImageMapper;
import cn.kpq.iBlog.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * 图片服务类实现类
 * Created by alibct on 2017/4/8.
 */
@Service("imageService")
public class ImageServiceImpl implements ImageService {

    private final ImageMapper imageMapper;

    @Autowired
    public ImageServiceImpl(ImageMapper imageMapper) {
        this.imageMapper = imageMapper;
    }

    public int addImage(Image image) throws Exception {
        return imageMapper.add(image);
    }

    public int deleteImage(Image image) throws Exception {
        return imageMapper.delete(image);
    }

    public int updateImage(Image image) throws Exception {
        return imageMapper.update(image);
    }

    public Image getImageById(Serializable id) throws Exception {
        return imageMapper.findById(id);
    }

    public List<Image> getAllImages() throws Exception {
        return imageMapper.findAll();
    }

    public List<Image> getImagesByType(Serializable imageType) throws Exception {
        return imageMapper.findByImageType(imageType);
    }
}
