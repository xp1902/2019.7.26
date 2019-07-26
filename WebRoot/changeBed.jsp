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
			<caption>入住人床位信息表<hr width="160"></caption>
			<tr>
				<td>入住人姓名</td>
				<td><e:text name="aab103"/></td>
			</tr>		
			<tr>
				<td>性别</td>
				<td><e:text name="aabl104"/></td>
			</tr>			
			<tr>
				<td>民族</td>
				<td><e:select value="男:1,女:2,不确定:3" name="aal107"/></td>
			</tr>
			<tr>
				<td>成分</td>
				<td><e:select value="群众:1,党员:2" name="aab109"/></td>
			</tr>
			<tr>
				<td>护工编号</td>
				<td><e:date name="aaj102"/></td>
			</tr>
			<tr>
				<td>护工姓名</td>
				<td><e:date name="aaj103"/></td>
			</tr>
		</table>		
		<table align="center" class="layui-table" lay-skin="row" width="25%">
			<tr align="center">
				<td><input type="submit" name="next" value="保存返回"></td>
				<td><input type="submit" name="next" value="放弃返回" formaction="<%=path%>/queryBed.html"
              				formnovalidate="formnovalidate"></td>
			</tr>
		</table>
	</form>
</body>
</html>