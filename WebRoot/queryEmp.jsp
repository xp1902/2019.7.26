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
			content:"您确定将入住人分配给该护工吗？",
			btn:['确定', '取消'],
			yes:function(index, layero){
				$.ajax({
					type:"post",
					url:"<%=path%>/ModifyInfo2.htm",
					data:{'aaj101':vaaj101,'aai101':vaai101},
					success:function(data){
						var obj = eval("("+ data +")");
						var obj2 = obj.msg;
						if(obj2 == '1'){
							layer.alert("护工成功修改！！！", {icon:1},function(index){
								opener.location.reload();
								window.close();
							});
						}
						else{
							layer.alert("护工修改失败！！！", {icon:5});
						}
					},
					error:function(){
						layer.alert("护工修改失败！！！", {icon:5})
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
                <legend>员工管理</legend>
        </fieldset>
    </div>
	<form id="myform" action="<%=path%>/queryEmp.html" method="post"
		class="layui-form">
		<table class="layui-table" lay-skin="row" align="center">
			<tr>
				<td>护工编号</td>
				<td><e:text name="qaaj102" /></td>
				<td>姓名</td>
				<td><e:text name="qaaj103" /></td>
				<td>性别</td>
				<td><e:radio name="qaaj104" value="男:1,女:2,不确定:3,不限定:''" defval="" /></td>
			</tr>
			<tr>
				<td>护工级别</td>
				<td><e:select name="qaaj109" value="低级:1,中级:2,高级:3"
						header="true" /></td>
				<td>生日[B]</td>
				<td><e:date name="baaj105" /></td>
				<td>生日[E]</td>
				<td><e:date name="eaaj105" /></td>
			</tr>
			<tr>
				<td>联系电话</td>
				<td><e:text name="qaaj108" /></td>
				<td>身份证号</td>
				<td><e:text name="qaaj106" /></td>
				<td><input type="submit" name="next" value="查询"
					class="layui-btn"></td>
				<td><input type="submit" name="next" value="添加"
					formaction="<%=path%>/addEmp.jsp" class="layui-btn">
				</td>
			</tr>
		</table>
	</form>
	<table class="layui-table" lay-skin="row" width="75%" align="center">
		<tr>
			<td></td>
			<td>序号</td>
			<td>编号</td>
			<td>姓名</td>
			<td>生日</td>
			<td>性别</td>
			<td>级别</td>
			<td>手机号码</td>
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
								<a href="#" onclick="onDel('${ins.aaj101}')">删除</a>
							</c:when>
							<c:otherwise>
								<a href="#" onclick="onChangeInfo('${ins.aaj101}','${param.aai101 }')">分配</a>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
				</c:forEach>
				<!-- 补充空行 -->
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