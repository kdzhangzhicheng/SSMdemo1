package manage.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import manage.bean.Employee;
import manage.bean.Msg;
import manage.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;


import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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




    //检查用户名是否可用

    @RequestMapping(value = "/CheckUser")
    @ResponseBody
    public Msg CheckUser(@RequestParam("empName") String empName){
        System.out.println("EmployeeController中CheckUser执行");
        System.out.println("EmployeeController"+empName);
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if(!empName.matches(regx)){
            return Msg.fail().add("vs_msg", "来自后台的校验,用户名输入错误，2到5个汉字或者6到16位英文名字");
        }
        boolean b = employeeService.CheckUser(empName);
        if (b){
            return Msg.success();
        }else{
            return Msg.fail().add("vs_msg", "用户名 不可用");
        }
    }


    @RequestMapping(value = "/empdel/{ids}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmpById(@PathVariable("ids") String ids){
        if (ids.contains("-")){//批量删除
            List<Integer> del_list = new ArrayList<>();
            String[] str_ids = ids.split("-");
            for (String str_id: str_ids) {
                del_list.add(Integer.parseInt(str_id));
            }
            System.out.println("执行EmployeeController中的deleteEmpById");
            System.out.println("要删除的list"+del_list);
            employeeService.deleteBatch(del_list);
        }else{
            employeeService.deleteEmpById(Integer.parseInt(ids));
        }

        return Msg.success();
    }







    /*
        ResponseBody如果想要正常工作，需要引入jackon包
     */
    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid  Employee employee , BindingResult result){
        if (result.hasErrors()){
            //校验失败
            Map<String, Object> map = new HashMap<>();
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError:fieldErrors ) {
                System.out.println("错误字段名"+fieldError.getField());
                System.out.println("错误信息"+fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        }else{
            System.out.println("EmployeeController-saveEmp进行保存");
            employeeService.saveEmp(employee);
            return Msg.success();
        }

    }


    @RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
    @ResponseBody
    //@PathVariable指的是从路径中取出的id
    public Msg getEmp(@PathVariable("id") Integer id){
        System.out.println("EmployController中getEmp执行");
        Employee employee = employeeService.getEmp(id);
        return Msg.success().add("emp", employee);
    }



    @RequestMapping(value = "/emp/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@PathVariable("id") Integer id ,Employee employee){
        System.out.println("EmployController中saveEmp执行");
        employee.setEmp_id(id);
        employeeService.updateEmp(employee);
        return Msg.success();
    }






    @RequestMapping(value = "/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn){

        /*
            引入PageHelper分页插件
            在查询之前需要调用，传入页码以及每页的大小
         */
        PageHelper.startPage(pn, 5);
        /*
            startPage后面紧跟的一个查询就是分页查询
         */
        List<Employee> emps = employeeService.getAll();

        /*
            使用pageInfo包装查询后的结果，只要将pageInfo交给页面就行了
         */
        PageInfo page = new PageInfo(emps, 5);
        return Msg.success().add("pageInfo", page);
    }


    /*
    进行分页查询
     */
    //@RequestMapping("/emps")
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
