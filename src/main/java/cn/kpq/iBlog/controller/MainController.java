package cn.kpq.iBlog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * 主控制器
 * Created by alibct on 2017/4/21.
 */
@Controller
public class MainController {

    @RequestMapping(value = "/admin", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    public ModelAndView admin() throws Exception {
        return new ModelAndView("admin");
    }


    @RequestMapping(value = "/main", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    public ModelAndView main() throws Exception {
        return new ModelAndView("main");
    }

    @RequestMapping(value = "/blogger", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    public ModelAndView blogger() throws Exception {
        return new ModelAndView("bloggerEdit");
    }

    @RequestMapping(value = "/blog", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    public ModelAndView blog() throws Exception {
        return new ModelAndView("blogEdit");
    }

    @RequestMapping(value = "/editor", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    public ModelAndView editor() throws Exception {
        return new ModelAndView("mdEditor");
    }
}
