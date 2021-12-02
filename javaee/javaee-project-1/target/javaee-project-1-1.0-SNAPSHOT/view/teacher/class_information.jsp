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
    <div class="bottom" >

        <div style="font-size: 30px;margin: 7px;">班级通知：</div>
        <hr>
        <div class="top">
            <div class="top-1" id="myse">
                <select  id="myselect" onchange="ajaxclass()">
                    <option value="0" disabled>请选择班级</option>
                    <c:forEach items="${classNames}" var="temp">
                        <option value="${temp.classId}">${temp.className}</option>
                    </c:forEach>
                </select>
                <div class="top-2">
                    <input onclick="add_block()" class="button" type="button" value="发布通知" >
                </div>
            </div>

            <div class="top-3">
                <form style="font-size: 17px;">
                    老师名称：<input style="width: 150px;" id="name" type="text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    通知标题：<input style="width: 150px;" id="title" type="text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    起始日期：<input id="date" type="date">

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="button" type="button" onclick="condition()">查询</button>
                </form>
            </div>
        </div>

       <div id="check">
        <div>
            <table>
                <thead>
                <tr style="position:relative;">
                    <th style="position: absolute">通知标题</th>
                    <th>发布人</th>
                    <th>发布时间</th>
                    <th>操作</th>
                </tr>
                </thead>

                <c:if test="${class_informations.pages!=0}">
                <tbody>

                <c:forEach items="${class_informations.list}" var="p" >
                <tr class="option">
                    <td class="title">
                        <a href="${pageContext.request.contextPath}/communicate/get_byciid.do?now=${p.now}">${p.title}</a>
                    </td>
                    <td class="name">${p.name}教师</td>
                    <td class="time">${p.date}</td>
                    <td class="tool"> <c:if test="${p.teacherid==res.id}"><a href="javascript:delete_byid(${p.id})">删除</a></c:if></td>

                </tr>
                </c:forEach>
                </tbody>
                </c:if>
            </table>
        </div>
        <c:if test="${class_informations.pages!=0}">
        <div class="page">
            <a href="javascript:ajaxsplit(1,0)"><span>&nbsp;首页&nbsp;</span></a>
            <c:forEach var="page"  begin="1" end="${class_informations.pages}">
                <a href="javascript:ajaxsplit(${page},0)"><span>&nbsp;${page}&nbsp;</span></a>&nbsp;
            </c:forEach>
            <a href="javascript:ajaxsplit(${class_informations.pages},0)"><span>&nbsp;尾页&nbsp;</span></a>
            &nbsp;
            <span>共${class_informations.pages}页</span>
        </div>
        </c:if>
           <c:if test="${class_informations.pages==0}">
               <div style="font-size: 50px;margin-left: 330px;margin-top: 220px;">查询不到此纪录!</div>
           </c:if>
       </div>
    </div>
</div>
<Div id="add_mes" style="border: 1px solid;width: 100%;margin: auto;height:100%;position: fixed;left: 0px;top: 0px;background: rgb(0,0,0,0.5);overflow: auto;text-align: center;display: none;">
    <div style="position:absolute;left:300px;background: white;width: 500px;height: 300px;margin: auto;margin-top: 50px;border-radius: 15px;">
        <form>

            <div class="top" style="margin-bottom: 10px;">
                <span>通知标题：</span><input id="add_title" style="width: 300px;font-size: 20px;" type="text" name="title">
                <br>
            </div>
            <div class="middle">
                <span>通知正文：</span><textarea id="add_mesage" style="width: 495px;height:150px;font-size: 15px;" name="message" maxlength="200" rows="5" cols="80"></textarea>
                <br>
            </div>
            <div class="n-bottom">
                <input class="b-button" type="button" value="提交" onclick="add()"/>
                &nbsp;&nbsp;
                <button class="b-button" type="button"   onclick="add_none()">取消</button>
            </div>
        </form>
    </div>
