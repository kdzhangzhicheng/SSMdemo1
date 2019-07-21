package manage.controller;


import manage.bean.Department;
import manage.bean.Msg;
import manage.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author: 张志诚
 * @Version:
 * @date 2019/7/14 18:19
 * @Description:
 **/

@Controller
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg GetDepts(){
        List<Department> list = departmentService.getDepts();
        return Msg.success().add("depts", list);
    }
}
