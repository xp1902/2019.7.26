<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
   <title>Ϊ����������Ʒ</title>
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
</head>
<body>
${msg }
<form id="myform" action="<%=path%>/addApply.html" method="post" class="layui-form">
	  
	<!-- ���ݵ����� -->
	<table class="layui-table"  style="width:90%;margin-left:auto;margin-right:auto;margin-top:30px;margin-bottom:0px;">
	<caption>
	               ������Ʒ�嵥
	    <hr width="160">
	  </caption>
	  <tr>
	  <td>��������:</td>
	  <td colspan=8 >${param.aab103 }</td>
	  </tr>
	  <tr>
	    <td>���</td>
		<td>��Ʒ����</td>
		<td>��Ʒ��λ</td>
		<td>��Ʒ����</td>
		<td>��Ҫ����</td>
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null }">
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count }<input type="hidden" name="aap101" value="${ins.aap101 }"/></td>
					<td>${ins.name }</td>
					<td>${ins.aap104 }</td>
					<td>${ins.aap105 }</td>
					<td><input type="number" step="1" name="aas102" min="0"/></td>
				 	<td>
				      <a href="#" onclick="onQuery('${ins.aap101}')">�鿴����Ʒ��ϸ��Ϣ</a>
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
	           </tr>
	        </c:forEach>
	     </c:otherwise>
	   </c:choose>
	   <tr>
	   <td colspan="6" align="center"><e:textarea name="aar105" rows="5" cols="45"/>
	   </td></tr>
	</table>
	
	<!-- ���ܰ�ť�� -->
	<table class="layui-table">
	  <tr>
	    <td align="center">
	    <input type="submit" name="next" value="ȷ���ύ"  class="layui-btn" 
              formaction="<%=path%>/addApply.html"/>
	       <input type="submit" name="next" value="����"  class="layui-btn" 
              formaction="<%=path%>/queryElderA.html"
              formnovalidate="formnovalidate">
	    </td>
	  </tr>
	</table>
	<input type="hidden" name="aaj101" value="${sessionScope.aaj101 }"/>
	<input type="hidden" name="aab101" value="${param.aab101 }"/>
	<input type="hidden" name="aab103" value="${param.aab103 }"/>
</form>
</body>
</html>