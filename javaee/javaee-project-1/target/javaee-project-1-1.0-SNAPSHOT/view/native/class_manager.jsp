<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
    <title></title>
</head>
<script type="text/javascript">
    if ("${msg}" != "") {
        alert("${msg}");
    }
</script>
<body>
<div id="table">
    <div class="title" style="margin: 7px;">加入班级：</div>
    <hr>
    <div class="t-button">
        <button class="button" onclick="join_block()">加入班级</button>
    </div>
    <div class="bottom" style="position:relative;margin-left: 40px;">
        <div style="background-color: aliceblue;margin:20px;width: 500px;" class="mymessage">
            <div style="font-size: 30px;text-align: center;">个人信息</div>
            <table style="width: 400px;">
                <tbody>
                <tr><td>ID:</td><td class="right">${res.id}</td></tr>
                <tr><td>姓名：</td><td class="right">${res.name}</td></tr>
                <tr><td>账号：</td><td class="right">${res.user}</td></tr>
                <tr><td>密码：</td><td class="right">${res.password}</td></tr>
                <tr><td>性别：</td><td class="right">
                    <c:if test="${res.sex==trye}">男</c:if>
                    <c:if test="${res.sex==false}">女</c:if>
                </td></tr>
                <tr><td>手机号码：</td><td class="right">${res.telephone}</td></tr>
                <tr><td>电子邮箱：</td><td class="right">${res.email}</td></tr>
                </tbody>
            </table>
        </div>
    <div class="join-class">
        <span class="class-title">&nbsp;&nbsp;&nbsp;&nbsp;已加入的班级</span>
        <div class="class-mes">
        <ul>
            <c:forEach items="${joinclass}" var="p">
                <li style="padding-top:10px;text-align: center;">${p}</li>
            </c:forEach>
        </ul>
        </div>
    </div>
    <div class="wait-class">
        <span class="class-title">&nbsp;&nbsp;申请待通过的班级</span>
        <div class="class-mes" style="text-align: center">
            <c:forEach items="${join0class}" var="p">
                <li style="padding-top:10px;">${p}</li>
            </c:forEach>
        </div>
    </div>
    </div>


    <div id="jo_class" style="border: 1px solid;width: 100%;margin: auto;height: 100%;position: fixed;left: 0px;top: 0px;background: rgb(0,0,0,0.5);overflow: auto;text-align: center;display: none;">
        <div style="background: white;width: 250px;height: 220px;position: absolute;left: 400px;top: 50px;margin-top: 50px;border-radius: 5px;">

            <form method="post" action="${pageContext.request.contextPath}/nativeclass/add_native_class.do">
                <div style="margin-top: 45px;margin-bottom: 20px;font-size: 16px;">
                <span>班级名称：</span>
                <select style="height: 30px;border-radius: 5px;font-size: 15px; width: 100px;" name="classid">
                    <option disabled>请选择班级</option>
                    <c:forEach items="${allclass}" var="p">
                        <option value="${p.id}">${p.classname}</option>
                    </c:forEach>
                </select>
                </div>
                <div style="margin-top: 20px;margin-bottom: 20px;margin-left:3px;font-size: 16px;"><span>学生姓名：&nbsp;</span><input style="width: 106px;height: 25px;font-size: 16px;" name="kidname" type="text"></div>
                <div style="height: 40px;margin-top: 30px;">
                    <tr>
                        <td><input style="width: 70px;height: 32px;" class="button"  value="提交" type="submit"></td>&nbsp;&nbsp;&nbsp;
                        <td><button style="width: 70px;height: 32px;" class="button" type="button"   onclick="join_none()">返回</button></td>
                    </tr>
                </div>

            </form>

        </div>
    </div>
</div>
</body>
<style>
    .button:hover{
        opacity: 0.7;
    }
    .button{
        background-color: #FF5722;
        border: none;
        color: white;
        font-size: 15px;
        width: 90px;
        height: 40px;
        border-radius: 9px;
    }
    .class-title{
        font-size: 20px;
        text-align: center;
    }
    .class-mes{
        font-size: 18px;
    }
    .join-class {
        position: absolute;
        background-color: aliceblue;
        width: 170px;
        height: 327px;
        border-radius: 6px;
        list-style: none;
        margin: 20px;
        left: 550px;
    }
    .wait-class {
        position: absolute;
        background-color: aliceblue;
        width: 180px;
        height: 327px;
        left: 770px;
        margin: 20px;
        border-radius: 6px;
        list-style: none;
    }
    .mymessage{
        position: absolute;
    }
    .mymessage tr {
        font-size: 20px;
        text-align: center;
    }
    .mymessage td {
        padding: 6px;
    }
    .join-class{
        background-color: aliceblue;

    }
    .join-class ul{
        list-style: none;
    }
    .wait-class{
        background-color: aliceblue;
        list-style: none;
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
    .title{
        font-size: 30px;
    }
    .button{
        background-color: #FF5722;
        border: none;
        color: white;
        font-size: 15px;
        width: 90px;
        height: 40px;
        border-radius: 9px;
    }
    .t-button{
        margin:7px;
    }
    .button:hover{
        opacity: 0.7;
    }
</style>
<script type="text/javascript">
    window.onload=function (){
        $.ajax({
            url:"${pageContext.request.contextPath}/class/getallclass.do",
            type:"post",
            success:function(){
                $("#table").load("${pageContext.request.contextPath}/view/native/class_manager.jsp #table");
            }
        });
        $.ajax({
            url:"${pageContext.request.contextPath}/class/getjoinclass.do",
            data:{"nativeid":${res.id}},
            type:"post",
            success:function(){
                $("#table").load("${pageContext.request.contextPath}/view/native/class_manager.jsp #table");
            }
        });
        $.ajax({
            url:"${pageContext.request.contextPath}/class/getjoin0class.do",
            data:{"nativeid":${res.id}},
            type:"post",
            success:function(){
                $("#table").load("${pageContext.request.contextPath}/view/native/class_manager.jsp #table");
            }
        });

    }

    function join_block(){
        document.getElementById("jo_class").style.display="block";
    }
    function join_none(){
        document.getElementById("jo_class").style.display="none";
        location.reload();
    }
</script>
</html>

