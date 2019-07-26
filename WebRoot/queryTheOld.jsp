<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
	<style type="text/css">
	tr{
		height:25px;
	}
	</style><script type="text/javascript">

	function onFindByIdClick(vaab101){
		var myform = document.getElementById("myform");
		myform.action="<%=path%>/theold/updateTheOld.html?aab101="+vaab101;
		myform.submit();
	}
	</script>
	
	<c:choose>
	<c:when test="${rows == null && msg == null }">
		<jsp:forward page="${path }/queryTheOld.html"></jsp:forward>
	</c:when>
	</c:choose>
</head>
	<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="t_title">
        <fieldset class="layui-elem-field layui-field-title">
                <legend>入住人管理</legend>
        </fieldset>
    </div>
	<form id="myform" action="<%=path%>/theold/queryTheOld.html" method="post" class="layui-form">
		<table align="center" border="1" width="95%" class="layui-table">
			<tr>
				<td>姓名</td>
				<td><e:text name="qaab103"/></td>
				<td>编号</td>
				<td><e:text name="qaab102"/></td>
				<td>护理员</td>
				<td><e:text name="qaaj103"/></td>
				<td>联系电话</td>
				<td><e:text name="qaab110"/></td>
				<td>入住状态</td>
				<td><e:select name="qaab111" value="在住:2,请假:3" header="true"/></td>
				<td>入院日期[B]</td>
				<td><e:date name="baac103"/></td>
				<td><input type="reset" name="next" value="清除" class="layui-btn"/></td>
			</tr><tr>
				<td>性别</td>
				<td><e:radio name="qaab104" value="男:1,女:2,不确定:3,不限定:''" defval=""/></td>
				<td>亲属</td>
				<td><e:text name="qaad102"/></td>
				<td>房间号</td>
				<td><e:text name="qaai104"/></td>
				<td>政治面貌</td>
				<td><e:select name="qaab109" value="群众:1,党员:2" header="true"/></td>
				<td>护理级别</td>
				<td><e:select name="qaab114" value="自理:1,介助一级:2,介助二级:3,介助三级:4,介护一级:5,介护二级:6,介乎三级:7" header="true"/></td>
				<td>入院日期[E]</td>
				<td><e:date name="eaac103"/></td>
				<td><input type="submit" name="next" value="查询" class="layui-btn"/></td>
			</tr>
			</table>
		</form>	
		<table class="layui-table">
		<thead>
			<tr>
				<th>序号</th>
				<th>编号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>护理级别</th>
				<th>联系电话</th>
				<th>入住状态</th>
				<th>入住日期</th>
				<th>出生日期</th>
				<th>大厦</th>
				<th>房间号</th>
				<th>床位</th>
				<th></th>
			</tr>
		</thead>
				<c:choose>
					<c:when test="${rows!=null }">
						<c:forEach items="${rows }" var="ins" varStatus="vs">
						<tr>
							<td>${vs.count }</td>
							<td>${ins.aab102 }</td>
							<td>${ins.aab103 }</td>
							<td>${ins.cnaab104 }</td>
							<td>${ins.cnaab114 }</td>
							<td>${ins.aab110 }</td>
							<td>${ins.cnaab111 }</td>
							<td>${ins.aac103 }</td>
							<td>${ins.aab108 }</td>
							<td>${ins.aai102 }</td>
							<td>${ins.aai104 }</td>
							<td>${ins.aai105 }</td>
							<td><a href="#" onclick="onFindByIdClick('${ins.aab101}')">查看</a></td>
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