<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>�������</title>


<style type="text/css">
  td{
      height:30px;
  }
  msg{
     color:#FF0000
  }
</style>
   <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
   <script src="js/layer-v3.1.1/layer/layer.js"></script>
   <link rel="stylesheet" href="layui/css/layui.css">
   <script src="layui/layui.js"></script>
   <script src="layui/uselayui.js"></script>
<script type="text/javascript">
</script>
   	<ul class="layui-nav" lay-filter="">
   		<li class="layui-nav-item"><a href="<%=path%>/hugong.jsp">��ҳ</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryLaoren.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">�鿴�Լ��������������Ϣ</a></li>
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
 	    <li class="layui-nav-item layui-this" style="float:right;margin-right:20px">
    		<a href="javascript:;">���˹���</a>
    		<dl class="layui-nav-child">
      			<dd><a href="<%=path%>/queryOneHugong.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">�޸ĸ�����Ϣ</a></dd>
      			<dd><a href="<%=path%>/addLeave.jsp">�ύ�������</a></dd>
      			<dd><a href="<%=path%>/queryLeave.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">�鿴��������¼</a></dd>
      			<dd><a href="<%=path%>/logout.do">�˳���¼</a></dd>
    		</dl>
 	    </li>
	</ul>
<script>
//ע�⣺���� ���� element ģ�飬�����޷����й����Բ���
layui.use('element', function(){var element = layui.element;});
</script>
</head>
<body>
<form action="<%=path%>/outOlder.html" method="post" class="layui-form">
${msg }
<table class="layui-table" style="width:50%;margin:30px auto;">
    <caption>
       ���������Ϣ
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">��д�������</td>
   </tr>
   <tr>
     <td>�������</td>
     <td>
       <e:text name="acx102" required="true" defval="${ins.acx102 }"/>
     </td>
   </tr>
   <tr>
     <td>���ʱ��</td>
     <td>
        <e:date name="acx103" required="true" defval="${ins.acx103 }"/>
     </td>
   </tr>
   <tr>
     <td>Ԥ�Ʒ���ʱ��</td>
     <td>
       <e:date name="acx104"  required="true" defval="${ins.acx104 }"/>
     </td>
   </tr>
   
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="�ύ"  class="layui-btn layui-btn-sm"
              formaction="<%=path%>/AddLeave.html">
       <input type="submit" name="next" value="����"  class="layui-btn layui-btn-sm"
              formaction="<%=path%>/hugong.jsp"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aaj101" value="${sessionScope.aaj101 }"/>
</form>
</body>
</html>