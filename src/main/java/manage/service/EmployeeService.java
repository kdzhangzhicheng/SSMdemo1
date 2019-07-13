package manage.service;

import manage.bean.Employee;
import manage.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: 张志诚
 * @Version:
 * @date 2019/7/11 16:38
 * @Description:
 **/

/*
    查询所有员工
 */
@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }
}
