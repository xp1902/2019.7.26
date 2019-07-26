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
	function onVerifyClick(vaam101){
		$.ajax({
			type:"post",
			url:"<%=path%>/visit/verifyVisit.htm",
			data : {
				'aam101' : vaam101,
				'aak101' : '1'
			},
			success : function(data) {
				var obj = eval("(" + data + ")");
				var obj2 = obj.msg;
				if (obj2 == '1') {
					layer.alert("����ɹ�������", {
						icon : 1
					}, function(index) {
						location.reload();
					});
				} else {
					layer.alert("������󣬴���ʧ�ܣ�����", {
						icon : 5
					});
				}
			},
			error : function() {
				layer.alert('������󣬴���ʧ�ܣ�����', {
					icon : 5
				});
			}
		});
	}
</script>

<c:choose>
	<c:when test="${rows == null && msg == null  }">
		<jsp:forward page="${path }/queryVisit.html?aak101=${ins.aak101 }"></jsp:forward>
	</c:when>
</c:choose>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="t_title">
        <fieldset class="layui-elem-field layui-field-title">
                <legend>�ÿ͹���</legend>
        </fieldset>
    </div>
	<form action="<%=path%>/queryVisit.html" method="post"
		class="layui-form">
		<div class="layui-form-item" align="center">
			<div class="layui-inline">
				<label class="layui-form-label">ʱ��</label>
				<div class="layui-input-block">
					<e:select value="����:1,����:2" name="briage" header="true" />
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">ʱ��[B]</label>
				<div class="layui-input-block">
					<input type="text" name="qbaam104" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">����</label>
				<div class="layui-input-block">
					<input type="text" name="qaam102" id="qaam102" value=""
						class="layui-input" placeholder="����������">
				</div>
			</div>
			<div class="layui-inline">
				<input type="reset" name="next" value="���" class="layui-btn layui-btn-primary" />
			</div>
		</div>
		
		<div class="layui-form-item" align="center">
			
			<div class="layui-inline">
				<label class="layui-form-label">״̬</label>
				<div class="layui-input-block">
					<e:select value="δ����:1,�Ѵ���:2" name="qaam106" header="true" />
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">ʱ��[E]</label>
				<div class="layui-input-block">
					<input type="text" name="qeaam104" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">�绰</label>
				<div class="layui-input-block">
					<input type="text" name="qaam103" id="qaam103" value=""
						class="layui-input" placeholder="������绰">
				</div>
			</div>
			<div class="layui-inline">
				<input type="submit" name="next" value="��ѯ" class="layui-btn" />
			</div>
		</div>
		
		<div class="layui-form-item">
				<table class="layui-table" lay-skin="row" align="center" id="table" style="width:70%;margin:30px auto;">
		<thead>
			<tr>
				<th>ͳ��</th>
				<th>����</th>
				<th>����</th>
				<th>��ϵ�绰</th>
				<th>��ע</th>
				<th>״̬</th>
			</tr>
		</thead>
		<c:choose>
			<c:when test="${rows != null }">
				<c:forEach items="${rows }" var="ins" varStatus="vs">
					<tr>
						<td>${vs.count }</td>
						<td>${ins.aam102 }</td>
						<td>${ins.aam104 }</td>
						<td>${ins.aam103 }</td>
						<td>${ins.aam105 }</td>
						<td>
						<c:choose>
								<c:when test="${ins.aam106 == '1' }">
									<font color="red"><a href="#" onclick="onVerifyClick('${ins.aam101}')">����</a></font>
								</c:when>
								<c:otherwise>
									<font color="green">�Ѵ���</font>
								</c:otherwise>
						</c:choose>
						</td>
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
		</div>
		<e:text name="aak101" value="${ins.aak101 }"/>
	</form>

</body>
</html>