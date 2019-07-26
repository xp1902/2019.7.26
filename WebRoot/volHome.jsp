<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>־Ը����Ϣ</title>
</head>
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
   <script src="js/layer-v3.1.1/layer/layer.js"></script>
   <link rel="stylesheet" href="layui/css/layui.css">
   <script src="layui/layui.js"></script>
   <script src="layui/uselayui.js"></script>
   
   	<style type="text/css">
	  #a{
	    outline:none;
	    border:0;		
	  }
	  #div1{
	    pointer-events: none;
	  }
	</style>

	<script>
	
	
		layui.use('element', function(){
		  var element = layui.element;
		});
	</script>
<body>


	<div class="layui-form-item">
		<form class="layui-form" id="myform" action="<%=path%>/<%=path%>/FindByIdVol.html" method="post">
		 <ul class="layui-nav" lay-filter="">
		   <li class="layui-nav-item"><a href="<%=path%>/vol.jsp?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">��ҳ</a></li>
		   <li class="layui-nav-item layui-this"><a href="<%=path%>/qaddVol.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">��������</a></li>
		   <li class="layui-nav-item"><a href="<%=path%>/yuyueVol.jsp?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">ԤԼ־Ը</a></li>
		   <li class="layui-nav-item"><a href="<%=path%>/zhiyuanJilu.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">־Ը��¼</a></li>
		   <li class="layui-nav-item"><a href="<%=path%>/zhiyuanTuandui.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">־Ը�Ŷ�</a></li>

		  <li class="layui-nav-item" style="float:right;margin-right:20px">
		    <a href="javascript:;">��</a>
		    <dl class="layui-nav-child"> <!-- �����˵� -->
		      <dd><a href="<%=path%>/qaddVol.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">��������</a></dd>
		      <dd><a href="<%=path%>/shouye.jsp">�˳���¼</a></dd>
		    </dl>
		  </li>
		 </ul>
		 ${msg }
	     <br>
	     <br>
		 <table class="layui-table" style="width:50%;margin:30px auto;">
		       <caption>
			           ��������
			    <hr width="160">
			   </caption>
			   <tr>
			     <td><label class="layui-form-label">����</label></td>
			     <td>
			       <e:text readonly="true" id="a" name="aan102" defval="${ins.aan102 }" />
			     </td>
			   </tr>
			   <tr>
			     <td><label class="layui-form-label">�Ա�</label></td>
			     <td>
			     <div id="div1">
			       <c:if test="${ins.aan103=='1'}">
						            ��
				   </c:if>
				   <c:if test="${ins.aan103=='2'}">
						            Ů
				   </c:if>
				   <c:if test="${ins.aan103=='3'}">
						            ��ȷ��
				   </c:if>
			     </div>
			     </td>
			   </tr>
			   <tr>
			     <td><label class="layui-form-label">��������</label></td>
			     <td>
			       <e:date readonly="true" id="a" name="aan104" defval="${ins.aan104 }"/>
			     </td>
			   </tr>
			   <tr>
			     <td><label class="layui-form-label">��ϵ�绰</label></td>
			     <td>
			       <e:text readonly="true" id="a" name="aan105" defval="${ins.aan105 }"/>
			     </td>
			   </tr>
			   <tr>
			     <td><label class="layui-form-label">������λ</label></td>
			     <td>
			       <e:text readonly="true" id="a" name="aan106" defval="${ins.aan106 }"/>
			     </td>
			   </tr>
			   <tr>
			     <td><label class="layui-form-label">�ۺ�����</label></td>
			     <td>
			       <e:text readonly="true" id="a" name="aan108" defval="${ins.aan108 }"/>
			     </td>
			   </tr>				
			   <tr>
			     <td colspan="2" align="center">
		     			<input class="layui-btn layui-btn-sm" type="submit" name="next" value="����" formaction="<%=path%>/vol.jsp">
						<input class="layui-btn layui-btn-sm" type="submit" name="next" value="�޸ĸ�����Ϣ" formaction="<%=path%>/qqaddVol.html">
			     </td>
			   </tr>
		 </table>
 	        <e:hidden  name="aan101" defval="${ins.aan101 }"/>
			<e:hidden  name="aau101" defval="${ins.aau101 }"/>
		</form> 
   </div>
</body>
</html>