<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<script>
	function toUpdate(vaab101){
		var myform = document.getElementById("myform");
		myform.action="<%=path%>/updateTheOld2.html?aab101=" + vaab101;
		myform.submit();
	}
	
	var count=0;
	function onSelect(vstate)
	{
		  vstate?count++:count--;
		  var vdel=document.getElementById("del");
		  vdel.disabled=(count==0);
	}      
	function onReject(vaab101){
  		var vform = document.getElementById("myform");
	  	vform.action = "<%=path%>/modifyAppointment2.html?aab101="+vaab101;
	  	vform.submit();
    }
	function onSubmit(vaab101){
		window.open("<%=path%>/updateTheOld2.html?aab101=" + vaab101);
	}
</script>
<c:choose>
	<c:when test="${columns == null && msg == null }">
		<jsp:forward page="${path }/queryAppointment.html"></jsp:forward>
	</c:when>
</c:choose>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="t_title">
        <fieldset class="layui-elem-field layui-field-title">
            <blockquote class="layui-elem-quote">
                <legend>预约管理</legend>
            </blockquote>
        </fieldset>
    </div>
	<form id="myform" action="<%=path%>/queryAppointment.html" method="post"
		class="layui-form">
		<table align="center" border="1" width="95%" class="layui-table">
			<tr>
				<td>姓名</td>
				<td><e:text name="qaab103" /></td>
				<td>审核</td>
				<td><e:select value="未审核:1,审核未通过:3" name="qaac104" defval="1"/></td>
				<td>联系电话</td>
				<td><e:text name="qaab110" /></td>
				<td>申请日期[B]</td>
				<td><e:date name="baac103" /></td>
				<td><input type="submit" name="next" value="清除" class="layui-btn" id="del"/></td>
			</tr>
			<tr>
				<td>性别</td>
				<td><e:radio name="qaab104" value="男:1,女:2,不确定:3,不限定:''"
						defval="" /></td>
				<td>亲属</td>
				<td><e:text name="qaad102" /></td>
				<td>护理级别</td>
				<td><e:select name="qaab114"
						value="自理:1,介助一级:2,介助二级:3,介助三级:4,介护一级:5,介护二级:6,介护三级:7"
						header="true"/></td>
				<td>申请日期[E]</td>
				<td><e:date name="eaac103" /></td>
				<td><input type="submit" name="next" value="搜索"
					class="layui-btn" /></td>
			</tr>
		</table>
	
	<table class="layui-table">
		<thead>
			<tr>
				<th></th>
				<th>序号</th>
				<th>编号</th>
				<th>姓名</th>
				<th>状态</th>
				<th>性别</th>
				<th>护理级别</th>
				<th>联系电话</th>
				<th>出生日期</th>
				<th>申请日期</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		
		<c:choose>
			<c:when test="${columns!=null }">
				<c:forEach items="${columns }" var="ins" varStatus="vs">
					<tr>
						<td>
						<input type="checkbox" name="idlist" value="${ins.aab101 }"
				             onclick="onSelect(this.checked)" >
						</td>
						<td>${vs.count }</td>
						<td>${ins.aab102 }</td>
						<td>${ins.aab103 }</td>
						<td>${ins.cnaac104 }</td>
						<td>${ins.cnaab104 }</td>
						<td>${ins.cnaab114 }</td>
						<td>${ins.aab110 }</td>
						<td>${ins.aab108 }</td>
						<td>${ins.aac102 }</td>
						<td><a href="#" onclick="toUpdate(${ins.aab101})">转入住</a></td>
						<td><a href="#" onclick="onReject('${ins.aab101}')">不通过</a></td>
					</tr>
				</c:forEach>
				<c:forEach begin='${fn:length(columns) + 1 }' end='10' step='1'>
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
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	
	</table>
	</form>
</body>
</html>