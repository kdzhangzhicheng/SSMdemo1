package manage.bean;

import java.io.Serializable;

public class Department implements Serializable {
    private Integer dept_id;

    private String dept_name;

    private static final long serialVersionUID = 1L;

    public Integer getDept_id() {
        return dept_id;
    }

    public void setDept_id(Integer dept_id) {
        this.dept_id = dept_id;
    }

    public String getDept_name() {
        return dept_name;
    }

    public void setDept_name(String dept_name) {
        this.dept_name = dept_name;
    }
}