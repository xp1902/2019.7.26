<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
   <title>���������ճ���Ϣ�б�</title>
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
<body>
${msg }
<form id="myform" action="<%=path%>/queryLaoren.html" method="post" class="layui-form">
	  
	<!-- ���ݵ����� -->
	<table class="layui-table" style="width:90%;margin-left:auto;margin-right:auto;margin-top:30px;margin-bottom:0px;">
	<caption>
	               ����ȫ���ճ���Ϣ
	    <hr width="160">
	  </caption>
	  <tr>
	  <td>��������:</td>
	  <td colspan=9 >${param.aab103 }</td>
	  </tr>
	  <tr>
	    <td>���</td>
	    <td>����</td>
		<td>Ѫѹ</td>
		<td>����</td>
		<td>����Ƿ�����</td>
		<td>��ʳ�Ƿ�����</td>
		<td>��Ƿ�����</td>
	    <td>��ҩ�Ƿ�����</td>
		<td>��ע</td>
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null }">
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count }</td>
					<td>${ins.aah102 }</td>
					<td>${ins.aah103 }</td>
					<td>${ins.aah104 }</td>
					<td>${ins.caah105 }</td>
					<td>${ins.caah106 }</td>
					<td>${ins.caah107 }</td>
					<td>${ins.caah108 }</td>
					<td>${ins.aah109 }</td>
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
	           </tr>
	        </c:forEach>
	     </c:otherwise>
	   </c:choose>
	</table>
	
	<!-- ���ܰ�ť�� -->
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
	<input type="hidden" name="aab103" value="${EName }"/>
</form>
</body>
</html>