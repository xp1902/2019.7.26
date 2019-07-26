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
	function onVerifyClick(vaal101, vaal107){
		$.ajax({
			type:"post",
			url:"<%=path%>/vacation/queryVacationInfo.htm",
			data:{'aal101':vaal101,'aal107':vaal107},
			success:function(data){
				var obj = eval("("+ data +")");
				var obj2 = obj.ins;
				layer.open({
					type:2,
					shade:0.8, //���ֲ�͸����
					area:['600px','500px'], //��������
					title:'����������',
					content:['<%=path%>/vacation/FindByIdVacation.html?aal101=' + vaal101 + "&aal107=" + vaal107,'no'],
					btn:['���', '�޸�', 'ȡ��'],
					yes: function(index, layero) {
						onChangeInfo(vaal101);
				    },
				    btn2: function(index, layero) {
				    	//�޸�
				    	layer.close(index);
				    	var newsFrom = layer.getChildFrame('#myform', index);
					      //ajax�ύ
					      var params = newsFrom.serialize(); // http request parameters. 
						  params = encodeURI(params);
					      $.ajax({
								type: "POST",
								dataType: "json",
								url: "<%=path%>/vacation/modifyVacationTheOld.htm",
								data: params,
								success: function(result) {
									layer.alert('����ɹ���',{icon:1}, function(){
										location.reload();
									});
								},
								error: function() {
									layer.alert("����ʧ�ܣ�",{icon:5});
								}
							});
				    },
				    btn3:function(index, layero){
				    	layer.close(index);
				    }
				});
			},
			error:function(error){
                console.log(err.status);
                console.log('�쳣');
			}
		});
	}
	function onChangeInfo(vaal101){
		$.ajax({
			type:"post",
			url:"<%=path%>/vacation/verifyVacation.htm",
			data:{'aal101':vaal101,'aak101':'1'},
			success:function(data){
				var obj = eval("("+ data +")");
				var obj2 = obj.msg;
				if(obj2 == '1'){
					//���������⣬Ҫ������index������
					layer.closeAll();
					layer.alert("��˳ɹ������Ϣ�Ѿ��ɹ��޸ģ�����",{icon:1},function(index){
						location.reload();		
					});
				}
				else{
					layer.alert("���û��������˴�λ�޸�ʧ�ܣ�����",{icon:5});
				}
			},
			error:function(){
				layer.alert('���û���������ʧ�ܣ�����',{icon:5});
			}
		});
	}
	function onQueryClick(vaal101){
		$.ajax({
			type:"post",
			url:"<%=path%>/vacation/queryVacationInfo.htm",
			data:{'aal101': vaal101},
			success:function(data){
				var obj = eval("("+data+")");
				var obj2 = obj.ins;
				layer.open({
					content:"���:" + obj2.aab102 + "<br>" + 
					"����:" + obj2.aab103 + "<br>" +
					"����:" + obj2.aai104 + "<br>"+
					"ԭ��:" + obj2.aal102 + "<br>"+
					"��������:" + obj2.aal103 + "<br>"+
					"��������:" + obj2.aal104 + "<br>"+
					"<br>"+
					"���״̬:" + obj2.cnaal107 + "<br>"+
					"������:" + obj2.aak103 + "<br>"+
					"��������:" + obj2.aal108
				});
			}
		});
	}
	function onModifyClick(vaal101, vaal107){
		layer.open({
			  type: 2, //Layer�ṩ��5�ֲ����͡��ɴ����ֵ�У�0����Ϣ��Ĭ�ϣ�1��ҳ��㣩2��iframe�㣩3�����ز㣩4��tips�㣩,
			  shade:0.8, //���ֲ�͸����
			  area:['600px','550px'], //��������
			  title:'�޸��������',
			  content: ['<%=path%>/vacation/FindByIdVacation.html?aal101=' + vaal101,'no'],
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
						url: "<%=path%>/vacation/modifyVacationTheOld.htm",
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
		<jsp:forward page="${path }/queryVacation.html"></jsp:forward>
	</c:when>
</c:choose>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="t_title">
        <fieldset class="layui-elem-field layui-field-title">
                <legend>��ס����ٹ���</legend>
        </fieldset>
    </div>
	<form action="<%=path%>/vacation/queryVacation.html" method="post"
		class="layui-form">
		<table class="layui-table" lay-skin="row" align="center" width="60%">
			<tr>
				<td>ʱ��</td>
				<td><e:select value="����:1,����:2,����:3" name="qaai106"
						header="true" /></td>
				<td><e:date name="qbaal103" /></td>
				<td><e:date name="qeaal103" /></td>
				<td>����</td>
				<td><e:text name="qaab103" /></td>
				<td>״̬</td>
				<td><e:select value="δ���:1,���:2,������:3,�ѽ���:4" name="qaal107"
						header="true" /></td>
				<td align="justify"><input type="reset" name="next" value="���" class="layui-btn layui-btn-primary"/></td>
				<td align="justify"><input type="submit" name="next" value="��ѯ" class="layui-btn"/></td>
			</tr>
		</table>
	</form>
	<table class="layui-table" lay-skin="row" align="center" width="60%" id="table">
	<thead>
		<tr>
			<th>ͳ��</th>
			<th>����</th>
			<th>״̬</th>
			<th>����</th>
			<th>����</th>
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
						<td>${ins.aab103 }</td>
						<td>
						<c:choose>
								<c:when test="${ins.aal107 == '1' }">
									<font color="red">${ins.cnaal107 }</font>
								</c:when>
								<c:otherwise>
									${ins.cnaal107 }
								</c:otherwise>
						</c:choose>
						</td>
						<td>${ins.aai102 }��</td>
						<td>${ins.aai104 }</td>
						<td>${ins.aal103 }</td>
						<td>${ins.aal104 }</td>
						<td>${ins.datediff }</td>
						<td>${ins.aal102 }</td>
						<td><c:choose>
								<c:when test="${ins.aal107 == '1' }">
									<a href="#"
										onclick="onVerifyClick('${ins.aal101}', '${ins.aal107 }')">���[�޸�]</a>
								</c:when>
								<c:otherwise>
									<a href="#"
										onclick="onModifyClick('${ins.aal101}', '${ins.aal107 }')">�鿴[�޸�]</a>
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
						<td></td>
						<td></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>