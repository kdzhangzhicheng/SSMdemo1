package manage.dao;

import java.util.List;
import manage.bean.Employee;
import manage.bean.EmployeeExample;
import org.apache.ibatis.annotations.Param;

public interface EmployeeMapper {
    long countByExample(EmployeeExample example);

    int deleteByExample(EmployeeExample example);

    int deleteByPrimaryKey(Integer emp_id);

    int insert(Employee record);

    int insertSelective(Employee record);



    List<Employee> selectByExample(EmployeeExample example);

    Employee selectByPrimaryKey(Integer emp_id);



    List<Employee> selectByExampleWithDept(EmployeeExample example);

    Employee selectByPrimaryKeyWithDept(Integer emp_id);


    int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByExample(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
}