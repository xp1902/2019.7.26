<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
   <title>��ס�˴�����¼</title>
   

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
      var count=0;
      function onSelect(vstate)
      {
    	  vstate?count++:count--;
    	  var vdel=document.getElementById("del");
    	  vdel.disabled=(count==0);
      }
      
      function onEdit(vaae101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/FindByIdOlderChufang.html?aae101="+vaae101;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onDel(vaae101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/DelByIdOlderChufang.html?aae101="+vaae101;
    	 //alert(vform.action);
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

<form id="myform" action="<%=path%>/QueryOlderOut.html" method="post">

${msg }
<br>
	<!-- ���ݵ����� -->
	<table class="layui-table" style="width:90%;margin-left:auto;margin-right:auto;margin-top:30px;margin-bottom:0px;;">
	  <tr>
	    <td></td>
	    <td>(���)</td>
	    <td>��ס�˲�ʷ</td>
	    <td>����֢״</td>
	    <td>���Ʒ���</td>
	    <td>ע������</td>
	    <td>����ҩƷ</td>
	    <td>������Ч��</td>
	    <td></td>
	  </tr>
	  <!--
	         ע������
	    1.$�������ŵĽ������ }��˫����֮��,��������ֿո�
	    2.���е�����֮������Ҫ��һ���ո�,���򱨴�
	    3.var ����,�൱����ҳ�涨���������,���  ins����������$ {  }
	   -->
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- ��ʾʵ�ʲ�ѯ�������� -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>
				      <input type="checkbox" name="idlist" value="${ins.aae101 }"
				             onclick="onSelect(this.checked)" >
				    </td>
				    <td>${vs.count }</td>
				    <td>
				      <!-- #  ��ê -->
				      <a href="#" onclick="onEdit('${ins.aae101}')">${ins.aae102 }</a>
				    </td>
				    <td>${ins.aae103 }</td>
				    <td>${ins.aae104 }</td>
				    <td>${ins.aae105 }</td>
				    <td>${ins.aae106 }</td>
				    <td>${ins.aae107 }</td>
				    <td>
				      <a href="#" onclick="onDel('${ins.aae101}')">ɾ��</a>
				    </td>
				  </tr>
		      </c:forEach>
		      <!-- ������� -->
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
	<table class="layui-table" style="width:90%;margin-left: auto;margin-right: auto;margin-bottom:30px;">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="��ѯ"  class="layui-btn layui-btn-sm">
	       <input type="submit" id="del" name="next" value="ɾ��"  class="layui-btn layui-btn-sm"
	              formaction="<%=path%>/DelOlderChufang.html"  disabled="disabled">
	       <input type="submit" name="next" value="����"  class="layui-btn layui-btn-sm"
              formaction="<%=path%>/Ruyuan.html"
              formnovalidate="formnovalidate">
	    </td>
	  </tr>
	</table>
	
	<input type="hidden" name="aad101" value="${empty ins.aad101?param.aad101:ins.aad101 }">
    <input type="hidden" name="aab101" value="${empty ins.aab101?param.aab101:ins.aab101 }">
    <input type="hidden" name="aac104" value="${empty ins.aac104?param.aac104:ins.aac104 }">
    <input type="hidden" name="aau101" value="${sessionScope.aau101 }"/>
	
</form>
</body>
</html>