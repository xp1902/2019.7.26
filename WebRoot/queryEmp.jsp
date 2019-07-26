<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<script type="text/javascript">

	function onChangeInfo(vaaj101, vaai101){
		layer.open({
			content:"��ȷ������ס�˷�����û�����",
			btn:['ȷ��', 'ȡ��'],
			yes:function(index, layero){
				$.ajax({
					type:"post",
					url:"<%=path%>/ModifyInfo2.htm",
					data:{'aaj101':vaaj101,'aai101':vaai101},
					success:function(data){
						var obj = eval("("+ data +")");
						var obj2 = obj.msg;
						if(obj2 == '1'){
							layer.alert("�����ɹ��޸ģ�����", {icon:1},function(index){
								opener.location.reload();
								window.close();
							});
						}
						else{
							layer.alert("�����޸�ʧ�ܣ�����", {icon:5});
						}
					},
					error:function(){
						layer.alert("�����޸�ʧ�ܣ�����", {icon:5})
					}
				});
			},
			btn2:function(index, layero){
				
			}
		});
	}
</script>
<script type="text/javascript">
		var count=0;
		function onSelect(vstate)
		{
			  vstate?count++:count--;
			  var vdel=document.getElementById("del");
			  vdel.disabled=(count==0);
		}
	   function onEdit(vaaj101)
	   {
		   var vform = document.getElementById("myform");
	    	 vform.action="<%=path%>/findbyidNurse.html?aaj101="+vaaj101;
	    	 //alert(vform.action);
	    	 vform.submit();
	   } 
	   function onDel(vaaj101){
		   var vform = document.getElementById("myform");
		   vform.action = "<%=path%>/delByIdEmp.html?aaj101=" + vaaj101;
		   vform.submit();
    	}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="t_title">
        <fieldset class="layui-elem-field layui-field-title">
                <legend>Ա������</legend>
        </fieldset>
    </div>
	<form id="myform" action="<%=path%>/queryEmp.html" method="post"
		class="layui-form">
		<table class="layui-table" lay-skin="row" align="center">
			<tr>
				<td>�������</td>
				<td><e:text name="qaaj102" /></td>
				<td>����</td>
				<td><e:text name="qaaj103" /></td>
				<td>�Ա�</td>
				<td><e:radio name="qaaj104" value="��:1,Ů:2,��ȷ��:3,���޶�:''" defval="" /></td>
			</tr>
			<tr>
				<td>��������</td>
				<td><e:select name="qaaj109" value="�ͼ�:1,�м�:2,�߼�:3"
						header="true" /></td>
				<td>����[B]</td>
				<td><e:date name="baaj105" /></td>
				<td>����[E]</td>
				<td><e:date name="eaaj105" /></td>
			</tr>
			<tr>
				<td>��ϵ�绰</td>
				<td><e:text name="qaaj108" /></td>
				<td>���֤��</td>
				<td><e:text name="qaaj106" /></td>
				<td><input type="submit" name="next" value="��ѯ"
					class="layui-btn"></td>
				<td><input type="submit" name="next" value="���"
					formaction="<%=path%>/addEmp.jsp" class="layui-btn">
				</td>
			</tr>
		</table>
	</form>
	<table class="layui-table" lay-skin="row" width="75%" align="center">
		<tr>
			<td></td>
			<td>���</td>
			<td>���</td>
			<td>����</td>
			<td>����</td>
			<td>�Ա�</td>
			<td>����</td>
			<td>�ֻ�����</td>
			<td></td>
		</tr>
		<c:choose>
			<c:when test="${rows!=null }">
				<c:forEach items="${rows }" var="ins" varStatus="vs">
					<tr>
						<td>${vs.count }</td>
						<td>${ins.aaj102 }</td>
						<td><a href="#" onclick="onEdit('${ins.aaj101}')">${ins.aaj103 }</a>
						</td>
						<td>${ins.aaj105 }</td>
						<td>${ins.cnaaj104 }</td>
						<td>${ins.cnaaj109 }</td>
						<td>${ins.aaj108 }</td>
						<td>
						<c:choose>
							<c:when test="${empty param.aai101 }">
								<a href="#" onclick="onDel('${ins.aaj101}')">ɾ��</a>
							</c:when>
							<c:otherwise>
								<a href="#" onclick="onChangeInfo('${ins.aaj101}','${param.aai101 }')">����</a>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
				</c:forEach>
				<!-- ������� -->
				<c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
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
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach begin="1" step="1" end="15">
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
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>