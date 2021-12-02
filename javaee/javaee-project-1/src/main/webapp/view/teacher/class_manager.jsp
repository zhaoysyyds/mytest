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
    <div class="title" style="margin: 7px;">班级管理：</div>
    <hr>
    <div class="two-button">
        <button class="button" onclick="join_block()">加入班级</button>&nbsp;&nbsp;&nbsp;
        <c:if test="${myclass==null}">
        <button class="button" onclick="add_block()">创建班级</button>
        </c:if>
    </div>
    <div class="bottom" style="position:relative;margin-left: 13px;">
    <div style="background-color: aliceblue;margin:20px;width: 400px;" class="mymessage">
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
    <span class="class-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已加入班级</span>
        <div class="class-mes">
    <ul style="list-style: none;">
        <li style="text-align: center;">班级ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班级名称</li>
    <c:forEach items="${classNames}" var="p">
       <li style="text-align: center;">&nbsp;&nbsp;&nbsp;&nbsp;${p.classId}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${p.className}</li>
    </c:forEach>
    </ul>
        </div>
    </div>
    <div class="wait-class">
        <span class="class-title">&nbsp;&nbsp;申请待通过的班级</span>
        <div class="class-mes" style="text-align: center">
            <c:forEach items="${join0class}" var="p">
                <li>${p}</li>
            </c:forEach>
        </div>
    </div>
    <div class="my-class">
        <span class="class-title">&nbsp;&nbsp;&nbsp;&nbsp;你创建的班级</span>
        <div class="class-mes">
            <table id="my-class" style="font-size: 18px;margin-top: 10px">
            <tr><td>&nbsp;班级ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>${myclass.id}</td></tr>
            <tr><td>&nbsp;班级名称:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>${myclass.classname}</td></tr>
            <tr><td>&nbsp;班主任ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>${myclass.hmasterid}</td></tr>
            <tr><td>&nbsp;状态:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>
                <c:if test="${myclass.pass==true}">通过</c:if>
                <c:if test="${myclass.pass==false}">未通过</c:if>
            </td></tr>
            </table>
        </div>
    </div>
    </div>
    <div id="add_class" style="border: 1px solid;width: 100%;margin: auto;height: 100%;position: fixed;left: 0px;top: 0px;background: rgb(0,0,0,0.5);overflow: auto;text-align: center;display: none;">
        <div style="background: white;width: 250px;height: 150px;margin-left:400px;margin-top: 130px;border-radius: 5px;">

            <form method="post" action="${pageContext.request.contextPath}/class/add_class.do">

                <div style="height: 100px;border-bottom: 1px solid #CCCCCC;">
                    <tr>
                        <td>年级：</td>
                        <td>
                            <input type="radio" name="grade" id="grade1" value="高一" checked><label for="grade1">高一</label>
                            &nbsp&nbsp&nbsp&nbsp
                            <input type="radio" name="grade" id="grade2" value="高二"><label for="grade2">高二</label>
                            &nbsp&nbsp&nbsp&nbsp
                            <input type="radio" name="grade" id="grade3" value="高三"><label for="grade3">高三</label>
                        </td>
                    </tr>
                    <br>
                    <br>
                    <tr>
                        <td>班级：</td>
                        <td>
                            <select name="aclass">
                                <option value="0" disabled>请选择班级</option>
                                <option value="一班">一班</option>
                                <option value="二班">二班</option>
                                <option value="三班">三班</option>
                                <option value="四班">四班</option>
                                <option value="五班">五班</option>
                            </select>
                        </td>
                    </tr>
                </div>
                <div style="height: 40px;margin-top: 10px;">
                    <tr>
                        <td><input style="width: 70px;height: 32px;" class="button"  value="提交" type="submit"></td>&nbsp;
                        <td><button style="width: 70px;height: 32px;" class="button" type="button"onclick="add_none()">返回</button></td>
                    </tr>
                </div>

            </form>

        </div>
    </div>


    <div id="join_class" style="border: 1px solid;width: 100%;margin: auto;height: 100%;position: fixed;left: 0px;top: 0px;background: rgb(0,0,0,0.5);overflow: auto;text-align: center;display: none;">
        <div style="background: white;width: 250px;height: 150px;margin: 380px;margin-top: 100px;border-radius: 5px;">

            <form method="post" action="${pageContext.request.contextPath}/teacher_class/add_teacher_class.do">
                <select name="classid" style="margin-top: 25px;height: 30px;border-radius: 5px;font-size: 15px;width: 100px;">
                    <option disabled>请选择班级</option>
                    <c:forEach items="${allclass}" var="p">
                    <option value="${p.id}">${p.classname}</option>
                    </c:forEach>
                </select>
                <div style="height: 40px;margin-top: 25px;">
                    <tr>
                        <td><input style="width: 70px;height: 32px;" class="button"  value="提交" type="submit"></td>
                        &nbsp;&nbsp;
                        <td><button  style="width: 70px;height: 32px;" class="button" type="button"   onclick="join_none()">返回</button></td>
                    </tr>
                </div>

            </form>

        </div>
    </div>
