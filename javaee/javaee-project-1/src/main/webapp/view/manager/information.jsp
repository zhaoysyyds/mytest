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

        <div class="title" style="margin: 7px;">系统通知：</div>
        <hr>
        <div class="l-button">
            <input class="button" type="button" value="发布通知" onclick="add_block()">
        </div>
        <div class="message">
            <table>
                <thead style="background-color: #f2f2f2;">
                <tr>
                    <th>通知标题</th>
                    <th style="width: 440px">通知正文</th>
                    <th>发布时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${informations.list}" var="p">
                <tr>
                        <td>${p.title} </td>
                        <td style="width: 440px">${p.message}</td>
                         <td> ${p.date}</td>
                         <td><a href="javascript:del(${p.id})">删除</a></td>
                </tr>

                </c:forEach>
                </tbody>
            </table>

        </div>
        <div class="page">
            <a href="javascript:ajaxsplit(1,0)"><span>首页</span></a>
            <c:forEach var="page"  begin="1" end="${informations.pages}">
                <a href="javascript:ajaxsplit(${page},0)"><span>&nbsp;${page}&nbsp;</span></a>&nbsp;
            </c:forEach>
            <a href="javascript:ajaxsplit(${informations.pages},0)"><span>尾页</span></a>
            <span>共${informations.pages}页</span>
        </div>
   </div>
 </div>

 <Div id="add_mes" style="border: 1px solid;width: 100%;margin: auto;height:100%;position: fixed;left: 0px;top: 0px;background: rgb(0,0,0,0.5);overflow: auto;text-align: center;display: none;">
     <div style="position:absolute;left:300px;background: white;width: 500px;height: 300px;margin: auto;margin-top: 50px;border-radius: 15px;">
     <form method="post" action="${pageContext.request.contextPath}/system/add.do">

         <div class="top" style="margin-bottom: 10px;">
             <span>通知标题：</span><input style="width: 300px;font-size: 20px;" type="text" name="title">
             <br>
         </div>
         <div class="middle">
             <span>通知正文：</span><textarea style="width: 495px;height:150px;font-size: 15px;" name="message" maxlength="200" rows="5" cols="80"></textarea>
             <br>
         </div>
         <div class="bottom">
             <input class="b-button" type="submit" value="提交"/>
             &nbsp;&nbsp;
             <button class="b-button" type="button"   onclick="add_none()">取消</button>
         </div>
     </form>
     </div>
 </Div>
</body>
<style>
    .b-button{
        background-color: #FF5722;
        border: none;
        color: white;
        font-size: 15px;
        width: 90px;
        height: 40px;
        border-radius: 9px;
    }
    a{
        text-decoration: none;
    }
    .b-button:hover{
        opacity: 0.7;
    }
    #add_mes .top{
        margin-top: 10px;
        font-size: 20px;
    }
    #add_mes .middle{

        margin-top: 10px;
        font-size: 20px;
    }
    #add_mes .bottom{
       margin-top: 20px;
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
    table{

    }
    body{
        background-color: white;
    }
    .l-button{
        margin-bottom: 7px;
    }
    .l-button .button:hover{
        opacity: 0.7;
    }
    tr td,th{
        border-width: 1px;
        border-style: solid;
        border-color: #e6e6e6;
        text-align: center;
        width: 195px;
        height: 80px;
    }
    .message{

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
    #table{

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
    .page a span{

    }
</style>
<script type="text/javascript">

    function ajaxsplit(now,x) {
        $.ajax({
            url:"${pageContext.request.contextPath}/system/information.do",
            data:{"now":now,"x":x},
            type:"post",
            success:function(){
                $("#table").load("${pageContext.request.contextPath}/view/manager/information.jsp #table");
            }
        });

    }
    function del(id) {
        if (confirm("您确定删除吗?")) {
        $.ajax({
            url:"${pageContext.request.contextPath}/system/delete.do",
            data:{"id":id},
            type:"post",
            dataType: "text",
            success: function (msg) {
                alert(msg);
                $("#table").load("${pageContext.request.contextPath}/view/manager/information.jsp #table");
            }
        });
        }
    }
    function add_block(){
        document.getElementById("add_mes").style.display="block";
    }
    function add_none(){
        document.getElementById("add_mes").style.display="none";
        location.reload();
    }
</script>
</html>
