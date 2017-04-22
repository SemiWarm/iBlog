import cn.kpq.iBlog.entity.Blogger;
import cn.kpq.iBlog.mapper.BloggerMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

/**
 * 博主Mapper接口测试类
 * Created by alibct on 2017/4/22.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-*.xml")
public class BloggerMapperTest {
    @Autowired
    private BloggerMapper bloggerMapper;

    @Test
    public void testAdd() {
        Blogger blogger = new Blogger();
        Date date = new Date();
        blogger.setBloggerId(date.getTime());
        blogger.setBloggerAccount("kpq@iBlog.com");
        blogger.setBloggerName("风吹裙起屁屁凉");
        blogger.setLoginPassword("kpq1212");
        blogger.setBloggerAvatar("http://localhost:8080/upload/images/avatar.jpg");
        blogger.setStatus(true);

        int result = bloggerMapper.add(blogger);
        if (result > 0) {
            System.out.println("添加成功!");
        } else {
            System.out.println("添加失败!");
        }
    }
}
