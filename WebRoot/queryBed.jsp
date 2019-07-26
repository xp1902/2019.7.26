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
				  type: 2, //Layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）,
				  shade:0.8, //遮罩层透明度
				  area:['400px','550px'], //弹出层宽高
				  title:'入住人信息',
				  content: ['<%=path%>/FindByIdBed.html?aai101=' + vaai101,'no'],
				  btn:['修改护工', '返回'],
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
						title:"床位信息",
						content: "姓名:" + obj2.aab103 + "<br>" +
						"性别:"+ obj2.cnaab104 + "<br>" +
						"民族:"+ obj2.cnaab107 + "<br>" +
						"成分:"+ obj2.cnaab109 + "<br><br>" +
						"护工编号:"+ obj2.aaj102 + "<br>" +
						"护工姓名:"+ obj2.aaj103,
					    btn: ['确认', '取消'],
					    yes: function(index, layero) {
					    	layer.close(index);
					    	//确认回调
					    },
					    btn2: function(index, layero) {
					    	//取消回调
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
                    console.log('异常');
                  }
			});
		}
		function onChangeInfo(vaab101, vaai101){
			layer.open({
				content:"您确定将入住人安排到此床位吗？",
				btn:['确定', '取消'],
				yes:function(index, layero){
					$.ajax({
						type:"post",
						url:"<%=path%>/ModifyInfo.htm",
						data:{'aab101':vaab101,'aai101':vaai101},
						success:function(data){
							var obj = eval("("+ data +")");
							var obj2 = obj.msg;
							if(obj2 == '1'){
								layer.alert("床位已经成功修改！！！", {icon:1},function(index){
									location.reload();
								});
							}
							else{
								layer.alert("床位修改失败！！！", {icon:5});
							}
						},
						error:function(){
							layer.alert("床位修改失败！！！", {icon:5})
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
                <legend>床位管理</legend>
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
			<td>状态</td>
			<td><e:select value="空闲:1,预约:2,在住:3,请假:4" name="qaai106" header="true"/></td>
			<td>大厦</td>
			<td><e:text name="qaai102"/></td>
			<td>楼层</td>
			<td><e:text name="qaai103"/></td>
			<td>房号</td>
			<td><e:text name="qaai104"/></td>
			<td>床位</td>
			<td><e:text name="qaai105"/></td>
			<td>入住人</td>
			<td><e:text name="qaab103"/></td>
			<td><input type="submit" name="next" class="layui-btn"></input></td>
		</tr>
	</table>
	
	<div class="layui-container">
	<div class="layui-row">
	<div class="layui-col-md2">
	<table class="layui-table" lay-skin="row" style="width:100%;margin:30px auto;">
		<thead>
		<tr><th>楼号</th></tr>
		</thead>
		<c:choose>
			<c:when test="${rows != null }">
				<c:forEach items="${rows }" var="ins" varStatus="vs">
					<tr>
						<td><a href="#" id="qaai102" onclick="onQueryBed('${ins.aai102}')">第${ins.aai102 }栋</a></td>
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
			<th>编号</th>
			<th>大厦</th>
			<th>楼层</th>
			<th>房号</th>
			<th>床位</th>
			<th>状态</th>
			<th>护工</th>
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
						<td>${ins.aai102 }栋</td>
						<td>${ins.aai103 }层</td>
						<td>${ins.aai104 }房</td>
						<td>${ins.aai105 }床</td>
						<td>
								<c:if test="${ins.aai106 == '1'}">
								<c:choose>
									<c:when test="${!empty param.aab101 and ins.aaj101 != null }">
										<a class="layui-btn layui-btn-danger layui-btn-xs" onclick="onChangeInfo('${param.aab101}','${ins.aai101 }')">分配</a>
									</c:when>
									<c:otherwise>
										<a class="layui-btn layui-btn-primary layui-btn-xs" >空闲</a>
									</c:otherwise>
								</c:choose>
								</c:if>
								<c:if test="${ins.aai106 == '2'}">
									<a class="layui-btn layui-btn-primary layui-btn-xs"  href="#" onclick="onModifyClick('${ins.aai101}')">预约</a>
								</c:if><c:if test="${ins.aai106 == '3'}">
									<a class="layui-btn layui-btn-xs" onclick="onModifyClick('${ins.aai101}')">在住</a>
								</c:if><c:if test="${ins.aai106 == '4'}">
									<a class="layui-btn layui-btn-xs"  onclick="onModifyClick('${ins.aai101}')">请假</a>
								</c:if>
						</td>
						<td>
							<c:if test="${ins.aaj101 != null}">
								<a class="layui-btn layui-btn-xs"  href="#" onclick="updateBedClick('${ins.aai101}')">变更护工</a>
							</c:if>
							<c:if test="${ins.aaj101 == null}">
								<a class="layui-btn layui-btn-danger layui-btn-xs"  href="#" onclick="updateBedClick('${ins.aai101}')">分配护工</a>
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
