<%--
  Created by IntelliJ IDEA.
  User: zhichengpc
  Date: 2019/7/13
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>

<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>



<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <title>员工列表</title>
</head>
<body>

<script type="text/javascript">

    var c = '<%=request.getAttribute("pageInfo")%>';
    console.log(c);
</script>

<div class="modal fade" id="empAddModel" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工表单</h4>
            </div>
            <div class="modal-body">


                <form class="form-horizontal">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">员工编号</label>
                        <div class="col-sm-10">
                            <input type="text" name="emp_id" class="form-control" id="emp_add_empid" placeholder="empid">
                        </div>
                    </div>


                    <div class="form-group">
                        <label  class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="emp_name" class="form-control" id="emp_add_empname" placeholder="empName">
                            <span class="help-block"></span>
                        </div>

                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="emp_add_emp_email" placeholder="Email@xxx.com">
                            <span class="help-block"></span>
                        </div>
                    </div>


                    <div class="form-group">
                        <label  class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label  class="col-sm-2 control-label">部门名称</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="d_id" id="dept_add_select">
                            </select>
                        </div>

                    </div>

                </form>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->








<div class="modal fade" id="empUpdateModel" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工表单</h4>
            </div>
            <div class="modal-body">


                <form class="form-horizontal">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">员工编号</label>
                        <div class="col-sm-10">
                            <%--<input type="text" name="emp_id" class="form-control" id="emp_update_empid" placeholder="empid">--%>
                            <p name="emp_id" class="form-control-static" id="emp_update_empid"></p>
                        </div>
                    </div>


                    <div class="form-group">
                        <label  class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <%--<input type="text" name="emp_name" class="form-control" id="emp_update_empname" placeholder="empName">--%>
                            <p name="emp_name" class="form-control-static" id="emp_update_empname"></p>
                            <span class="help-block"></span>
                        </div>

                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="emp_update_emp_email" placeholder="Email@xxx.com">
                            <span class="help-block"></span>
                        </div>
                    </div>


                    <div class="form-group">
                        <label  class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label  class="col-sm-2 control-label">部门名称</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="d_id" id="dept_update_select">
                            </select>
                        </div>

                    </div>

                </form>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">修改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->









<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button type="button" class="btn btn-primary" id="emp_add_model_btn">新增 </button>
            <button type="button" class="btn btn-danger" id="delete_all_btn">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">

                <thead>
                    <tr>
                        <th>
                            <input type="checkbox" id="check_all"/>
                        </th>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                </thead>


                <tbody>

                </tbody>



                <%--<tr>--%>

                    <%--<th>--%>
                        <%--<button class="btn btn-primary btn-sm">--%>
                            <%--<span class="glyphicon glyphicon-pencil" aria-hidden="true">编辑</span>--%>
                        <%--</button>--%>
                        <%--<button class="btn btn-danger btn-sm">--%>
                            <%--<span class="glyphicon glyphicon-trash" aria-hidden="true">删除</span>--%>
                        <%--</button>--%>
                    <%--</th>--%>
                <%--</tr>--%>

