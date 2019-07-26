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
		action="<%=path%>/modifyBed.html" class="layui-form">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">库存项编号</label>
				<div class="layui-input-block">
					<input type="text" name="code" id="code" value="${ins.code }"
						class="layui-input" readonly="readonly" />
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">库存项名称</label>
				<div class="layui-input-block">
					<input type="text" name="name" id="name" value="${ins.name }"
						class="layui-input"/>
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">数量</label>
				<div class="layui-input-block">
					<input type="text" name="aap102" id="aap102" value="${ins.aap102}" class="layui-input" readonly="readonly"/>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">单位</label>
				<div class="layui-input-block">
					<input type="text" name="aap104" id="aap104" value="${ins.aap104}" class="layui-input" readonly="readonly"/>
				</div>
			</div>
		</div>


		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">单价</label>
				<div class="layui-input-block">
					<input type="text" name="aap105" id="aap105" value="${ins.aap105}" class="layui-input" readonly="readonly"/>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">备注</label>
				<div class="layui-input-block">
					<input type="text" name="aap103" id="aap103" value="${ins.aap103}" class="layui-input"/>
				</div>
			</div>
		</div>
		
		<input type="hidden" name="aap101" value="${ins.aap101 }"/>
	</form>
</body>
</html>