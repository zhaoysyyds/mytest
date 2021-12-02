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
					<div style="height: 60px"><a href="${pageContext.request.contextPath}/view/login.jsp" style="color: white;right: 10px;position: absolute;top: 17px;">注销</a></div>
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
							<p style="text-align: center;">&nbsp;家长：${res.name}&nbsp;&nbsp;</p>
						</div>
					</div>
					<div id="lbottom">
						<ul>
							<a href="${pageContext.request.contextPath}/view/native/class_information.jsp" target="myright" >
								<li onclick="changebgcolor(id)" id="l1" class="one"><span class="glyphicon glyphicon-book" style="color: white;"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班级通知&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-play" style="color: white;"></span> </li>
							</a>
							<a href="${pageContext.request.contextPath}/view/native/class_manager.jsp" target="myright">
								<li onclick="changebgcolor(id)" id="l2" class="one"><span class="glyphicon glyphicon-user" style="color: white;"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;加入班级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-play" style="color: white;"></span> </li>
							</a>
							<a href="${pageContext.request.contextPath}/system/teacher_systeminformation.do" target="myright">
								<li onclick="changebgcolor(id)" id="l3" class="one"><span class="glyphicon glyphicon-user" style="color: white;"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系统通知&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-play" style="color: white;"></span> </li>
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
<Style>
	.one:hover{
		opacity: 0.8;
	}
	#top2 a:hover{
		opacity: 0.7;
	}
</Style>
<script>
	window.onload=function () {
		var iframe=document.getElementById("show");
		if(iframe.getAttribute("first")==null)
			iframe.src="${pageContext.request.contextPath}/view/native/class_manager.jsp";

	}
	function changebgcolor(id) {
		$(".one").css("background-color", "#465260");
		$("#" + id).css("background-color", "#363F4A");
	}
</script>