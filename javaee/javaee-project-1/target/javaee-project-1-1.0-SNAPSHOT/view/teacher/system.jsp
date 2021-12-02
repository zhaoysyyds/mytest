<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href=${pageContext.request.contextPath}/css/information.css" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<body>
<div id="table" style="overflow-y:scroll">

    <div class="bottom" >

        <div style="font-size: 30px;margin: 7px;">系统通知：</div>
        <hr>
        <div>

            <ul>
                <c:forEach items="${informations.list}" var="p">
                    <li class="options">
                        <div style="text-align:center;font-size: 25px;font-weight: 600;">${p.title}</div>
                        <div class="time"><span>发布时间：</span>${p.date}</div>
                        <div class="message">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${p.message}</div>
                    </li>
                    <br>
                </c:forEach>
            </ul>
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
</body>
<style>
    .message{
        font-size: 17px;
    }
    .time{
        color: silver;
    }
    .options{
        background-color: aliceblue;
        list-style: none;
        margin-top: 10px;
        margin-right: 20px;
        width: 980px;
        min-height: 100px;
    }
    .bottom{
        position: absolute;
    }
    body{
        background-color: white;
    }
    *{
        margin: 0px;
        border: 0px;
    }
    .page{
        text-align: center;
        position: relative;
        font-size: 22px;
        margin-top: 20px;
        margin-bottom: 50px;
    }
    .page a:hover{
        opacity: 0.7;
    }
    .page a{
        margin-left: 20px;
        background-color: lightslategrey;
        COLOR: white;
        text-decoration: none;
        border-radius: 6px;
    }
    tr td,th{
        border-width: 1px;
        border-style: solid;
        border-color: #e6e6e6;
        text-align: center;
        width: 200px;
        height: 80px;
    }
    hr {
        display: block;
        padding: 0;
        border: 0;
        height: 0;
        border-top: 1px solid #eee;
        -webkit-box-sizing: content-box;
        box-sizing: content-box;
    }
    a{
        text-decoration: none;
    }
    #table{

    }
</style>
<script type="text/javascript">

    function ajaxsplit(now,x) {
        $.ajax({
            url:"${pageContext.request.contextPath}/system/ajaxsplit_tea_sysinfor.do",
            data:{"now":now,"x":x},
            type:"post",
            success:function(){
                $("#table").load("${pageContext.request.contextPath}/view/teacher/system.jsp #table");
            }
        });

    }
</script>
</html>
