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
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="js/layer-v3.1.1/layer/layer.js"></script>
   	<link rel="stylesheet" href="layui/css/layui.css">
   	<script src="layui/layui.js"></script>
   	<script src="layui/uselayui.js"></script> 
</head>
<body>
${msg }
	<form id="myform" method="post" action="" class="layui-form">
		<table class="layui-table" style="width:50%;margin:30px auto;">
			<caption>�޸���ס���ճ���Ϣ<hr width="160"></caption>
			<tr>
				<td>����</td>
				<td>${empty ins.aab103?param.aab103:ins.aab103 }</td>
			</tr>
			<tr>
				<td>����</td>
				<td>${empty ins.aah102?param.aah102:ins.aah102 }</td>
			</tr>
			<tr>
				<td>Ѫѹ</td>
				<td><e:text name="aah103" defval="${ins.aah103 }"/></td>
			</tr>
			<tr>
				<td>����</td>			
				<td><e:text name="aah104" defval="${ins.aah104 }"/></td>
			</tr>
			<tr>
				<td>����Ƿ�����</td>
				<td><e:radio name="aah105" value="����:1,������:2,δ��¼:3" defval="${ins.aah105 }"/></td>
			</tr>
			<tr>
				<td>��ʳ�Ƿ�����</td>
				<td><e:radio name="aah106" value="����:1,������:2,δ��¼:3" defval="${ins.aah106 }"/></td>
			</tr>
			<tr>
				<td>��Ƿ�����</td>
				<td><e:radio name="aah107" value="����:1,������:2,δ��¼:3" defval="${ins.aah107 }"/></td>
			</tr>
			<tr>
				<td>��ҩ�Ƿ�����</td>
				<td><e:radio name="aah108" value="����:1,������:2,δ��¼:3" defval="${ins.aah108 }"/></td>
			</tr>
			
			<tr>
				<td>��ע</td>
				<td><e:textarea  rows="5" cols="40" name="aah109" defval="${ins.aah109 }"/></td>
			</tr>
		</table>		
		<table class="layui-table">
			<tr>
				<td align="center">
				<input type="submit" name="next" value="�޸�" class="layui-btn" 
              formaction="<%=path%>/modifyEDaily.html">
	       			<input type="submit" name="next" value="����" class="layui-btn" 
             		 formaction="<%=path%>/queryAllTDaily.html"
             		 formnovalidate="formnovalidate">
	    		</td>
			</tr>
		</table>
		<input type="hidden" name="aaj101" value="${sessionScope.aaj101 }"/>
		<input type="hidden" name="aah101" value="${empty param.aah101?ins.aah101:param.aah101 }"/>
		<input type="hidden" name="aah102" value="${empty param.aah102?ins.aah102:param.aah102 }"/>
		<input type="hidden" name="aab103" value="${empty param.aab103?ins.aab103:param.aab103 }"/>
	</form>
</body>
</html>