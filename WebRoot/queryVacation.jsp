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
					shade:0.8, //遮罩层透明度
					area:['600px','500px'], //弹出层宽高
					title:'审核请假申请',
					content:['<%=path%>/vacation/FindByIdVacation.html?aal101=' + vaal101 + "&aal107=" + vaal107,'no'],
					btn:['审核', '修改', '取消'],
					yes: function(index, layero) {
						onChangeInfo(vaal101);
				    },
				    btn2: function(index, layero) {
				    	//修改
				    	layer.close(index);
				    	var newsFrom = layer.getChildFrame('#myform', index);
					      //ajax提交
					      var params = newsFrom.serialize(); // http request parameters. 
						  params = encodeURI(params);
					      $.ajax({
								type: "POST",
								dataType: "json",
								url: "<%=path%>/vacation/modifyVacationTheOld.htm",
								data: params,
								success: function(result) {
									layer.alert('保存成功！',{icon:1}, function(){
										location.reload();
									});
								},
								error: function() {
									layer.alert("保存失败！",{icon:5});
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
                console.log('异常');
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
					//可能有问题，要不穿个index过来？
					layer.closeAll();
					layer.alert("审核成功请假信息已经成功修改！！！",{icon:1},function(index){
						location.reload();		
					});
				}
				else{
					layer.alert("该用户的请假审核床位修改失败！！！",{icon:5});
				}
			},
			error:function(){
				layer.alert('该用户的请假审核失败！！！',{icon:5});
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
					content:"编号:" + obj2.aab102 + "<br>" + 
					"姓名:" + obj2.aab103 + "<br>" +
					"房间:" + obj2.aai104 + "<br>"+
					"原因:" + obj2.aal102 + "<br>"+
					"报假日期:" + obj2.aal103 + "<br>"+
					"销假日期:" + obj2.aal104 + "<br>"+
					"<br>"+
					"审核状态:" + obj2.cnaal107 + "<br>"+
					"操作人:" + obj2.aak103 + "<br>"+
					"操作日期:" + obj2.aal108
				});
			}
		});
	}
	function onModifyClick(vaal101, vaal107){
		layer.open({
			  type: 2, //Layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）,
			  shade:0.8, //遮罩层透明度
			  area:['600px','550px'], //弹出层宽高
			  title:'修改请假申请',
			  content: ['<%=path%>/vacation/FindByIdVacation.html?aal101=' + vaal101,'no'],
			  btn:['修改', '返回'],
			  yes:function(index, layero){
				  layer.close(index);
				  //取子页面的form
				  var newsFrom = layer.getChildFrame('#myform', index);
			      //ajax提交
			      var params = newsFrom.serialize(); // http request parameters. 
				  params = encodeURI(params);
			      $.ajax({
						type: "POST",
						dataType: "json",
						url: "<%=path%>/vacation/modifyVacationTheOld.htm",
					data : params,
					success : function(result) {
						layer.alert('保存成功！', {
							icon : 1
						}, function() {
							location.reload();
						});
					},
					error : function() {
						layer.alert("保存失败！", {
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
                <legend>入住人请假管理</legend>
        </fieldset>
    </div>
	<form action="<%=path%>/vacation/queryVacation.html" method="post"
		class="layui-form">
		<table class="layui-table" lay-skin="row" align="center" width="60%">
			<tr>
				<td>时间</td>
				<td><e:select value="本月:1,上月:2,下月:3" name="qaai106"
						header="true" /></td>
				<td><e:date name="qbaal103" /></td>
				<td><e:date name="qeaal103" /></td>
				<td>老人</td>
				<td><e:text name="qaab103" /></td>
				<td>状态</td>
				<td><e:select value="未审核:1,请假:2,已销假:3,已结算:4" name="qaal107"
						header="true" /></td>
				<td align="justify"><input type="reset" name="next" value="清除" class="layui-btn layui-btn-primary"/></td>
				<td align="justify"><input type="submit" name="next" value="查询" class="layui-btn"/></td>
			</tr>
		</table>
	</form>
	<table class="layui-table" lay-skin="row" align="center" width="60%" id="table">
	<thead>
		<tr>
			<th>统计</th>
			<th>老人</th>
			<th>状态</th>
			<th>大厦</th>
			<th>房间</th>
			<th>报假日期</th>
			<th>销假日期</th>
			<th>天数</th>
			<th>说明</th>
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
						<td>${ins.aai102 }栋</td>
						<td>${ins.aai104 }</td>
						<td>${ins.aal103 }</td>
						<td>${ins.aal104 }</td>
						<td>${ins.datediff }</td>
						<td>${ins.aal102 }</td>
						<td><c:choose>
								<c:when test="${ins.aal107 == '1' }">
									<a href="#"
										onclick="onVerifyClick('${ins.aal101}', '${ins.aal107 }')">审核[修改]</a>
								</c:when>
								<c:otherwise>
									<a href="#"
										onclick="onModifyClick('${ins.aal101}', '${ins.aal107 }')">查看[修改]</a>
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