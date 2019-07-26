<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<style type="text/css">
tr {
	height: 25px;
}
</style>

</head>
<body>
	<form id="myform" method="post"
		action="<%=path%>/modifyVacationTheOld.html" class="layui-form">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">入住人编号</label>
				<div class="layui-input-block">
					<input type="text" name="aab102" id="aab102" value="${ins.aab102 }"
						class="layui-input" readonly="readonly" />
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">入住人姓名</label>
				<div class="layui-input-block">
					<input type="text" name="aab103" id="aab103" value="${ins.aab103 }"
						class="layui-input" readonly="readonly" />
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">入住人房间</label>
			<div class="layui-input-block">
				<input type="text" name="aai104" id="aai104" value="${ins.aai104 }"
					class="layui-input" readonly="readonly" />
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">原因</label>
			<div class="layui-input-block">
				<textarea name="aal102" id="aal102" class="layui-textarea">${ins.aal102}</textarea>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">报假日期</label>
				<div class="layui-input-block">
					<input type="text" name="aal103" id="date" lay-verify="date"
						value="${ins.aal103 }" readonly="readonly" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">销假日期</label>
				<div class="layui-input-block">
					<input type="text" name="aal104" id="date" lay-verify="date"
						value="${ins.aal104 }" readonly="readonly" class="layui-input">
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">陪同人</label>
				<div class="layui-input-block">
					<input type="text" name="aal105" id="aal105" value="${ins.aal105 }" class="layui-input"/>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">陪同人电话</label>
				<div class="layui-input-block">
					<input type="text" name="aal106" id="aal106" value="${ins.aal106 }" class="layui-input"/>
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">审核状态</label>
			<div class="layui-input-block">
				<e:select value="未审核:1,请假:2,已销假:3,已结算:4" name="aal107"
					readonly="true" defval="${ins.aal107 }" />
			</div>
		</div>

		<c:if test="${ins.aak103 != null }">

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
					<input type="text" name="aal108" id="date" lay-verify="date"
						value="${ins.aal108 }" readonly="readonly" class="layui-input">
				</div>
			</div>
		</div>
		
		</c:if>
		
		<input type="hidden" name="aal101" value="${ins.aal101 }"/>
	</form>
</body>
</html>