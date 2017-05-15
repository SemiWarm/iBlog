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

    @RequestMapping(value = "/", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    public ModelAndView index() throws Exception {
        return new ModelAndView("forward:index");
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    public ModelAndView login() throws Exception {
        return new ModelAndView("login");
    }

    @RequestMapping(value = "/quit", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    public ModelAndView quit() throws Exception {
        return new ModelAndView("quit");
    }

    @RequestMapping(value = "/signUp", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    public ModelAndView signUp() throws Exception {
        return new ModelAndView("signUp");
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    public ModelAndView admin() throws Exception {
        return new ModelAndView("admin");
    }

    @RequestMapping(value = "/blogger", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    public ModelAndView blogger() throws Exception {
        return new ModelAndView("blogger");
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
