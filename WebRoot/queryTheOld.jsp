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
                <legend>��ס�˹���</legend>
        </fieldset>
    </div>
	<form id="myform" action="<%=path%>/theold/queryTheOld.html" method="post" class="layui-form">
		<table align="center" border="1" width="95%" class="layui-table">
			<tr>
				<td>����</td>
				<td><e:text name="qaab103"/></td>
				<td>���</td>
				<td><e:text name="qaab102"/></td>
				<td>����Ա</td>
				<td><e:text name="qaaj103"/></td>
				<td>��ϵ�绰</td>
				<td><e:text name="qaab110"/></td>
				<td>��ס״̬</td>
				<td><e:select name="qaab111" value="��ס:2,���:3" header="true"/></td>
				<td>��Ժ����[B]</td>
				<td><e:date name="baac103"/></td>
				<td><input type="reset" name="next" value="���" class="layui-btn"/></td>
			</tr><tr>
				<td>�Ա�</td>
				<td><e:radio name="qaab104" value="��:1,Ů:2,��ȷ��:3,���޶�:''" defval=""/></td>
				<td>����</td>
				<td><e:text name="qaad102"/></td>
				<td>�����</td>
				<td><e:text name="qaai104"/></td>
				<td>������ò</td>
				<td><e:select name="qaab109" value="Ⱥ��:1,��Ա:2" header="true"/></td>
				<td>������</td>
				<td><e:select name="qaab114" value="����:1,����һ��:2,��������:3,��������:4,�黤һ��:5,�黤����:6,�������:7" header="true"/></td>
				<td>��Ժ����[E]</td>
				<td><e:date name="eaac103"/></td>
				<td><input type="submit" name="next" value="��ѯ" class="layui-btn"/></td>
			</tr>
			</table>
		</form>	
		<table class="layui-table">
		<thead>
			<tr>
				<th>���</th>
				<th>���</th>
				<th>����</th>
				<th>�Ա�</th>
				<th>������</th>
				<th>��ϵ�绰</th>
				<th>��ס״̬</th>
				<th>��ס����</th>
				<th>��������</th>
				<th>����</th>
				<th>�����</th>
				<th>��λ</th>
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
							<td><a href="#" onclick="onFindByIdClick('${ins.aab101}')">�鿴</a></td>
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