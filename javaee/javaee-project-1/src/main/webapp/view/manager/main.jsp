<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.javaee.domain.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
		<title></title>
		<style type="text/css">
		
		</style>
	</head>

	<body>
		<!--整体部分-->
		<div id="all">
			<!--上部分-->
			<div id="top">
				<div id="top1">
					<span>家校通系统</span>
				</div>
				<div id="top2">
					<div style="height: 60px"><a href="${pageContext.request.contextPath}/view/login.jsp" style="right: 10px;position: absolute;top: 17px;color: white">注销</a></div>
				</div>
			</div>
			<!--下部分-->
			<div id="bottom">
				<!--下部分左边-->
				<div id="bleft">
					<div id="ltop">
						<div id="lts">
							<img style="vertical-align: middle;" src="${pageContext.request.contextPath}/images/cloud.jpg"/>
							&nbsp;&nbsp;
							<br/>
							<p style="text-align: center;">&nbsp;管理员：${res.name}&nbsp;&nbsp;</p>
						</div>
					</div>
					<div id="lbottom">
						<ul>
							<a href="${pageContext.request.contextPath}/users/checkteachers.do" target="myright" >
								<li onclick="changebgcolor(id)" id="l1" class="one">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;教师信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </li>
							</a>
							<a href="${pageContext.request.contextPath}/class/getclasses.do" target="myright">
								<li onclick="changebgcolor(id)" id="l2" class="one">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班级信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </li>
							</a>
							<a href="${pageContext.request.contextPath}/system/informations.do" target="myright">
								<li onclick="changebgcolor(id)" id="l3" class="one">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系统通知&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </li>
							</a>
						</ul>
					</div>
				</div>
				<!--下部分右边-->
				<div id="bright">
					<iframe id="show" frameborder="0" scrolling="yes" name="myright" width="1235px" height="700px" ></iframe>
				</div>
			</div>
		</div>
	</body>

</html>
<style>
	.one:hover{
		opacity: 0.8;
	}
</style>
<script>
	window.onload=function (){
	var iframe=document.getElementById("show");
	if(iframe.getAttribute("first")==null)
		iframe.src="${pageContext.request.contextPath}/users/checkteachers.do";
	}
	function changebgcolor(id){
        $(".one").css("background-color","#465260");
        $("#"+id).css("background-color","#363F4A");
	}
</script>