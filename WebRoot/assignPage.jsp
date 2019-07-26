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
	</style>
	<script type="text/javascript">
		function onSelectBedClick(vaab101){
			var myform = document.getElementById("myform");
			myform.action="<%=path%>/queryBed.html?aab101="+vaab101;
			myform.submit();
		}
		function onQueryFamilies(vaab101){
			var myform = document.getElementById("myform");
			myform.action="<%=path%>/queryFamilies.html?aab101=" + vaab101;
			myform.submit();
		}
	</script>
</head>
	<h2 align= "center">����Ϊ��ס�˹�����Ϣ</h2>
<body>
	<form id="myform" method="post" action="" class="layui-form">
		<table align="center" class="layui-table" lay-skin="row" width="45%" class="layui-table">
			<caption>��ס����Ϣ��<hr width="160"></caption>
			<tr>
				<td>���</td>
				<td><e:text name="aab102" readonly="true" defval='${ins.aab102 }'/>
			</tr>
			<tr>
				<td>����</td>
				<td><e:text name="aab103" defval='${ins.aab103 }' readonly="true"/></td>
			</tr>
			<tr>
				<td>�Ա�</td>
				<td><e:text name="aab104" readonly="true" defval='${ins.aab104 }'/></td>
			</tr>
			<tr>
				<td>����</td>
				<td><e:text name="aai102" readonly="true" defval='${ins.aai102 }'/></td>
			</tr>
			<tr>
				<td>�����</td>
				<td><e:text name="aai104" readonly="true" defval='${ins.aai104 }'/></td>
			</tr>
			<tr>
				<td>��λ</td>
				<td><e:text name="aai105" readonly="true" defval='${ins.aai105 }'/></td>
			</tr>
			<tr>
				<td>�������</td>
				<td><e:text name="aaj102" readonly="true" defval='${ins.aaj102 }'/></td>
			</tr>
			<tr>
				<td>��������</td>
				<td><e:text name="aaj103" readonly="true" defval='${ins.aaj103 }'/></td>
			</tr>
		</table>		
		<table align="center" class="layui-table" lay-skin="row" class="layui-table">
			<tr align="center">
				<td><input type="submit" name="next" value="ѡ��λ" onclick="onSelectBedClick('${ins.aab101}')"  class="layui-btn"/></td>
				<td><input type="submit" name="next" value="�鿴������Ϣ" onclick="onQueryFamilies('${ins.aab101}')"  class="layui-btn"/></td>
				<td><input type="submit" name="next" value="��������" formaction="<%=path%>/queryTheOld.html"
              				formnovalidate="formnovalidate" class="layui-btn"></td>
			</tr>
		</table>
	</form>
</body>
</html>