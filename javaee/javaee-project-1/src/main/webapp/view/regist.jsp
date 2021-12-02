<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/regist.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
</head>
<body>
<div id="regist">
    <div id="top">
        <img src="../images/cloud.jpg"/><span>REGIST</span>
    </div>
    <div id="bottom">
        <form  action="${pageContext.request.contextPath}/users/regist.do" method="post">
            <table border="0px" id="table">
                <tr>
                    <td class="td1">用户名：</td>
                    <td><input type="text" value="" placeholder="Username" class="td2" name="user"></td>
                </tr>
                <tr class="td4">
                    <td></td>
                    <td><span id="usererr"></span></td>
                </tr>
                <tr>
                    <td class="td1">密码：</td>
                    <td><input type="password"  value="" placeholder="Password" class="td2" name="password"></td>
                </tr>
                <tr class="td4">
                    <td></td>
                    <td><span id="pwderr"></span></td>
                </tr>
                <tr>
                    <td class="td1">姓名：</td>
                    <td><input type="text" class="td2" placeholder="name"  name="name"></td>
                </tr>
                <tr class="td4">
                    <td></td>
                    <td><span id="nameerr"></span></td>
                </tr>
                <tr>
                    <td class="td1">手机号码：</td>
                    <td><input type="text" class="td2"  name="telephone"></td>
                </tr>
                <tr class="td4">
                    <td></td>
                    <td><span id="phoneer"></span></td>
                </tr>

                <tr>
                    <td class="td1">性别：</td>
                    <td class="td5" style="padding-top: 6px;">
                        &nbsp&nbsp&nbsp
                        <input type="radio" name="sex" id="sex1" value="1" checked><label for="sex1">男</label>
                        &nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp
                        <input type="radio" name="sex" id="sex2" value="0"><label for="sex2">女</label>
                    </td>
                </tr>
                <tr class="td4">
                    <td></td>
                    <td><span id="sexer"></span></td>
                </tr>

                <tr>
                    <td class="td1">电子邮箱：</td>
                    <td><input type="email" class="td2"  name="email"></td>
                </tr>
                <tr class="td4">
                    <td></td>
                    <td><span id="emailer"></span></td>
                </tr>
                <tr>
                    <td class="td1">类别：</td>
                    <td class="td5" style="padding-top: 6px;">
                        &nbsp&nbsp&nbsp
                        <input type="radio" name="type" id="type2" value="2" checked><label for="type2">老师</label>
                        &nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp
                        <input type="radio" name="type" id="type3" value="3"><label for="type3">家长</label>
                    </td>
                </tr>
                <tr class="td4">
                    <td></td>
                    <td><span id="typeerr"></span></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input class="button" type="submit" value="注册" >
                        &nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp
                        <a href="${pageContext.request.contextPath}/view/login.jsp"><input class="button" type="button" value="返回" ></a>
                    </td>
                </tr>
            </table>
        </form>
    </div>

</div>
</body>
<style>
    .button{
        background-color: #FF5722;
        border: none;
        color: white;
        font-size: 15px;
        width: 90px;
        height: 40px;
        border-radius: 9px;
    }
    .button:hover{

        opacity: 0.8;
    }
    label{
        font-size: 18px;
    }
</style>
<script>
    window.onload=function(){
    var msg="${requestScope.msg}";
    if(msg!="") alert(msg);
    }
</script>
</html>
