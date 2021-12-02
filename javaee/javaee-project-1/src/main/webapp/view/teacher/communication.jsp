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
        <div class="title" style="font-size: 30px;margin:7px;">站内交流：</div>
        <hr>
        <div class="top-return">
            <button class="b-button" type="button">
            <a class="return" href="${pageContext.request.contextPath}/view/teacher/class_information.jsp">返回</a>
            </button>
        </div>


    </div>
    <div class="bottom" style="margin-left: 25px;">
        <div class="inform">
           <div class="title"> ${information.title} </div>
            <div class="date">发布时间：${information.date}</div>
            <div class="name">发布人：${information.name}教师</div>
           <div class="message">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${information.message}</div>
        </div>

        <hr>
        <div style="position: relative;margin-top: 10px;">
            <form method="post" action="${pageContext.request.contextPath}/communicate/add.do">
                <textarea name="message"></textarea>
               <div> <input style="margin: 12px;" class="b-button" type="submit"   value="提交"></div>
            </form>
        </div>
        <div class="top-3">
            <form style="font-size: 17px;">
                用户名称：<input style="width: 100px;" id="name" type="text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="width: 20px;height:20px;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                站内信息：<input style="width: 200px;" id="message" type="text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="width: 20px;height:20px;">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                起始日期：<input id="date" type="date">&nbsp;&nbsp<span style="width: 20px;height:20px;">&nbsp;&nbsp;&nbsp;&nbsp;</span>

                <button type="button" class="b-button" onclick="condition();">查询</button>
            </form>
        </div>
        <div id="check">
        <div >
            <ul>
                <c:forEach items="${comm_informations.list}" var="p">
                <li class="c-communicate">
                    <div class="c-name">
                        <c:if test="${p.type==2}">${p.name}老师</c:if>
                        <c:if test="${p.type==3}">${p.kidname}家长</c:if>
                    </div>
                    <div class="c-title">${p.message}</div>
                    <div class="c-date">${p.date}</div>
                </li>
                 <hr style="width: 940px;">
                </c:forEach>
            </ul>
        </div>
        <div class="page">
            <a href="javascript:ajaxsplit(1,0)"><Span>&nbsp;首页&nbsp;</Span></a>
            <c:forEach var="page"  begin="1" end="${comm_informations.pages}">
                <a href="javascript:ajaxsplit(${page},0)"><span>&nbsp;${page}&nbsp;</span></a>&nbsp;
            </c:forEach>
            <a href="javascript:ajaxsplit(${comm_informations.pages},0)"><span>&nbsp;尾页&nbsp;</span></a>
            &nbsp;
            <span>共${comm_informations.pages}页</span>
        </div>
        </div>
        </div>
    </div>
</div>
</body>
<Style>
    .c-name{
        margin-bottom: 25px;
        font-size: 18px;
        font-weight: 600;
    }
    .c-title{
        margin-bottom: 20px;
        font-size: 16px;
    }
    .c-date{
        font-size: 14px;
        color:silver;
    }
    .c-communicate{
        list-style: none;
        margin-top: 20px;
        width:940px;
        padding-bottom: 17px;
    }
    textarea:focus {
        outline: none !important;
        border: solid 4px powderblue;
        box-shadow: 0 0 10px #719ECE;

        resize: none;
    }
    textarea{
        width: 990px;
        height: 200px;
        margin: 10px;
        border: solid 4px powderblue;
        border-radius: 6px;
        resize: none;
        font-size: 18px;
    }
    .inform{
        position: relative;
        margin: 9px;
        width: 900px;
        margin-bottom: 20px;
    }
    .inform .title{
        text-align: center;
        font-size: 23px;
        font-weight: 700;
    }
    .inform .date{
        color: silver;
    }
    .inform .message{
        margin-top: 10px;
    }
    .inform .name{

        color: silver;
    }
    .top-3{
        margin-left:45px;
        margin-top: 20px;
    }
    .top-return{
        margin-top: 14px;
        margin-left: 20px;
        margin-bottom: 13px;
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
    .b-button:hover{
         opacity: 0.7;
     }
    .return{
       text-decoration: none;
       color:white;
    }
    body{
        background-color: white;
    }
    *{
        margin: 0px;
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
    .page{
        position: relative;
        font-size: 22px;
        margin-top: 40px;
        margin-left: 350px;
        margin-bottom: 40px;
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
</Style>
<script type="text/javascript">

    condition=function () {
        //取出查询条件
        var name = $("#name").val();
        var message = $("#message").val();
        var date = $("#date").val();
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/communicate/mutiply.do",
            data:{"name":name,"message":message,"date":date,"ciid":${information.id}},
            success:function () {
                //刷新显示数据的容器
                $("#check").load("${pageContext.request.contextPath}/view/teacher/communication.jsp #check");
            }
        });
    }
    function ajaxsplit(now,x) {
        var name = $("#name").val();
        var message = $("#message").val();
        var date = $("#date").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/communicate/get_byciid_cpl.do",
            data:{"name":name,"message":message,"date":date,"now":now,"x":x,"ciid":${information.id}},
            type:"post",
            success:function(){
                $("#check").load("${pageContext.request.contextPath}/view/teacher/communication.jsp #check");
            }
        });
    }


</script>
</html>
