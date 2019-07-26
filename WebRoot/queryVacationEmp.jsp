<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>

<html>
<head>
	<script type="text/javascript">
	function onVerifyClick(vacx101, vacx107){
		$.ajax({
			type:"post",
			url:"<%=path%>/empVacation/queryVacationInfoEmp.htm",
			data:{'acx101':vacx101,'acx107':vacx107},
			success:function(data){
				var obj = eval("("+ data +")");
				var obj2 = obj.ins;
				layer.open({
					type:2,
					shade:0.8, //���ֲ�͸����
					area:['650px','400px'], //��������
					title:'����������',
					content:['<%=path%>/empVacation/FindByIdVacationEmp.html?acx101=' + vacx101 + "&acx107=" + vacx107,'no'],
					btn:['���', '�޸�', 'ȡ��'],
					yes:function(index, layero){
						$.ajax({
							type:"post",
							url:"<%=path%>/empVacation/verifyVacationEmp.htm",
							data:{'acx101':vacx101,'aak101':'1'},
							success:function(data){
								var obj = eval("("+ data +")");
								var obj2 = obj.msg;
								if(obj2 == '1'){
									layer.closeAll();
									layer.alert("���ٳɹ�������",{icon:1},function(index){
										location.reload();
									});
								}
								else{
									layer.alert("����ʧ�ܣ�����",{icon:5});
								}
							},
							error:function(){
								layer.alert('����ʧ�ܣ�����',{icon:5});
							}
						});
					},
					btn2:function(index, layero){
						layer.close(index);
						  //ȡ��ҳ���form
						  var newsFrom = layer.getChildFrame('#myform', index);
					      //ajax�ύ
					      var params = newsFrom.serialize(); // http request parameters. 
						  params = encodeURI(params);
					      $.ajax({
					    	  type: "POST",
								dataType: "json",
								url: "<%=path%>/empVacation/modifyVacationEmp.htm",
								data : params,
								success : function(result) {
									layer.alert('����ɹ���', {
										icon : 1
									}, function() {
										location.reload();
									});
								},
								error : function() {
									layer.alert("����ʧ�ܣ�", {
										icon : 5
									});
								}
					      });
					}
				});
			}
		});
	}
	function onModifyClick(vacx101, vacx107){
		layer.open({
			  type: 2, //Layer�ṩ��5�ֲ����͡��ɴ����ֵ�У�0����Ϣ��Ĭ�ϣ�1��ҳ��㣩2��iframe�㣩3�����ز㣩4��tips�㣩,
			  shade:0.8, //���ֲ�͸����
			  area:['650px','500px'], //��������
			  title:'�޸��������',
			  content:['<%=path%>/empVacation/FindByIdVacationEmp.html?acx101=' + vacx101,'no'],
			  btn:['�޸�', '����'],
			  yes:function(index, layero){
				  layer.close(index);
				  //ȡ��ҳ���form
				  var newsFrom = layer.getChildFrame('#myform', index);
			      //ajax�ύ
			      var params = newsFrom.serialize(); // http request parameters. 
				  params = encodeURI(params);
			      $.ajax({
			    	  type: "POST",
						dataType: "json",
						url: "<%=path%>/empVacation/modifyVacationEmp.htm",
						data : params,
						success : function(result) {
							layer.alert('����ɹ���', {
								icon : 1
							}, function() {
								location.reload();
							});
						},
						error : function() {
							layer.alert("����ʧ�ܣ�", {
								icon : 5
							});
						}
			      });
			  }
		});
	}
	</script>

	<c:choose>
		<c:when test="${rows == null && msg == null  }">
			<jsp:forward page="${path }/queryVacationEmp.html"></jsp:forward>
		</c:when>
	</c:choose>
</head>
	<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="t_title">
        <fieldset class="layui-elem-field layui-field-title">
                <legend>Ա����ٹ���</legend>
        </fieldset>
    </div>
	<form action="<%=path %>/empVacation/queryVacationEmp.html" method="post" class="layui-form">
		<table lay-skin="row" align="center">
			<tr>
				<td>����ʱ�䷶Χ</td>
				<td><e:select value="����:1,����:2,����:3" name="qaai106" header="true"/></td>
				<td><e:date name="qbacx103"/></td>
				<td><e:date name="qeacx103"/></td>
				<td>Ա��</td>
				<td><e:text name="qaaj103"/></td>
				<td>״̬</td>
				<td><e:select value="δ����:1,������:2" name="qacx107" header="true"/></td>
				<td align="justify"><input type="reset" name="next" value="���" class="layui-btn layui-btn-primary"/></td>
				<td align="justify"><input type="submit" name="next" value="��ѯ" class="layui-btn"/></td>
			</tr>
		</table>
	</form>
		<table class="layui-table" lay-skin="row" align="center" width="60%" id="table">
		<thead>
			<tr>
				<th>ͳ��</th>
				<th>Ա��</th>
				<th>״̬</th>
				<th>��������</th>
				<th>��������</th>
				<th>����</th>
				<th>˵��</th>
				<th></th>
			</tr>
		</thead>
			<c:choose>
					<c:when test="${rows != null }">
						<c:forEach items="${rows }" var="ins" varStatus="vs">
						<tr>
							<td>${vs.count }</td>
							<td>${ins.aaj103 }</td>
							<td>
							<c:choose>
								<c:when test="${ins.acx107 == '1' }">
									<font color="red">${ins.cnacx107 }</font>
								</c:when>
								<c:otherwise>
									${ins.cnacx107 }
								</c:otherwise>
							</c:choose>						
							</td>
							<td>${ins.acx103 }</td>
							<td>${ins.acx105 }</td>
							<td>${ins.datediff }</td>
							<td>${ins.acx102 }</td>
							<td>
							<c:choose>
								<c:when test="${ins.acx107 == '1' }">
									<a href="#" onclick="onVerifyClick('${ins.acx101}','${ins.acx107 }')" >����[�鿴]</a>
								</c:when>
								<c:otherwise>
									<a href="#" onclick="onModifyClick('${ins.acx101}','${ins.acx107 }')">�鿴</a>
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
							<td></td>
							<td></td>
						</tr>
						</c:forEach>
					</c:otherwise>
			</c:choose>
		</table>
	</body>
</html>