</Div>
</body>
<style>
    #add_mes .n-bottom {
        margin-top: 20px;
    }
    #add_mes .top {
        font-size: 20px;
        margin-top: 10px;
    }
    #add_mes .middle {
        font-size: 20px;
        margin-top: 10px;
    }
    .b-button{
        background-color: #FF5722;
        border: none;
        color: white;
        font-size: 15px;
        width: 90px;
        height: 40px;
        border-radius: 9px;
    }
    table{
        width: 1000px;
        margin-top: 20px;
        margin-left:25px;
    }
    .option{
        list-style: none;
    }
    .option td{
        height: 50px;
        border-bottom: 1px dashed #e3e3e9;
    }
    .option a{
        text-decoration: none;
        font-size: 17px;
        color: black;
    }
    .option:hover{
        opacity: 0.6;
    }
    .option .title{
        min-width: 170px;
        margin-right: 10px;
    }
    .option .time{
        text-align: center;
    }
    .option .name{
        text-align: center;
    }
    .option .tool{
        text-align: center;
    }
    .option .tool a {
        color:red;
    }
    .top-1{
        margin-top: 9px;
    }
    .top-3{
        margin-left:30px ;
    }
    .top-2{
        display: inline-block;
        margin-top: 5px;
        margin-left: 20px;
    }
    #myselect{
        margin: 10px;
        border-radius: 11px;
        width: 110px;
        height: 30px;
        font-size: 17px;
    }
    *{
        margin: 0px;
    }
    .button:hover{
        opacity: 0.7;
    }
    .button {
        background-color: #FF5722;
        border: none;
        color: white;
        font-size: 15px;
        width: 90px;
        height: 40px;
        border-radius: 9px;
    }
    body{
        background-color: white;
    }

    .page{
        position: relative;
        font-size: 22px;
        margin-top: 30px;
        margin-left: 350px;
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
        color:blue;
    }
    .bottom{
        position: absolute;
    }
    .b-button:hover{
        opacity: 0.8;
    }
    hr{
        width: 1200px;
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

    function delete_byid(id) {
        if (confirm("您确定要删除吗?")) {
            $.ajax({
                url:"${pageContext.request.contextPath}/class_mes/delete.do",
                data:{"id":id},
                type:"post",
                dataType: "text",
                success: function (msg) {
                    alert(msg);
                    $.ajax({
                        url:"${pageContext.request.contextPath}/communicate/delete.do",
                        data:{"id":id},
                        type:"post",
                        dataType: "text"});
                    ajaxclass();
                }
            });
        }
    }
    function add() {
            $.ajax({
                url:"${pageContext.request.contextPath}/class_mes/add.do",
                data:{"title":$("#add_title").val(),"message":$("#add_message").val()},
                type:"post",
                dataType: "text",
                success: function () {
                    add_none();
                    ajaxclass();
                }
            });
    }

    function ajaxsplit(now,x) {
        var name = $("#name").val();
        var title = $("#title").val();
        var date = $("#date").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/class_mes/get_byid_cpl.do",
            data:{"name":name,"title":title,"date":date,"classid":$("#myselect").val(),"now":now,"x":x},
            type:"post",
            success:function(){
                $("#check").load("${pageContext.request.contextPath}/view/teacher/class_information.jsp #check");
            }
        });

    }

    function ajaxclass(){
        $.ajax({
            url:"${pageContext.request.contextPath}/class_mes/get_byid.do",
            data:{"classid":$("#myselect").val()},
            type:"post",
            success:function(){
                $("#check").load("${pageContext.request.contextPath}/view/teacher/class_information.jsp #check");
            }
        });
    }
    function condition() {
        //取出查询条件
        var name = $("#name").val();
        var title = $("#title").val();
        var date = $("#date").val();
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/class_mes/mutiply.do",
            data:{"name":name,"title":title,"date":date,"classid":$("#myselect").val()},
            success:function () {
                //刷新显示数据的容器
                $("#check").load("${pageContext.request.contextPath}/view/teacher/class_information.jsp #check");
            }
        });
    }
    window.onload=function (){
        $.ajax({
            url:"${pageContext.request.contextPath}/teacher_class/get_byid.do",
            data:{"teacherid":${res.id}},
            type:"post",
            success:function(){
                $("#myse").load("${pageContext.request.contextPath}/view/teacher/class_information.jsp #myse");

                ajaxclass();
            }
        });
        ajaxclass();
    }
    function add_block(){
        document.getElementById("add_mes").style.display="block";
    }
    function add_none(){
        document.getElementById("add_mes").style.display="none";
        ajaxclass();
    }

</script>
</html>

