<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
	<title>��ӭע��</title>
	
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
			��ӭע��
            <hr width="160">
            </caption>
			<tr>
				<td>�û�����</td>
				<td><input type="text" name="aau102"/>
			</tr>
			<tr>
				<td>���룺</td>
				<td><input type="password" name="aau103"/></td>
			</tr>
			<tr>
				<td>��ѡ�����</td>
				<td>
				<input type="radio" name="aau104" value="3"/>����
				<input type="radio" name="aau104" value="4"/>־Ը��
				</td>
			</tr>
			<tr>
				<td colspan=2 align="center">
				  <input type="submit" value="ȷ��ע��" class="layui-btn"/>
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>