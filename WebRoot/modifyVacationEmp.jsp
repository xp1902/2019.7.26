<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
%>

<html>
<head>

<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=path %>/layui/css/layui.css">
<script src="<%=path %>/layui/layui.js"></script>
<script src="<%=path %>/layui/uselayui.js"></script>
<script src="<%=path %>/js/layer-v3.1.1/layer/layer.js"></script>
</head>
<body>
	<br>
	<form id="myform" method="post"
		action="<%=path%>/modifyVacationEmp.html" class="layui-form">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">员工编号</label>
				<div class="layui-input-block">
					<input type="text" name="aaj102" id="aaj102" value="${ins.aaj102 }"
						class="layui-input" readonly="readonly" />
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">员工姓名</label>
				<div class="layui-input-block">
					<input type="text" name="aaj103" id="aaj103" value="${ins.aaj103 }"
						class="layui-input" readonly="readonly" />
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">原因</label>
			<div class="layui-input-block">
				<textarea name="acx102" id="acx102" class="layui-textarea" style="width:500px;">${ins.acx102}</textarea>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">报假日期</label>
				<div class="layui-input-block">
					<input type="text" name="acx103" id="date" lay-verify="date"
						value="${ins.acx103 }" readonly="readonly" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">应归还日期</label>
				<div class="layui-input-block">
					<input type="text" name="acx104" id="date" lay-verify="date"
						value="${ins.acx104 }" readonly="readonly" class="layui-input">
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">审核状态</label>
			<div class="layui-input-block" style="width:500px;">
				<e:select value="未销假:1,已销假:2" name="acx107"
					readonly="true" defval="${ins.acx107 }" />
			</div>
		</div>

		<c:if test="${ins.aak103 != null }">

		<div class="layui-form-item">
			<label class="layui-form-label">销假日期</label>
			<div class="layui-input-block">
				<input type="text" name="acx105" id="date" lay-verify="date"
						value="${ins.acx105 }" readonly="readonly" class="layui-input"  style="width:500px;">
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">操作人</label>
				<div class="layui-input-block">
					<input type="text" name="aak103" id="aak103" value="${ins.aak103 }" class="layui-input" readonly="readonly" />
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">操作日期</label>
				<div class="layui-input-block">
					<input type="text" name="acx106" id="date" lay-verify="date"
						value="${ins.acx106 }" readonly="readonly" class="layui-input">
				</div>
			</div>
		</div>
		
		</c:if>
		
		<input type="hidden" name="acx101" value="${ins.acx101 }"/>
	</form>
</body>
</html>