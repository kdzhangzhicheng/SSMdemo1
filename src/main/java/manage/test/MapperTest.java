package manage.test;


import manage.bean.Department;
import manage.bean.Employee;
import manage.dao.DepartmentMapper;
import manage.dao.EmployeeMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;



/**
 * @Author: 张志诚
 * @Version:
 * @date 2019/7/8 19:56
 * @Description:
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext-tx.xml","classpath:spring/applicationContext-dao.xml", "classpath:spring/applicationContext-service.xml"})
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;

    @Test
    public void testCRUD(){
        System.out.println(departmentMapper);
        employeeMapper.insertSelective(new Employee(1, "Jery", "M","Jerry@qq.com", 1));
        employeeMapper.insertSelective(new Employee(3, "Jerry", "M","Jerry12@qq.com", 1));
    }
}
