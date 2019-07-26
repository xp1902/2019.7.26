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
   	<ul class="layui-nav" lay-filter="">
   		<li class="layui-nav-item"><a href="<%=path%>/hugong.jsp">��ҳ</a></li>
		<li class="layui-nav-item layui-this"><a href="<%=path%>/queryLaoren.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">�鿴�Լ��������������Ϣ</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryPeriodCon.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">�鿴���˽���</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryDaily.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">�鿴�����������ճ���Ϣ</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryAllTDaily.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">�������ճ�</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryHVolRe.jsp">־Ը��¼</a></li>
		<li class="layui-nav-item">
    		<a href="javascript:;">��Ʒ�������</a>
    		<dl class="layui-nav-child">
      			<dd><a href="<%=path%>/queryElderA.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">��Ʒ����</a></dd>
      			<dd><a href="<%=path%>/queryHApply.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">�鿴�����¼</a></dd>
    		</dl>
 	    </li>
 	    <li class="layui-nav-item" style="float:right;margin-right:20px">
    		<a href="javascript:;">���˹���</a>
    		<dl class="layui-nav-child">
      			<dd><a href="<%=path%>/queryOneHugong.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">�޸ĸ�����Ϣ</a></dd>
      			<dd><a href="<%=path%>/addLeave.jsp">�ύ�������</a></dd>
      			<dd><a href="<%=path%>/queryLeave.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">�鿴��������¼</a></dd>
      			<dd><a href="<%=path%>/logout.do">�˳���¼</a></dd>
    		</dl>
 	    </li>
	</ul>
</head>
	<h2 align= "center">����Ϊ��ס����ϸ��Ϣ</h2>
<body>
	<form method="post" action="" class="layui-form">
		<table class="layui-table" style="width:50%;margin:30px auto;">

			<caption>��ס����Ϣ��<hr width="160"></caption>
			<tr>
				<td>����</td>
				<td>${ins.aab103 }</td>
			</tr>
			<tr>
				<td>�Ա�</td>
				<td>${ins.aab104 }</td>
			</tr>
			<tr>
				<td>����</td>
				<td>${ins.aab106 }</td>
			</tr>
			<tr>
				<td>����</td>			
				<td>${ins.aab107 }</td>
			</tr>
			<tr>
				<td>��������</td>
				<td>${ins.aab108 }</td>
			</tr>
			<tr>
				<td>������ò</td>
				<td>${ins.aab109 }</td>
			</tr>
			<tr>
				<td>������ϵ�ֻ���</td>
				<td>${ins.aab110 }</td>
			</tr>
			<tr>
				<td>��ס״̬</td>
				<td>${ins.aab111 }</td>
			</tr>
			<tr>
				<td>ҽ�Ʊ���</td>
				<td>${ins.aab113 }</td>
			</tr>
			<tr>
				<td>���֤��</td>
				<td>${ins.aab112 }</td>
			</tr>
			<tr>
				<td>������</td>
				<td>${ins.aab114 }</td>
			</tr>
			
			
			
			
			
			<tr>
				<td colspan=2 align="center">��ס�˽�����Ϣ��</td>
			</tr>
			<tr>
				<td>��־</td>
				<td>${ins.aaf101 }</td>
			</tr><tr>
				<td>����ҩ��</td>
				<td>${ins.aaf102 }</td>
			</tr><tr>
				<td>����ҽԺ</td>
				<td>${ins.aaf103 }</td>
			</tr><tr>
				<td>����ҽʦ</td>
				<td>${ins.aaf104 }</td>
			</tr><tr>
				<td>ҽԺ�绰</td>
				<td>${ins.aaf105 }</td>
			</tr><tr>
				<td>��Ҫ����</td>
				<td>${ins.aaf106 }</td>
			</tr>
			
			
			
			
			<tr>
				<td colspan=2 align="center">��ס��ס�ޱ�</td>
			</tr>
			<tr>
				<td>����</td>
				<td>${ins.aai102 }</td>
			</tr>
			<tr>
				<td>�����</td>
				<td>${ins.aai104 }</td>
			</tr>
			<tr>
				<td>��λ</td>
				<td>${ins.aai105 }</td>
			</tr>
		</table>		
		<table class="layui-table">
			<tr>
				<td align="center">
	       			<input type="submit" name="next" value="����" class="layui-btn" 
             		 formaction="<%=path%>/queryLaoren.html"
             		 formnovalidate="formnovalidate">
	    		</td>
			</tr>
		</table>
		<input type="hidden" name="aaj101" value="${sessionScope.aaj101 }"/>
	</form>
</body>
</html>