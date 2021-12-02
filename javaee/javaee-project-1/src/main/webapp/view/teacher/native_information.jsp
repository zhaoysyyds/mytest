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

        <div class="title" style="margin:7px;font-size: 30px;">学生家长审核:</div>
        <hr>
        <div style="position: relative;left: 45px;top: 25px;">
            <table>
                <thead  style="background-color: #f2f2f2;">
                <tr>
                    <th>班级ID</th>
                    <th>家长ID</th>
                    <th>学生家长</th>
                    <th>家长姓名</th>
                    <th>手机号码</th>
                    <th>电子邮箱</th>
                    <th>性别</th>
                    <th>状态</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${native_informations.list}" var="p">
                <tr>
                    <td>${p.classid}</td>
                    <td>${p.nativeid}</td>
                    <td>${p.kidname}家长</td>
                    <td>${p.name}</td>
                    <td>${p.telephone}</td>
                    <td>${p.email}</td>
                    <td style="width: 100px;">
                        <c:if test="${p.sex==false}">女</c:if>
                        <c:if test="${p.sex==true}">男</c:if>
                    </td>
                    <td>
                        <c:if test="${!p.pass}"><a href="javascript:pass(${p.nativeid})">审核未通过</a></c:if>
                        <c:if test="${p.pass}">审核通过</c:if>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="page" style="margin-top:50px">
            <a href="javascript:ajaxsplit(1,0)"><span>&nbsp;首页&nbsp;</span></a>
            <c:forEach var="page"  begin="1" end="${native_informations.pages}">
                <a href="javascript:ajaxsplit(${page},0)"><span>&nbsp;${page}&nbsp;</span></a>&nbsp;
            </c:forEach>
            <a href="javascript:ajaxsplit(${native_informations.pages},0)"><span>&nbsp;尾页&nbsp;</span></a>
            &nbsp;
            <span>共${native_informations.pages}页</span>
        </div>
    </div>
</div>
</body>
<style>
    tr td,th{
        width: 115px;
        height: 50px;
        font-size: 16px;
    }
    a{
        text-decoration: none;
    }
</style>
<script type="text/javascript">

    function ajaxsplit(now,x) {
        $.ajax({
            url:"${pageContext.request.contextPath}/nativeclass/get_byid_cpl.do",
            data:{"now":now,"x":x,"classid":${hclassid}},
            type:"post",
            success:function(){
                $("#table").load("${pageContext.request.contextPath}/view/teacher/native_information.jsp #table");
            }
        });
    }
        function pass(nativeid) {
            if (confirm("您确定审核通过吗?")) {
                $.ajax({
                    url:"${pageContext.request.contextPath}/nativeclass/pass.do",
                    data:{"nativeid":nativeid,"classid":${hclassid}},
                    type:"post",
                    dataType: "text",
                    success: function (msg) {
                        alert(msg);
                        $("#table").load("${pageContext.request.contextPath}/view/teacher/native_information.jsp #table");
                    }
                });
            }
    }
</script>
</html>
