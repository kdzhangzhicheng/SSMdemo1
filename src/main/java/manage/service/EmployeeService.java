package manage.service;

import manage.bean.Employee;
import manage.bean.EmployeeExample;
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
        //return (List<Employee>) employeeMapper.selectByPrimaryKeyWithDept(null);
    }

    public void saveEmp(Employee employee) {
        employeeMapper.insert(employee);
    }

    /*
        查询员工是否存在
     */
    public boolean CheckUser(String empName) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        System.out.println("EmployeeService "+empName);
        criteria.andEmp_nameEqualTo(empName);
        long count = employeeMapper.countByExample(employeeExample);

        return count == 0;
    }


    public Employee getEmp(Integer id) {
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }

    public void updateEmp(Employee employee) {
        System.out.println("EmployeeService updateEmp执行");
        System.out.println(employee.toString());
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public void deleteEmpById(Integer id) {
        System.out.println("EmployeeService deleteEmpById执行");
        System.out.println(id);
        employeeMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> ids) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();//创建一个标准
        criteria.andEmp_idIn(ids);//这个标准在list里面
        employeeMapper.deleteByExample(example);
    }
}
