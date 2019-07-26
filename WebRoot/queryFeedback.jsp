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
<script type="text/javascript">
	function onVerifyClick(vaat101){
		$.ajax({
			type:"post",
			url:"<%=path%>/verifyFeedback.htm",
			data : {
				'aat101' : vaat101,
				'aak101' : '1'
			},
			success : function(data) {
				var obj = eval("(" + data + ")");
				var obj2 = obj.msg;
				if (obj2 == '1') {
					layer.alert("处理成功！！！", {
						icon : 1
					}, function(index) {
						location.reload();
					});
				} else {
					layer.alert("网络错误，处理失败！！！", {
						icon : 5
					});
				}
			},
			error : function() {
				layer.alert('网络错误，处理失败！！！', {
					icon : 5
				});
			}
		});
	}
</script>
<c:choose>
	<c:when test="${rows == null && msg == null  }">
		<jsp:forward page="${path }/queryFeedback.html"></jsp:forward>
	</c:when>
</c:choose>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="t_title">
        <fieldset class="layui-elem-field layui-field-title">
                <legend>反馈管理</legend>
        </fieldset>
    </div>
	<form action="<%=path%>/queryFeedback.html" method="post"
		class="layui-form">
		<div class="layui-form-item" align="center">
			<div class="layui-inline">
				<label class="layui-form-label">时间</label>
				<div class="layui-input-block">
					<e:select value="本月:1,上月:2,下月:3" name="qaai106" header="true" />
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">申请时间[B]</label>
				<div class="layui-input-block">
					<input type="text" name="qbaat102" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">姓名</label>
				<div class="layui-input-block">
					<input type="text" name="qaat103" id="qaat103" value=""
						class="layui-input" placeholder="请输入姓名">
				</div>
			</div>
			<div class="layui-inline">
				<input type="reset" name="next" value="清除" class="layui-btn layui-btn-primary" />
			</div>
		</div>
		
		<div class="layui-form-item" align="center">
			<div class="layui-inline">
				<label class="layui-form-label">状态</label>
				<div class="layui-input-block">
					<e:select value="未处理:1,已处理:2" name="qaat106" header="true" />
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">申请时间[E]</label>
				<div class="layui-input-block">
					<input type="text" name="qeaat102" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">电话</label>
				<div class="layui-input-block">
					<input type="text" name="qaat104" id="qaat104" value=""
						class="layui-input" placeholder="请输入电话">
				</div>
			</div>
			<div class="layui-inline">
				<input type="submit" name="next" value="查询" class="layui-btn" />
			</div>
		</div>
	</form>
	
	
	<table class="layui-table" lay-skin="row" align="center" id="table" style="width:60%;margin:30px auto;">
		<thead>
			<tr>
				<th>统计</th>
				<th>姓名</th>
				<th>反馈日期</th>
				<th>联系电话</th>
				<th>事由</th>
				<th>状态</th>
			</tr>
		</thead>
		<c:choose>
			<c:when test="${rows != null }">
				<c:forEach items="${rows }" var="ins" varStatus="vs">
					<tr>
						<td>${vs.count }</td>
						<td>${ins.aat103 }</td>
						<td>${ins.aat102 }</td>
						<td>${ins.aat104 }</td>
						<td>${ins.aat105 }</td>
						<td><c:choose>
								<c:when test="${ins.aat106 == '1' }">
									<font color="red"><a href="#"
										onclick="onVerifyClick('${ins.aat101}')">处理</a></font>
								</c:when>
								<c:otherwise>
									<font color="green">已处理</font>
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
				<c:forEach begin='${fn:length(rows) + 1 }' end='15' step='1'>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach begin='1' end='15' step='1'>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<div id="demo1" align="center"></div>
</body>
</html>