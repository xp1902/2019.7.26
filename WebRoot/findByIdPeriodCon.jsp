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
<script>
//ע�⣺���� ���� element ģ�飬�����޷����й����Բ���
layui.use('element', function(){var element = layui.element;});
</script>
	<script type="text/javascript">
	window.onload=function()
	{
		var a=${empty ins};
		if(a)
		{
			var now = new Date(); 
			//��ʽ���գ����С��9��ǰ�油0 
			var day = ("0" + now.getDate()).slice(-2); 
			//��ʽ���£����С��9��ǰ�油0 
			var month = ("0" + (now.getMonth() + 1)).slice(-2); 
			//ƴװ�������ڸ�ʽ 
			var today = now.getFullYear()+"-"+(month)+"-"+(day) ; 
			document.getElementById("aag102").value=(today);
		}
	}
	</script>
</head>
<body>
	<form id="myform" method="post" action="" class="layui-form">
		<table class="layui-table" style="width:50%;margin:30px auto;">
			<caption>${empty param.aag101?'���':'�޸�' }��ס�˽�����Ϣ<hr width="160"></caption>
			<tr>
				<td>����</td>
				<td>${param.aab103 }</td>
			</tr>
			<tr>
				<td>��ʳ�ص�</td>
				<td><e:text name="aag103" defval="${ins.aag103 }"/></td>
			</tr>
			<tr>
				<td>�Ը�����</td>
				<td><e:text name="aag104"  defval="${ins.aag104 }"/></td>
			</tr>
			<tr>
				<td>����</td>			
				<td><e:text name="aag105" defval="${ins.aag105 }"/></td>
			</tr>
			<tr>
				<td>�쳣����</td>
				<td><e:text name="aag106" defval="${ins.aag106 }"/></td>
			</tr>
			<tr>
				<td>����Ҫ��</td>
				<td><e:text name="aag107" defval="${ins.aag107 }"/></td>
			</tr>
			<tr>
				<td>��������</td>
				<td><e:date name="aag102" id="aag102" defval="${ins.aag102 }"/></td>
			</tr>
			<tr>
				<td>��ע</td>
				<td><e:textarea  rows="5" cols="40" name="aag108" defval="${ins.aag108 }"/></td>
			</tr>
		</table>		
		<table class="layui-table">
			<tr>
				<td align="center">
				<input type="submit" class="layui-btn" name="next" value="${empty param.aag101?'���':'�޸�' }"
              formaction="<%=path%>/${empty param.aag101?'add':'modify' }PeriodCon.html">
	       			<input type="submit" class="layui-btn" name="next" value="����" 
             		 formaction="<%=path%>/queryEPeriodCon.html"
             		 formnovalidate="formnovalidate">
	    		</td>
			</tr>
		</table>
		<input type="hidden" name="aaj101" value="${sessionScope.aaj101 }"/>
		<input type="hidden" name="aab101" value="${empty param.aab101?ins.aab101:param.aab101 }"/>
		<input type="hidden" name="aag101" value="${empty param.aag101?ins.aag101:param.aag101 }"/>
	</form>
</body>
</html>