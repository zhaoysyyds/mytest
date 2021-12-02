<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
</head>

<body>
<div id="login">
    <div id="top">
        <img src="../images/cloud.jpg"/><span>LOGIN</span>
    </div>
    <div id="bottom">
        <form  action="${pageContext.request.contextPath}/users/identifyuser.do" method="post">
            <table border="0px" id="table">
                <tr>
                    <td class="td1">用户名：</td>
                    <td><input type="text" value="" placeholder="Username" class="td2" name="user"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><span id="nameerr"></span></td>
                </tr>
                <tr>
                    <td class="td1">密码：</td>
                    <td><input type="password"  value="" placeholder="Password" class="td2" name="password"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><span id="pwderr"></span></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="登录" class="td3">
                        &nbsp&nbsp&nbsp
                        <a href="${pageContext.request.contextPath}/view/regist.jsp"><input type="button" value="注册" class="td3"></a>
                    </td>
                </tr>
            </table>
        </form>
    </div>

</div>
</body>

<script>
    window.onload=function(){
    var err="${requestScope.err}";
    if(err!="") alert(err);
    }
</script>
</html>