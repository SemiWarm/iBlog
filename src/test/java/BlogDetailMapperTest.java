import cn.kpq.iBlog.mapper.BlogDetailMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * 测试类
 * Created by alibct on 2017/5/4.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-*.xml")
public class BlogDetailMapperTest {
    @Autowired
    private BlogDetailMapper blogDetailMapper;

    @Test
    public void testFindAll(){
        System.out.println(blogDetailMapper.findAll().get(0).getBloggerName());
    }

    @Test
    public void testFindById(){
        System.out.println(blogDetailMapper.findById(1493966917505L));
    }
}
