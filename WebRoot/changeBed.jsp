<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
	</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
	<form id="myform" method="post" action="">
		<table align="center" class="layui-table" lay-skin="row" width="25%">
			<caption>��ס�˴�λ��Ϣ��<hr width="160"></caption>
			<tr>
				<td>��ס������</td>
				<td><e:text name="aab103"/></td>
			</tr>		
			<tr>
				<td>�Ա�</td>
				<td><e:text name="aabl104"/></td>
			</tr>			
			<tr>
				<td>����</td>
				<td><e:select value="��:1,Ů:2,��ȷ��:3" name="aal107"/></td>
			</tr>
			<tr>
				<td>�ɷ�</td>
				<td><e:select value="Ⱥ��:1,��Ա:2" name="aab109"/></td>
			</tr>
			<tr>
				<td>�������</td>
				<td><e:date name="aaj102"/></td>
			</tr>
			<tr>
				<td>��������</td>
				<td><e:date name="aaj103"/></td>
			</tr>
		</table>		
		<table align="center" class="layui-table" lay-skin="row" width="25%">
			<tr align="center">
				<td><input type="submit" name="next" value="���淵��"></td>
				<td><input type="submit" name="next" value="��������" formaction="<%=path%>/queryBed.html"
              				formnovalidate="formnovalidate"></td>
			</tr>
		</table>
	</form>
</body>
</html>