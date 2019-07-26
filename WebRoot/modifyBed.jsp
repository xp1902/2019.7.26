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
<link rel="stylesheet" href="layui/css/layui.css">
<script src="layui/layui.js"></script>
<script src="layui/uselayui.js"></script>
<script src="js/layer-v3.1.1/layer/layer.js"></script>
</head>
<body>
	<form id="myform" method="post"
		action="<%=path%>/modifyBed.html" class="layui-form">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">入住人编号</label>
				<div class="layui-input-block">
					<input type="text" name="aab102" id="aab102" value="${ins.aab102 }"
						class="layui-input" readonly="readonly" style="width:240px;"/>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">入住人姓名</label>
				<div class="layui-input-block">
					<input type="text" name="aab103" id="aab103" value="${ins.aab103 }"
						class="layui-input" readonly="readonly" style="width:240px;"/>
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<input type="text" name="cnaab104" id="cnaab104" value="${ins.cnaab104}" class="layui-input" readonly="readonly"style="width:240px;"/>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">民族</label>
				<div class="layui-input-block">
					<input type="text" name="cnaab107"
						value="${ins.cnaab107 }" readonly="readonly" class="layui-input" style="width:240px;">
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">成分</label>
				<div class="layui-input-block">
					<input type="text" name="cnaab109"
						value="${ins.cnaab109 }" readonly="readonly" class="layui-input" style="width:240px;">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">电话</label>
				<div class="layui-input-block">
					<input type="text" name="aab110"
						value="${ins.aab110 }" readonly="readonly" class="layui-input" style="width:240px;">
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">护工编号</label>
				<div class="layui-input-block">
					<input type="text" name="aaj102" id="aaj102" value="${ins.aaj102 }" class="layui-input" style="width:240px;"/>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">护工姓名</label>
				<div class="layui-input-block">
					<input type="text" name="aaj103" id="aaj103" value="${ins.aaj103 }" class="layui-input" style="width:240px;"/>
				</div>
			</div>
		</div>
		<input type="hidden" name="aai101" value="${ins.aai101 }"/>
	</form>
</body>
</html>