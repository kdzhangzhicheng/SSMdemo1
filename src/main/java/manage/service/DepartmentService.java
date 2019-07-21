package manage.service;

import manage.bean.Department;
import manage.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: 张志诚
 * @Version:
 * @date 2019/7/14 18:20
 * @Description:
 **/
@Service
public class DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;
    public List<Department> getDepts() {
        List<Department> list = departmentMapper.selectByExample(null);
        return list;
    }
}
