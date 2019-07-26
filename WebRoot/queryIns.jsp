<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript">
	function onQueryClick(vaaq101){
		layer.open({
    		type:2,
    		shade:0.8,
    		area:['650px','400px'], //��������
			title:'��ⵥ��Ϣ',
			content: ['<%=path%>/ins/FindByIdIns.html?aaq101=' + vaaq101,'no'],
			btn:['����'],
			yes:function(index, layero){
				layer.close(index);
		    	<%-- var newsFrom = layer.getChildFrame('#myform', index);
			      //ajax�ύ
			      var params = newsFrom.serialize(); // http request parameters. 
				  params = encodeURI(params);
			      $.ajax({
						type: "POST",
						dataType: "json",
						url: "<%=path%>/ins/addIn.htm",
						data: params,
						success: function(result) {
							layer.msg('����ɹ���');
							location.reload();
						},
						error: function() {
							layer.msg("����ʧ�ܣ�");
						}
					}); --%>
			}
    	});
	}	
</script>
	
<c:choose>
	<c:when test="${rows == null && msg == null  }">
		<jsp:forward page="${path }/queryIns.html"></jsp:forward>
	</c:when>
</c:choose>
</head>
<body>
	<div class="t_title">
        <fieldset class="layui-elem-field layui-field-title">
                <legend>������</legend>
        </fieldset>
    </div>
	<form action="<%=path%>/ins/queryIns.html" method="post"
		class="layui-form">
		<div class="layui-form-item" align="center">
			<div class="layui-inline">
				<label class="layui-form-label">����ʱ��[B]</label>
				<div class="layui-input-block">
					<input type="text" name="baaq103" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">��ⵥ��</label>
				<div class="layui-input-block">
					<input type="text" name="aaq102" id="aaq103" value=""
						class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<input type="reset" name="next" value="���" class="layui-btn layui-btn-primary" />
			</div>
		</div>
		
		<div class="layui-form-item" align="center">
			<div class="layui-inline">
				<label class="layui-form-label">����ʱ��[E]</label>
				<div class="layui-input-block">
					<input type="text" name="eaaq103" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">������</label>
				<div class="layui-input-block">
					<input type="text" name="aak103" id="aak103" value=""
						class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<input type="submit" name="next" value="��ѯ" class="layui-btn" />
			</div>
		</div>
	</form>
	
	
	<table class="layui-table" lay-skin="row" align="center" id="table" style="width:60%;margin:30px auto;">
		<thead>
			<tr>
				<th>ͳ��</th>
				<th>���ݱ��</th>
				<th>�������</th>
				<th>����Ա</th>
				<th>��Ʒ����</th>
				<th>����</th>
				<th>��ע</th>
				<th>����</th>
			</tr>
		</thead>
		<c:choose>
			<c:when test="${rows != null }">
				<c:forEach items="${rows }" var="ins" varStatus="vs">
					<tr>
						<td>${vs.count }</td>
						<td>${ins.aaq102 }</td>
						<td>${ins.aaq103 }</td>
						<td>${ins.aak103 }</td>
						<td>${ins.name }</td>
						<td>${ins.aaq104 }</td>
						<td>${ins.aaq105 }</td>
						<td><a href="#" onclick="onQueryClick('${ins.aaq101}')">�鿴</a></td>
					</tr>
				</c:forEach>
				<c:forEach begin='${fn:length(rows) + 1 }' end='10' step='1'>
					<tr>
						<td></td>
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
			<c:otherwise>
				<c:forEach begin='1' end='10' step='1'>
					<tr>
						<td></td>
						<td></td>
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