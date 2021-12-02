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
    <div class="top">

    </div>
    <div class="bottom" style="position: absolute">
        <div class="title" style="font-size: 30px;margin: 7px">班级信息:</div>
        <hr>
        <div style="margin-left:40px;margin-top:30px;">
            <table>
                <thead style="background-color: #f2f2f2;">
                <tr>
                    <th>班级ID</th>
                    <th>班级名称</th>
                    <th>班主任ID</th>
                    <th>班主任名称</th>
                    <th>手机号码</th>
                    <th>电子邮箱</th>
                    <th>状态</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${classes.list}" var="p">
                    <tr>
                        <td>${p.id}</td>
                        <td>${p.classname}</td>
                        <td>${p.hmasterid}</td>
                        <td>${p.name}</td>
                        <td>${p.telephone}</td>
                        <td>${p.email}</td>
                        <td>
                            <c:if test="${!p.pass}"><a href="javascript:pass(${p.id},${p.hmasterid})">审核未通过</a></c:if>
                            <c:if test="${p.pass}"><span>审核通过</span></c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>



        </div>
        <div class="page">
            <a href="javascript:ajaxsplit(1,0)"><span>首页</span></a>
            <c:forEach var="page"  begin="1" end="${classes.pages}">
                <a href="javascript:ajaxsplit(${page},0)"><span>&nbsp;${page}&nbsp;</span></a>&nbsp;
            </c:forEach>
            <a href="javascript:ajaxsplit(${classes.pages},0)"><span>尾页</span></a>
            <span>共${classes.pages}页</span>
        </div>
    </div>
</div>
</body>
<style>
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
    body{
        background-color: white;
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
    tr td,th{
        border-width: 1px;
        border-style: solid;
        border-color: #e6e6e6;
        text-align: center;
        width: 135px;
        height: 50px;
    }
    a{
        text-decoration: none;
    }
    *{
        margin: 0px;
        border:0px
    }
</style>
<script type="text/javascript">

    function ajaxsplit(now,x) {
        $.ajax({
            url:"${pageContext.request.contextPath}/class/getclasses_cpl.do",
            data:{"now":now,"x":x},
            type:"post",
            success:function(){
                $("#table").load("${pageContext.request.contextPath}/view/manager/classes.jsp #table");
            }
        });

    }
    function pass(id,hmasterid) {
        if (confirm("您确定审核通过吗?")) {
            $.ajax({
                url:"${pageContext.request.contextPath}/class/pass.do",
                data:{"id":id},
                type:"post",
                dataType: "text",
                success: function (msg) {
                    $.ajax({
                        url:"${pageContext.request.contextPath}/teacher_class/passhmaster.do",
                        data:{"classid":id,"hmasterid":hmasterid},
                        type:"post",
                        dataType: "text",
                        success: function () {
                            alert(msg);
                            $("#table").load("${pageContext.request.contextPath}/view/manager/classes.jsp #table");
                        }
                    });
                }
            });
        }
    }
</script>
</html>