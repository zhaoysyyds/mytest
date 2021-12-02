<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/biaoge.css"/>
<link rel="stylesheet" href=${pageContext.request.contextPath}/css/information.css" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<body>
<div id="table">

    <div class="bottom">

        <div class="title" style="font-size:30px;margin: 7px;">班级教师审核:</div>
        <hr>
        <div style="position: relative;left: 20px;top: 15px;">
            <table>
                <thead style="background-color: #f2f2f2;">
                <tr>
                    <th>班级ID</th>
                    <th>教师ID</th>
                    <th >教师姓名</th>
                    <th>性别</th>
                    <th>手机号码</th>
                    <th>电子邮箱</th>
                    <th>状态</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${teacher_informations.list}" var="p">
                   <tr>
                       <td>${p.classid}</td>
                       <td>${p.teacherid}</td>
                       <td>${p.name}</td>
                       <td style="width: 100px;">
                           <c:if test="${p.sex==false}">女</c:if>
                           <c:if test="${p.sex==true}">男</c:if>
                       </td>
                       <td>${p.telephone}</td>
                       <td>${p.email}</td>
                       <td>
                        <c:if test="${!p.pass}"><a href="javascript:pass(${p.teacherid})">审核未通过</a></c:if>
                        <c:if test="${p.pass}">审核已通过</c:if>
                       </td>
                   </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="page">
            <a href="javascript:ajaxsplit(1,0)"><span>&nbsp;首页&nbsp;</span></a>
            <c:forEach var="page"  begin="1" end="${teacher_informations.pages}">
                <a href="javascript:ajaxsplit(${page},0)"><span>&nbsp;${page}&nbsp;</span></a>&nbsp;
            </c:forEach>
            <a href="javascript:ajaxsplit(${teacher_informations.pages},0)"><span>&nbsp;尾页&nbsp;</span></a>
            &nbsp;
            <span>共${teacher_informations.pages}页</span>
        </div>
    </div>
</div>
</body>
<style>
    tr td,th{
        width: 140px;
        height: 50px;
        font-size: 17px;
    }
    a{
        text-decoration: none;
    }
</style>
<script type="text/javascript">

    function ajaxsplit(now,x) {
        $.ajax({
            url:"${pageContext.request.contextPath}/teacher_class/get_teacher_cpl.do",
            data:{"now":now,"x":x,"classid":${hclassid}},
            type:"post",
            success:function(){
                $("#table").load("${pageContext.request.contextPath}/view/teacher/teacher_information.jsp #table");
            }
        });
    }
    function pass(teacherid) {
        if (confirm("您确定审核通过吗?")) {
            $.ajax({
                url:"${pageContext.request.contextPath}/teacher_class/pass.do",
                data:{"teacherid":teacherid,"classid":${hclassid}},
                type:"post",
                dataType: "text",
                success: function (msg) {
                    alert(msg);
                    $("#table").load("${pageContext.request.contextPath}/view/teacher/teacher_information.jsp #table");
                }
            });
        }
    }
</script>
</html>
