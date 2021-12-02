<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href=${pageContext.request.contextPath}/css/information.css" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<body>
<div id="table">

    <div class="bottom" style="position: absolute">

        <div style="font-size: 30px;margin: 7px">教师信息:</div>
        <hr>
        <div style="margin-top:30px;margin-left:45px;">
            <table>
                <thead  style="background-color: #f2f2f2;">
                <tr>
                    <th style="width: 100px;">教师ID</th>
                    <th>账号</th>
                    <th>密码</th>
                    <th style="width: 100px;">教师名称</th>
                    <th style="width: 100px;">性别</th>
                    <th>手机号码</th>
                    <th>电子邮箱</th>
                    <th>状态</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${teachers.list}" var="p">
                    <tr>
                        <td style="width: 100px;">${p.id}</td>
                        <td>${p.user}</td>
                        <td>${p.password}</td>
                        <td style="width: 100px;">${p.name}</td>
                        <td style="width: 100px;">
                            <c:if test="${p.sex==false}">女</c:if>
                            <c:if test="${p.sex==true}">男</c:if>
                        </td>
                        <td>${p.telephone}</td>
                        <td>${p.email}</td>
                        <td>
                        <c:if test="${!p.pass}"><a href="javascript:pass(${p.id})">审核未通过</a></c:if>
                        <c:if test="${p.pass}"><span>审核通过</span></c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>
        <div class="page">
            <a href="javascript:ajaxsplit(1,0)"><span>首页</span></a>
            <c:forEach var="page"  begin="1" end="${teachers.pages}">
                <a href="javascript:ajaxsplit(${page},0)"><span>&nbsp;${page}&nbsp;</span></a>&nbsp;
            </c:forEach>
            <a href="javascript:ajaxsplit(${teachers.pages},0)"><span>尾页</span></a>
            <span>共${teachers.pages}页</span>
        </div>
    </div>
</div>
</body>
<style>
    *{
        margin: 0px;
        border:0px;
    }
    body{
        background-color: white;
    }
    .page{
        text-align: center;
        position: relative;
        font-size: 22px;
        margin-top: 20px;
    }
    .page a{
        margin-left: 20px;
        background-color: lightslategrey;
        COLOR: white;
        text-decoration: none;
        border-radius: 6px;
    }
    .page a:hover{
        opacity: 0.7;
    }
    tr td,th{
        border-width: 1px;
        border-style: solid;
        border-color: #e6e6e6;
        text-align: center;
        width: 125px;
        height: 50px;
    }
    a{
        text-decoration: none;
    }
    hr{
        display: block;
        padding: 0;
        border: 0;
        height: 0;
        border-top: 1px solid #eee;
        -webkit-box-sizing: content-box;
        box-sizing: content-box;
    }
</style>
<script type="text/javascript">

    function ajaxsplit(now,x) {
        $.ajax({
            url:"${pageContext.request.contextPath}/users/checkteachers_cpl.do",
            data:{"now":now,"x":x},
            type:"post",
            success:function(){
                $("#table").load("${pageContext.request.contextPath}/view/manager/teachers.jsp #table");
            }
        });

    }
    function pass(id) {
        if (confirm("您确定审核通过吗?")) {
            $.ajax({
                url:"${pageContext.request.contextPath}/users/pass.do",
                data:{"id":id},
                type:"post",
                dataType: "text",
                success: function (msg) {
                    alert(msg);
                    $("#table").load("${pageContext.request.contextPath}/view/manager/teachers.jsp #table");
                }
            });
        }
    }
</script>
</html>