<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
   <title>�������н�����Ϣ�б�</title>
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
   function onQuery(vaag101)
   {
 	 var vform = document.getElementById("myform");
 	 vform.action="<%=path%>/findByIdPeriodCon.html?aag101="+vaag101;
 	 vform.submit();
   }

   </script>
   
<ul class="layui-nav" lay-filter="">
  <li class="layui-nav-item"><a href="<%=path%>/JiashuHome.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aau101=${empty ins.aau101?param.aau101:ins.aau101 }">**��������</a></li>
  <li class="layui-nav-item layui-this"><a href="<%=path%>/FindByIdRuyuan.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aau101=${empty ins.aau101?param.aau101:ins.aau101 }">��ס����</a></li>
  <li class="layui-nav-item" style="float:right;margin-right:50px;">
    <a href="javascript:;">��</a>
    <dl class="layui-nav-child"> <!-- �����˵� -->
      <dd>
        <a href="<%=path%>/FindByIdJiashu.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aau101=${empty ins.aau101?param.aau101:ins.aau101 }">������Ϣ</a>
      </dd>
      <dd>
        <a href="<%=path%>/userLogin.jsp">�˳���¼</a>
      </dd>
    </dl>
  </li>
</ul>
 
<script>
layui.use('element', function(){
  var element = layui.element;
  //��
});
</script>
   
</head>
<body>
${msg }
<form id="myform" action="<%=path%>/queryLaoren.html" method="post" class="layui-form">
	  
	<!-- ���ݵ����� -->
	<table class="layui-table"  style="width:90%;margin-left:auto;margin-right:auto;margin-top:30px;margin-bottom:0px;">
	<caption>
	               ���������˽�����Ϣ
	    <hr width="160">
	  </caption>
	  <tr>
	    <td>���</td>
		<td>��ʳ�ص�</td>
		<td>�Ը�����</td>
		<td>����</td>
		<td>�쳣����</td>
		<td>����Ҫ��</td>
	    <td>��������</td>
		<td>��ע</td>
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null }">
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count }</td>
					<td>${ins.aag103 }</td>
					<td>${ins.aag104 }</td>
					<td>${ins.aag105 }</td>
					<td>${ins.aag106 }</td>
					<td>${ins.aag107 }</td>
					<td>${ins.aag102 }</td>
					<td>${ins.aag108 }</td>
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
	           </tr>
	        </c:forEach>
	     </c:otherwise>
	   </c:choose>
	</table>
	
	<!-- ���ܰ�ť�� -->
	<table class="layui-table" style="width:90%;margin-left: auto;margin-right: auto;margin-bottom:30px;" >
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="����"  class="layui-btn layui-btn-sm"
              formaction="<%=path%>/Ruyuan.html"
              formnovalidate="formnovalidate">
	    </td>
	  </tr>
	</table>
	<input type="hidden" name="aad101" value="${empty ins.aad101?param.aad101:ins.aad101 }">
    <input type="hidden" name="aab101" value="${empty ins.aab101?param.aab101:ins.aab101 }">
</form>
</body>
</html>