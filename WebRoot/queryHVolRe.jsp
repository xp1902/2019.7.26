<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
   <title>־Ը��¼��Ϣ�б�</title>
   <style type="text/css">
     tr
     {
        height:25px;
     }
   </style>
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="js/layer-v3.1.1/layer/layer.js"></script>
   	<link rel="stylesheet" href="layui/css/layui.css">
   	<script src="layui/layui.js"></script>
   	<script src="layui/uselayui.js"></script> 
   <script type="text/javascript">
   function onQuery(vaao101)
   {
 	 var vform = document.getElementById("myform");
 	 vform.action="<%=path%>/findByIdVolRe.html?aao101="+vaao101;
 	 vform.submit();
   }
   function onQueryVol(vaan101)
   {
 	 var vform = document.getElementById("myform");
 	 vform.action="<%=path%>/findByIdHVol.html?aan101="+vaan101;
 	 vform.submit();
   }
   </script>
      <ul class="layui-nav" lay-filter="">
   		<li class="layui-nav-item"><a href="<%=path%>/hugong.jsp">��ҳ</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryLaoren.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">�鿴�Լ��������������Ϣ</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryPeriodCon.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">�鿴���˽���</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryDaily.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">�鿴�����������ճ���Ϣ</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryAllTDaily.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">�������ճ�</a></li>
		<li class="layui-nav-item layui-this"><a href="<%=path%>/queryHVolRe.jsp">־Ը��¼</a></li>
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
<script>
//ע�⣺���� ���� element ģ�飬�����޷����й����Բ���
	layui.use('element', function(){var element = layui.element;});
	window.onload=function()
	{
		var a=${empty rows};
		var b=${empty msg};
		
		if(a&&b)
		{
			var now = new Date(); 
			//��ʽ���գ����С��9��ǰ�油0 
			var day = ("0" + now.getDate()).slice(-2); 
			//��ʽ���£����С��9��ǰ�油0 
			var month = ("0" + (now.getMonth() + 1)).slice(-2); 
			//ƴװ�������ڸ�ʽ 
			var today = now.getFullYear()+"-"+(month)+"-"+(day) ; 
			document.getElementById("baao104").value=(today);
			document.getElementById("eaao104").value=(today);
			var vform = document.getElementById("myform");
			vform.action="<%=path%>/queryHVolRe.html";
		 	vform.submit();
		}
	}		
</script>
</head>
<body>
${msg }
<form id="myform" action="<%=path%>/hugong.jsp" method="post" class="layui-form">
	  
	  <table class="layui-table" style="width:90%;margin-left:auto;margin-right:auto;margin-top:30px;margin-bottom:0px;">
	  <caption>
	               ־Ը��¼��ѯ
	    <hr width="160">
	  </caption>
	  <tr>
	    <td colspan="8" align="center">��ѯ����</td>
	  </tr>
	  <tr>
	    <td>־Ը������</td>
	    <td>
	      <e:text name="qaan102"/>
	    </td>
	    <td>־Ը���Ա�</td>
	    <td colspan="3">
	      <e:radio name="qaan103" value="��:1,Ů:2,��ȷ��:3,���޶�:''" defval=""/>
	    </td>
	    
	  </tr>
	  <tr>
	  <td>��ʼ����</td>
	    <td>
	      <e:date name="baao104"/>
	    </td>
	    <td>��������</td>
	    <td>
	      <e:date name="eaao104"/>
	    </td>
	    </tr>
	  <tr>
	    <td colspan="4" align="center">
	     <input type="submit" name="next" value="��ѯ" class="layui-btn"
              formaction="<%=path%>/queryHVolRe.html"/>
	    </td>
	  </tr>
	  </table>
	  
	  
	<!-- ���ݵ����� -->
	<table class="layui-table"  style="width:90%;margin-left:auto;margin-right:auto;margin-top:30px;margin-bottom:0px;">
	<caption>
	               ־Ը��¼��Ϣ�б�
	    <hr width="160">
	  </caption>
	  <tr>
	    <td>���</td>
		<td>־Ը������</td>
		<td>־Ը���Ա�</td>
		<td>־Ը����ϵ�绰</td>
	    <td>־Ը����</td>
		<td>־Ը����</td>
		<td>������</td>
	    <td>����</td>
	    <td></td>
	    <td></td>
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null }">
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count }</td>
					<td>${ins.aan102 }</td>
					<td>${ins.aan103 }</td>
					<td>${ins.aan105 }</td>
					<td>${ins.aao104 }</td>
					<td>${ins.aao105 }</td>
					<td>${ins.aao106 }</td>
					<td>${ins.aao107 }</td>
				    <td>
				      <a href="#" onclick="onQueryVol('${ins.aan101}')">�鿴��־Ը�����</a>
				    </td>
				    <td>
				      <a href="#" onclick="onQuery('${ins.aao101}')">Ϊ�ô�־Ը�������</a>
				    </td>
				  
				  </tr>
		      </c:forEach>
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
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
			          </tr>
		      </c:forEach>
	     </c:when>
	     <c:otherwise>
	        <c:forEach begin="1" step="1" end="15">
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
	           </tr>
	        </c:forEach>
	     </c:otherwise>
	   </c:choose>
	</table>
	
	<!-- ���ܰ�ť�� -->
	<table class="layui-table">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="����"  class="layui-btn" 
              formaction="<%=path%>/hugong.jsp"
              formnovalidate="formnovalidate">
	    </td>
	  </tr>
	</table>
	<input type="hidden" name="aaj101" value="${sessionScope.aaj101 }"/>
</form>
</body>
</html>