</div>
</body>
<style>
    #my-class tr{
        text-align: center;
    }
    .class-mes{
        font-size: 18px;
        margin-top: 10px;
    }
    .class-mes li{
        margin-top: 5px;
    }
    .class-title{
        font-size: 20px;
        text-align: center;
    }
    .mymessage td{
     padding: 6px;
    }
    .mymessage tr{
        font-size: 20px;
        text-align: center;
    }
    .mymessage right{
        text-align: center;
    }
    .mymessage{
        position: absolute;
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
    .my-class {
        position: absolute;
        background-color: aliceblue;
        width: 190px;
        height: 327px;
        border-radius: 6px;
        left: 830px;
        margin: 20px;
        list-style: none;
    }
    .join-class {
        position: absolute;
        background-color: aliceblue;
        width: 170px;
        height: 327px;
        border-radius: 6px;
        list-style: none;
        margin: 20px;
        left: 430px;
    }
    .wait-class {
        position: absolute;
        background-color: aliceblue;
        width: 180px;
        height: 327px;
        left: 630px;
        margin: 20px;
        border-radius: 6px;
        list-style: none;
    }
    body{
        background-color: white;
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
    .two-button{
        margin:7px;
    }
    .button:hover{
        opacity: 0.7;
    }
</style>
<script type="text/javascript">
    window.onload=function (){
        $.ajax({
            url:"${pageContext.request.contextPath}/teacher_class/get_byid.do",
            data:{"teacherid":${res.id}},
            type:"post",
            success:function(){
                $("#table").load("${pageContext.request.contextPath}/view/teacher/class_manager.jsp #table");
            }
        });
        $.ajax({
            url:"${pageContext.request.contextPath}/teacher_class/get_byid.do",
            data:{"teacherid":${res.id}},
            type:"post",
            success:function(){
                $("#table").load("${pageContext.request.contextPath}/view/teacher/class_manager.jsp #table");
            }
        });
        $.ajax({
            url:"${pageContext.request.contextPath}/class/getallclass.do",
            data:{"teacherid":${res.id}},
            type:"post",
            success:function(){
                $("#table").load("${pageContext.request.contextPath}/view/teacher/class_manager.jsp #table");
            }
        });
        $.ajax({
            url:"${pageContext.request.contextPath}/class/getaclass.do",
            data:{"teacherid":${res.id}},
            type:"post",
            success:function(){
                $("#table").load("${pageContext.request.contextPath}/view/teacher/class_manager.jsp #table");
            }
        });
        $.ajax({
            url:"${pageContext.request.contextPath}/teacher_class/getjoin0class.do",
            data:{"teacherid":${res.id}},
            type:"post",
            success:function(){
                $("#table").load("${pageContext.request.contextPath}/view/teacher/class_manager.jsp #table");
            }
        });
    }

    function add_block(){
        document.getElementById("add_class").style.display="block";
    }
    function add_none(){
        document.getElementById("add_class").style.display="none";
        location.reload();
    }

    function join_block(){
        document.getElementById("join_class").style.display="block";
    }
    function join_none(){
        document.getElementById("join_class").style.display="none";
        location.reload();
    }
</script>
</html>
