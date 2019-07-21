package manage.bean;

import org.hibernate.validator.constraints.Email;

import javax.validation.constraints.Pattern;
import java.io.Serializable;

public class Employee implements Serializable {
    private Integer emp_id;

    @Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})", message = "用户名输入错误，2到5个汉字或者6到16位英文名字")
    private String emp_name;

    private String gender;

    @Email
    private String email;

    private Integer d_id;

    /*
        查询员工的时候把部门查出来
    */

    private Department department;

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    private static final long serialVersionUID = 1L;

    public Integer getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(Integer emp_id) {
        this.emp_id = emp_id;
    }

    public String getEmp_name() {
        return emp_name;
    }

    public void setEmp_name(String emp_name) {
        this.emp_name = emp_name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getD_id() {
        return d_id;
    }

    public void setD_id(Integer d_id) {
        this.d_id = d_id;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "emp_id=" + emp_id +
                ", emp_name='" + emp_name + '\'' +
                ", gender='" + gender + '\'' +
                ", email='" + email + '\'' +
                ", d_id=" + d_id +
                ", department=" + department +
                '}';
    }
}