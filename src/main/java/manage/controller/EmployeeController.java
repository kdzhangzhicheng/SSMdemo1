package manage.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import manage.bean.Employee;
import manage.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import java.util.List;

/**
 * @Author: 张志诚
 * @Version:
 * @date 2019/7/11 16:32
 * @Description: 处理员工CRUD
 **/

@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;
    /*
    进行分页查询
     */
    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
                          Model model){

        PageHelper.startPage(pn, 5);
        List<Employee> emps = employeeService.getAll();
        PageInfo page = new PageInfo(emps, 5);
        model.addAttribute("pageInfo", page);

        System.out.println(emps.size());
        return "list"; //返回list.jsp
    }
}
