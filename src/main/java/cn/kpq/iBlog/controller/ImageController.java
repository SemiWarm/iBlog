package cn.kpq.iBlog.controller;

import cn.kpq.iBlog.entity.Image;
import cn.kpq.iBlog.service.impl.ImageServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 图片控制器
 * Created by alibct on 2017/4/16.
 */
@Controller
public class ImageController {

    private final ImageServiceImpl imageService;

    @Autowired
    public ImageController(ImageServiceImpl imageService) {
        this.imageService = imageService;
    }

    @RequestMapping(value = "/{imageType}/images", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    @ResponseBody
    public List<Image> getImagesByType(@PathVariable("imageType") String imageType) throws Exception {
        return imageService.getImagesByType(imageType);
    }
}
