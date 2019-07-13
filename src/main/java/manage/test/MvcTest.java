package manage.test;

import com.github.pagehelper.PageInfo;
import manage.bean.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * @Author: 张志诚
 * @Version:
 * @date 2019/7/12 21:26
 * @Description:
 **/

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:spring/applicationContext-tx.xml",
        "classpath:spring/applicationContext-dao.xml",
        "classpath:spring/applicationContext-service.xml",
        "classpath:spring/spring-mvc.xml"})

public class MvcTest {

    /*
    传入SpringMvc的ioc
     */
    @Autowired
    WebApplicationContext context;
    /*
    虚拟的mvc请求,获取处理结果
     */
    MockMvc mockMvc;

    @Before
    public void initMockMvc() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        /*
            模拟请求拿到返回值
         */
        MvcResult andResult = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1")).andReturn();
        MockHttpServletRequest request = andResult.getRequest();
        PageInfo attribute = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("总记录数" + attribute.getTotal());
        System.out.println("总页数" + attribute.getPages());

        List<Employee> list = attribute.getList();

        for (Employee employee:list) {
            System.out.println("ID:"+employee.getEmp_id()
                    +" Name:" + employee.getEmp_name());
        }

    }
}
