<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
	<style type="text/css">
	tr{
		height:25px;
	}
	</style><script type="text/javascript">
	function onReturnClick(vaab101){
		var myform = document.getElementById("myform"); 
		myform.action="<%=path%>/updateTheOld.html?aab101=" + vaab101;
		myform.submit();
	}
	function onReturnClick2(vaab101){
		var myform = document.getElementById("myform"); 
		myform.action="<%=path%>/updateTheOld2.html?aab101=" + vaab101;
		myform.submit();
	}
	</script>
</head>
	<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="t_title">
        <fieldset class="layui-elem-field layui-field-title">
                <legend>家属管理</legend>
        </fieldset>
    </div>
	<form id="myform" method="post">
		<table align="center" width="100%" class="layui-table" lay-skin="row" style="width:60%;margin:30px auto;">
			<thead>
			<tr>
				<th>编号</th>
				<th>姓名</th>
				<th>身份证号</th>
				<th>联系电话</th>
				<th>关系</th>
				<th>紧急电话</th>
				<th>家庭住址</th>
			</tr>
			</thead>
				<c:choose>
					<c:when test="${rows != null }">
						<c:forEach items="${rows }" var="ins" varStatus="vs">
						<tr>
							<td>${vs.count }</td>
							<td>${ins.aad102 }</td>
							<td>${ins.aad103 }</td>
							<td>${ins.aad104 }</td>
							<td>${ins.aad105 }</td>
							<td>${ins.aad106 }</td>
							<td>${ins.aad107 }</td>
						</tr>
						</c:forEach>
						<c:forEach begin='${fn:length(rows) + 1 }' end='5' step='1'>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						</c:forEach>
					</c:when>
				</c:choose>
		</table>
		<table align="center" width="100%" class="layui-table" lay-skin="row" style="width:60%;margin:30px auto;">
			<tr>
			<c:if test="${!empty param.fkel }">
				<td align="center"><button name="next" onclick="onReturnClick2('${param.aab101}')" class="layui-btn">返回</button></td>
			</c:if>
			<c:if test="${empty param.fkel }">
				<td align="center"><button name="next" onclick="onReturnClick('${param.aab101}')" class="layui-btn">返回</button></td>
			</c:if>
			</tr>
		</table>
		</form>
	</body>
</html>