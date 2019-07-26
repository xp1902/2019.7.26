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
					shade:0.8, //遮罩层透明度
					area:['650px','400px'], //弹出层宽高
					title:'审核请假申请',
					content:['<%=path%>/empVacation/FindByIdVacationEmp.html?acx101=' + vacx101 + "&acx107=" + vacx107,'no'],
					btn:['审核', '修改', '取消'],
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
									layer.alert("销假成功！！！",{icon:1},function(index){
										location.reload();
									});
								}
								else{
									layer.alert("销假失败！！！",{icon:5});
								}
							},
							error:function(){
								layer.alert('销假失败！！！',{icon:5});
							}
						});
					},
					btn2:function(index, layero){
						layer.close(index);
						  //取子页面的form
						  var newsFrom = layer.getChildFrame('#myform', index);
					      //ajax提交
					      var params = newsFrom.serialize(); // http request parameters. 
						  params = encodeURI(params);
					      $.ajax({
					    	  type: "POST",
								dataType: "json",
								url: "<%=path%>/empVacation/modifyVacationEmp.htm",
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
		});
	}
	function onModifyClick(vacx101, vacx107){
		layer.open({
			  type: 2, //Layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）,
			  shade:0.8, //遮罩层透明度
			  area:['650px','500px'], //弹出层宽高
			  title:'修改请假申请',
			  content:['<%=path%>/empVacation/FindByIdVacationEmp.html?acx101=' + vacx101,'no'],
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
						url: "<%=path%>/empVacation/modifyVacationEmp.htm",
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
			<jsp:forward page="${path }/queryVacationEmp.html"></jsp:forward>
		</c:when>
	</c:choose>
</head>
	<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="t_title">
        <fieldset class="layui-elem-field layui-field-title">
                <legend>员工请假管理</legend>
        </fieldset>
    </div>
	<form action="<%=path %>/empVacation/queryVacationEmp.html" method="post" class="layui-form">
		<table lay-skin="row" align="center">
			<tr>
				<td>报假时间范围</td>
				<td><e:select value="本月:1,上月:2,下月:3" name="qaai106" header="true"/></td>
				<td><e:date name="qbacx103"/></td>
				<td><e:date name="qeacx103"/></td>
				<td>员工</td>
				<td><e:text name="qaaj103"/></td>
				<td>状态</td>
				<td><e:select value="未销假:1,已销假:2" name="qacx107" header="true"/></td>
				<td align="justify"><input type="reset" name="next" value="清除" class="layui-btn layui-btn-primary"/></td>
				<td align="justify"><input type="submit" name="next" value="查询" class="layui-btn"/></td>
			</tr>
		</table>
	</form>
		<table class="layui-table" lay-skin="row" align="center" width="60%" id="table">
		<thead>
			<tr>
				<th>统计</th>
				<th>员工</th>
				<th>状态</th>
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
									<a href="#" onclick="onVerifyClick('${ins.acx101}','${ins.acx107 }')" >销假[查看]</a>
								</c:when>
								<c:otherwise>
									<a href="#" onclick="onModifyClick('${ins.acx101}','${ins.acx107 }')">查看</a>
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