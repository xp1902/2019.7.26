<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
	<script type="text/javascript">
		function onModifyClick(vaai101){
			layer.open({
				  type: 2, //Layer�ṩ��5�ֲ����͡��ɴ����ֵ�У�0����Ϣ��Ĭ�ϣ�1��ҳ��㣩2��iframe�㣩3�����ز㣩4��tips�㣩,
				  shade:0.8, //���ֲ�͸����
				  area:['400px','550px'], //��������
				  title:'��ס����Ϣ',
				  content: ['<%=path%>/FindByIdBed.html?aai101=' + vaai101,'no'],
				  btn:['�޸Ļ���', '����'],
				  yes:function(index, layero){
					  updateBedClick(vaai101);
				  }
			});
		}
		function updateBedClick(vaai101){
			  window.open("<%=path%>/queryEmp.html?aai101=" + vaai101);
		}
		function onQueryInfo(vaai101){
			$.ajax({
				type:"POST",
				url:"<%=path%>/bed/queryInfo.htm",
				data:{'aai101':vaai101},
				success:function(data){
					var obj = eval("("+data+")");
					var obj2 = obj.ins;
					layer.open({
						title:"��λ��Ϣ",
						content: "����:" + obj2.aab103 + "<br>" +
						"�Ա�:"+ obj2.cnaab104 + "<br>" +
						"����:"+ obj2.cnaab107 + "<br>" +
						"�ɷ�:"+ obj2.cnaab109 + "<br><br>" +
						"�������:"+ obj2.aaj102 + "<br>" +
						"��������:"+ obj2.aaj103,
					    btn: ['ȷ��', 'ȡ��'],
					    yes: function(index, layero) {
					    	layer.close(index);
					    	//ȷ�ϻص�
					    },
					    btn2: function(index, layero) {
					    	//ȡ���ص�
					    }
					    ,
					    cancel: function() {
					    	//y
					    }
					});
					//confirm();
				},
				error:function(err){
                    console.log(err.status);
                    console.log('�쳣');
                  }
			});
		}
		function onChangeInfo(vaab101, vaai101){
			layer.open({
				content:"��ȷ������ס�˰��ŵ��˴�λ��",
				btn:['ȷ��', 'ȡ��'],
				yes:function(index, layero){
					$.ajax({
						type:"post",
						url:"<%=path%>/ModifyInfo.htm",
						data:{'aab101':vaab101,'aai101':vaai101},
						success:function(data){
							var obj = eval("("+ data +")");
							var obj2 = obj.msg;
							if(obj2 == '1'){
								layer.alert("��λ�Ѿ��ɹ��޸ģ�����", {icon:1},function(index){
									location.reload();
								});
							}
							else{
								layer.alert("��λ�޸�ʧ�ܣ�����", {icon:5});
							}
						},
						error:function(){
							layer.alert("��λ�޸�ʧ�ܣ�����", {icon:5})
						}
					});
				},
				btn2:function(index, layero){
					
				}
			});
		}		
		
		function onQueryBed(vaai102){
			var myform = document.getElementById("myform");
			myform.action="<%=path%>/queryBed.html?aab101="+ "${param.aab101}" + "&aai102=" + vaai102;
			myform.submit();
		}
		
	</script>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="t_title">
        <fieldset class="layui-elem-field layui-field-title">
                <legend>��λ����</legend>
        </fieldset>
    </div>
	<c:choose>
		<c:when test="${rows == null && msg == null  }">
			<jsp:forward page="${path }/queryBed.html"></jsp:forward>
		</c:when>
	</c:choose>
<form action="<%=path %>/queryBed.html?aab101=${param.aab101}" method="post" id="myform" class="layui-form">
	<table class="layui-table" lay-skin="row" align="center" style="width:50%;margin:30px auto;">
		<tr>
			<td>״̬</td>
			<td><e:select value="����:1,ԤԼ:2,��ס:3,���:4" name="qaai106" header="true"/></td>
			<td>����</td>
			<td><e:text name="qaai102"/></td>
			<td>¥��</td>
			<td><e:text name="qaai103"/></td>
			<td>����</td>
			<td><e:text name="qaai104"/></td>
			<td>��λ</td>
			<td><e:text name="qaai105"/></td>
			<td>��ס��</td>
			<td><e:text name="qaab103"/></td>
			<td><input type="submit" name="next" class="layui-btn"></input></td>
		</tr>
	</table>
	
	<div class="layui-container">
	<div class="layui-row">
	<div class="layui-col-md2">
	<table class="layui-table" lay-skin="row" style="width:100%;margin:30px auto;">
		<thead>
		<tr><th>¥��</th></tr>
		</thead>
		<c:choose>
			<c:when test="${rows != null }">
				<c:forEach items="${rows }" var="ins" varStatus="vs">
					<tr>
						<td><a href="#" id="qaai102" onclick="onQueryBed('${ins.aai102}')">��${ins.aai102 }��</a></td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	</div>
	
	<div class="layui-col-md10">
	<table class="layui-table" lay-skin="row" style="width:100%;margin:30px auto;">
	<thead>
		<tr>
			<th>���</th>
			<th>����</th>
			<th>¥��</th>
			<th>����</th>
			<th>��λ</th>
			<th>״̬</th>
			<th>����</th>
		</tr>
	</thead>
		<c:choose>
			<c:when test="${columns == null }">
				<c:forEach begin='1' end='10' step='1'>
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
			<c:otherwise>
				<c:forEach items="${columns }" var="ins" varStatus="vs">
					<tr>
						<td>${vs.count }</td>
						<td>${ins.aai102 }��</td>
						<td>${ins.aai103 }��</td>
						<td>${ins.aai104 }��</td>
						<td>${ins.aai105 }��</td>
						<td>
								<c:if test="${ins.aai106 == '1'}">
								<c:choose>
									<c:when test="${!empty param.aab101 and ins.aaj101 != null }">
										<a class="layui-btn layui-btn-danger layui-btn-xs" onclick="onChangeInfo('${param.aab101}','${ins.aai101 }')">����</a>
									</c:when>
									<c:otherwise>
										<a class="layui-btn layui-btn-primary layui-btn-xs" >����</a>
									</c:otherwise>
								</c:choose>
								</c:if>
								<c:if test="${ins.aai106 == '2'}">
									<a class="layui-btn layui-btn-primary layui-btn-xs"  href="#" onclick="onModifyClick('${ins.aai101}')">ԤԼ</a>
								</c:if><c:if test="${ins.aai106 == '3'}">
									<a class="layui-btn layui-btn-xs" onclick="onModifyClick('${ins.aai101}')">��ס</a>
								</c:if><c:if test="${ins.aai106 == '4'}">
									<a class="layui-btn layui-btn-xs"  onclick="onModifyClick('${ins.aai101}')">���</a>
								</c:if>
						</td>
						<td>
							<c:if test="${ins.aaj101 != null}">
								<a class="layui-btn layui-btn-xs"  href="#" onclick="updateBedClick('${ins.aai101}')">�������</a>
							</c:if>
							<c:if test="${ins.aaj101 == null}">
								<a class="layui-btn layui-btn-danger layui-btn-xs"  href="#" onclick="updateBedClick('${ins.aai101}')">���令��</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
				<c:forEach begin="${fn:length(columns) + 1 }" end = '5' step='1'>
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
			</c:otherwise>
		</c:choose>
	</table>
	</div>
	</div>
	</div>
	<input type="hidden" name="next" id="aab101" value='${param.aab101 }'/>
</form>
</body>
</html>
