import cn.kpq.iBlog.service.impl.BlogDetailPOJOServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by alibct on 2017/5/12.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-*.xml")
public class BlogDetailServiceImplTest {
    @Autowired
    private BlogDetailPOJOServiceImpl blogDetailPOJOService;

    @Test
    public void test() throws Exception {
        System.out.println(blogDetailPOJOService.getAllBlogDetails(1, 2));
    }
}
