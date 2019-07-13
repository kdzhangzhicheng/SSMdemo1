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

<

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

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>SSM-CRUD</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button type="button" class="btn btn-primary">新增</button>
                <button type="button" class="btn btn-danger">删除</button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
               <table class="table table-hover">
                   <tr>
                       <th>#</th>
                       <th>empName</th>
                       <th>gender</th>
                       <th>email</th>
                       <th>deptName</th>
                       <th>操作</th>
                   </tr>

                   <c:forEach items="${pageInfo.list}" var="emp">
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

                   </c:forEach>


               </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">

               当前第${pageInfo.pageNum}页, 总共${pageInfo.pages}页, 共${pageInfo.total}条记录
            </div>
            <div class="col-md-6">
                <nav aria-label="Page navigation">

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
                </nav>

            </div>
        </div>

    </div>
</body>
</html>
