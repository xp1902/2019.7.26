<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
	<title>欢迎注册</title>
	
   <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
   <script src="js/layer-v3.1.1/layer/layer.js"></script>
   <link rel="stylesheet" href="layui/css/layui.css">
   <script src="layui/layui.js"></script>
   <script src="layui/uselayui.js"></script>
</head>
<body>
	<form action="userRegister.html" method="post">
	<ul class="layui-nav" style="height:44px;">
	</ul>
${msg }
		<table class="layui-table" style="width:25%;margin:30px auto;">
			<caption>
			欢迎注册
            <hr width="160">
            </caption>
			<tr>
				<td>用户名：</td>
				<td><input type="text" name="aau102"/>
			</tr>
			<tr>
				<td>密码：</td>
				<td><input type="password" name="aau103"/></td>
			</tr>
			<tr>
				<td>请选择身份</td>
				<td>
				<input type="radio" name="aau104" value="3"/>家属
				<input type="radio" name="aau104" value="4"/>志愿者
				</td>
			</tr>
			<tr>
				<td colspan=2 align="center">
				  <input type="submit" value="确认注册" class="layui-btn"/>
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>