<%--                <c:forEach items="${pageInfo.list}" var="emp">
                    <tr>
                        <th>${emp.emp_id}</th>
                        <th>${emp.emp_name}</th>
                        <th>${emp.gender == "M"?"男":"女"}</th>
                        <th>${emp.email}</th>
                        <th>${emp.department.dept_name}</th>
                        <th>
                            <button class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true">编辑</span>
                            </button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true">删除</span>
                            </button>
                        </th>
                    </tr>

                </c:forEach>--%>

            </table>
        </div>
    </div>




    <script type="text/javascript">

        $(function () {

            to_page(1);

            /*$.ajax({
                url:"${APP_PATH}/emps",
                data:"pn=1",
                type:"GET",
                success:function (result) {
                    console.log(result);
                    build_emps_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                }
            })*/
        });

        function to_page(pn) {
            $.ajax({
                url:"${APP_PATH}/emps",
                data:"pn="+pn,
                type:"GET",
                success:function (result) {
                    build_emps_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                }
            })
        }

        function build_emps_table(result) {
            $("#emps_table tbody").empty();
            var emps = result.extend.pageInfo.list;
            $.each(emps, function (index, item) {
                var checkBoxTd = $("<input type='checkbox' class='check_item'/>");
                var empIdTd = $("<th></th>").append(item.emp_id);
                var empNameTd = $("<th></th>").append(item.emp_name);
                var empGenderTd = $("<th></th>").append(item.gender == 'M'?'男':'女');
                var empEmailTd = $("<th></th>").append(item.email);
                var deptNameTd = $("<th></th>").append(item.department.dept_name);
                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                    .append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");
                editBtn.attr("edit_id", item.emp_id);

                var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                    .append("<span></span>").addClass("glyphicon glyphicon-trash").append("删除");
                delBtn.attr("delete_id", item.emp_id);

                var btnTD = $("<td></td>").append(editBtn).append(delBtn);
                //
                $("<tr></tr>").append(checkBoxTd).append(empIdTd).append(empNameTd).append(empGenderTd)
                    .append(empEmailTd)
                    .append(deptNameTd)
                    .append(btnTD)
                    .appendTo("#emps_table tbody");
            })
        };

        function build_page_info(result){
            /*加载之前先清空防止连接两次*/
            $("#page_info_area").empty();

            $("#page_info_area").append("当前第"+result.extend.pageInfo.pageNum+"页, 总共"+
                result.extend.pageInfo.pages+"页, 共"+
                result.extend.pageInfo.total+"条记录");
        };


        function build_page_nav(result){
            $("#page_nav_area").empty();
            var ul = $("<ul></ul>").addClass("pagination");


            if(result.extend.pageInfo.hasPreviousPage){
                var prePageLi = $("<li></li>").append($("<a href='#'>&laquo;</a>"));
                var firstPageLi = $("<li></li>").append($("<a href='#'>首页</a>"));
            }else{
                var firstPageLi = $("<li class='disabled'></li>").append($("<a href='#'>首页</a>"));
                var prePageLi = $("<li class='disabled'></li>").append($("<a href='#'>&laquo;</a>"));
            }

            if(result.extend.pageInfo.hasNextPage){
                var nextPageLi = $("<li></li>").append($("<a href='#'>&raquo;</a>"));
                var lastPageLi = $("<li></li>").append($("<a href='#'>尾页</a>"));
            }else{
                var nextPageLi = $("<li class='disabled'></li>").append($("<a href='#'>&raquo;</a>"));
                var lastPageLi = $("<li class='disabled'></li>").append($("<a href='#'>尾页</a>"));
            }

            prePageLi.click(function () {
               if(result.extend.pageInfo.hasPreviousPage){
                   to_page(result.extend.pageInfo.pageNum-1);
               }
            });

            nextPageLi.click(function () {
                if(result.extend.pageInfo.hasNextPage){
                    to_page(result.extend.pageInfo.pageNum+1);
                }
            });

            firstPageLi.click(function () {
                to_page(1);
            });

            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });





            ul.append(firstPageLi).append(prePageLi);
            $.each(result.extend.pageInfo.navigatepageNums,
            function (index, item) {
                console.log(item);
               if (result.extend.pageInfo.pageNum == item){
                   var numLi =  $("<li class='active'></li>").append($("<a href='#'>"+item+"</a>"));
               }else{
                   var numLi =  $("<li></li>").append($("<a href='#'>"+item+"</a>"));
               }
               numLi.click(function () {
                   to_page(item);
               });

               ul.append(numLi);
            });
            ul.append(nextPageLi).append(lastPageLi);
            var navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area");
        };

        function getDepts(ele) {
            $.ajax({
                url:"${APP_PATH}/depts",
                type:"GET",
                success:function (result) {
                    /*{
                        "code": 100,
                        "msg": "处理成功",
                        "extend": {
                        "depts": [
                            {
                                "dept_id": 1,
                                "dept_name": "开发部"
                            },
                            {
                                "dept_id": 2,
                                "dept_name": "测试部"
                            }
                        ]
                    }
                    }*/
                    $.each(result.extend.depts,function () {
                       var optionEle = $("<option value="+this.dept_id+">"+this.dept_name+"</option>");

                       optionEle.appendTo(ele);
                    });
                }
            })
        }


        $("#emp_add_model_btn").click(function () {
            $("#dept_add_select").empty();
            $("#empAddModel form")[0].reset();
            //"#dept_add_select"
            getDepts("#dept_add_select");

            $("#empAddModel").modal({
               backdrop:"static"
            });
        });






        $("#emp_add_empname").change(function () {
            $.ajax({
                url:"${APP_PATH}/CheckUser",
                data:"empName="+$("#emp_add_empname").val(),
                type:"POST",
                success: function (result) {
                    console.log("emp_add_empname返回的result");
                    console.log(result);

                    if (result.code == 100){
                        $("#emp_add_empname").parent().removeClass();
                        $("#emp_add_empname").parent().addClass("has-success");
                        $("#emp_add_empname").next("span").text("");
                        $("#emp_save_btn").attr("ajax-va","success");
                    }else{
                        console.log(result.code);
                        $("#emp_add_empname").parent().removeClass();
                        $("#emp_add_empname").parent().addClass("has-error");
                        /*$("#emp_add_empname").next("span").text("用户已经存在");*/
                        $("#emp_add_empname").next("span").text(result.extend.vs_msg);
                        $("#emp_save_btn").attr("ajax-va", "error");
                    }
                }
            });
        });






        function validate_add_form() {
            $("#emp_add_empname").parent().removeClass();
            $("#emp_add_emp_email").parent().removeClass();
            var empName = $("#emp_add_empname").val();
            var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
            if (!regName.test(empName)){
                alert("用户名输入错误，2到5个汉字或者6到16位英文名字");
                $("#emp_add_empname").parent().addClass("has-error");
                $("#emp_add_empname").next("span").text("用户名输入错误，2到5个汉字或者6到16位英文名字");
                return false;
            }else {
                $("#emp_add_empname").parent().addClass("has-success");
                $("#emp_add_empname").next("span").text("");
            }

            var email = $("#emp_add_emp_email").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if (!regEmail.test(email)){
                alert("邮箱格式不对");
                $("#emp_add_emp_email").parent().addClass("has-error");
                $("#emp_add_emp_email").next("span").text("邮箱格式不对");
                return false;
            }else{
                $("#emp_add_emp_email").parent().addClass("has-success");
                $("#emp_add_emp_email").next("span").text("");
            }
            return true;
        }
        
        $("#emp_save_btn").click(function () {

            if(!validate_add_form()){
                console.log("validate_add_form校验失败");
                return false;
            }

            if($("#emp_save_btn").attr("ajax-va")=="error"){
                console.log("emp_save_btn检验失败")
                return false;
            }
            //将表单数据提交
            $.ajax({
               url:"${APP_PATH}/emp",
                type:"POST",
                data:$("#empAddModel form").serialize(),
                success:function (result) {
                   if (result.code ==100){
                       console.log("emp_save_btn");
                       console.log(result);
                       $("#empAddModel").modal('hide');
                       to_page(result.extend.pageInfo.total);
                   }else{
                       console.log(result);
                   }


                }
            });
        });



        $(document).on("click", ".edit_btn", function () {
            $("#empUpdateModel").modal({
                backdrop:"static"
            });
            $("#dept_update_select").empty();

            getEmp($(this).attr("edit_id"));
            $("#emp_update_btn").attr("edit_id", $(this).attr("edit_id"));
            getDepts("#dept_update_select");

        });


        $(document).on("click", ".delete_btn", function () {
            $.ajax({
                url:"${APP_PATH}/empdel/"+$(this).attr("delete_id"),
                type:"DELETE",
                success:function (result) {
                    console.log("delete请求");
                    console.log(result);
                    alert("删除成功");
                }
            });
        });






        function getEmp(id) {
            console.log(id);
            $.ajax({
                url:"${APP_PATH}/emp/"+id,
                type:"GET",
                success: function (result) {
                    console.log("getEmp返回");
                    console.log(result);
                    var empData = result.extend.emp;
                    $("#emp_update_empid").text(empData.emp_id);
                    $("#emp_update_empname").text(empData.emp_name);
                    $("#emp_update_emp_email").val(empData.email);
                    $("#empUpdateModel input[name=gender]").val([empData.gender])

                }
            })
        }

        $("#emp_update_btn").click(function () {
            $.ajax({
                url:"${APP_PATH}/emp/"+$(this).attr("edit_id"),
                type:"POST",
                data:$("#empUpdateModel form").serialize(),
                success:function (result) {
                    console.log("emp_update_btn");
                    console.log(result);
                    $("#empUpdateModel").modal('hide');
                }
            });
        });


        $("#check_all").click(function () {
            alert($(this).prop("checked"));
            $(".check_item").prop("checked", $(this).prop("checked"));
        });


        $(document).on("click", ".check_item", function () {
            var flag = $(".check_item:checked").length == $(".check_item").length;
            $("#check_all").prop("checked",flag);

        });

        $("#delete_all_btn").click(function () {
            var empName = "";
            var del_idstr = "";
            $.each($(".check_item:checked"), function () {
               empName = empName + $(this).parents("tr").find("th:eq(1)").text()+",";
               del_idstr = del_idstr + $(this).parents("tr").find("th:eq(0)").text()+"-";
            });
            console.log(empName);
            $.ajax({
                url:"${APP_PATH}/empdel/"+del_idstr,
                type:"DELETE",
                success:function (result) {
                    console.log("delete_all_btn"+result);
                }
            });
        });



    </script>

    <div class="row">
        <div class="col-md-6" id="page_info_area">


        </div>
        <div class="col-md-6" id="page_nav_area">
            <%--<nav aria-label="Page navigation">

                <ul class="pagination">
                    <li><a href="${APP_PATH}/emps?pn=1">首页</a></li>

                    <c:if test="${pageInfo.pageNum!=1}">
                        <li>

                            <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>

                    </c:if>

                    <c:if test="${pageInfo.pageNum==1}">
                        <li>

                            <a href="${APP_PATH}/emps?pn=1" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>

                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum}">
                            <li class="active"><a href="#">${page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum}">
                            <li ><a href="${APP_PATH}/emps?pn=${page_Num}">${page_Num}</a></li>
                        </c:if>

                    </c:forEach>

                    <c:if test="${pageInfo.pageNum==pageInfo.pages}">
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.pages}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>

                    </c:if>

                    <c:if test="${pageInfo.pageNum!=pageInfo.pages}">
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>

                    </c:if>

                    <li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">尾页</a></li>
                </ul>
            </nav>--%>

        </div>
    </div>

</div>
</body>
</html>
