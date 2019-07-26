<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
   <script src="js/layer-v3.1.1/layer/layer.js"></script>
   <link rel="stylesheet" href="layui/css/layui.css">
   <script src="layui/layui.js"></script>
   <script src="layui/uselayui.js"></script>
	<title>֧Ԯϸ��</title>
		<script>
	
	
		layui.use('element', function(){
		  var element = layui.element;
		});
	</script>
	<style type="text/css">
	  #a{
	    outline:none;
	    border:0;		
	    }

	</style>
</head>
<body>

	<div class="layui-form-item">
	<form class="layui-form" action="<%=path%>/addVol.html" method="post">
		 <ul class="layui-nav" lay-filter="">
		   <li class="layui-nav-item"><a href="<%=path%>/vol.jsp?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">��ҳ</a></li>
		   <li class="layui-nav-item"><a href="<%=path%>/qaddVol.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">��������</a></li>
		   <li class="layui-nav-item"><a href="<%=path%>/yuyueVol.jsp?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">ԤԼ־Ը</a></li>
		   <li class="layui-nav-item layui-this"><a href="<%=path%>/zhiyuanJilu.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">־Ը��¼</a></li>
		   <li class="layui-nav-item"><a href="<%=path%>/zhiyuanTuandui.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">־Ը�Ŷ�</a></li>
		   <li class="layui-nav-item" style="float:right;margin-right:20px">
		     <a href="javascript:;">��</a>
		     <dl class="layui-nav-child"> <!-- �����˵� -->
		       <dd><a href="<%=path%>/qaddVol.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">��������</a></dd>
		       <dd><a href="<%=path%>/shouye.jsp">�˳���¼</a></dd>
		     </dl>
		   </li>
		 </ul>
		${msg}
	    <br>
	    <br>
		<table class="layui-table" style="width:50%;margin:30px auto;">
		  <caption>
		          ־Ըϸ��
		    <hr width="160">
		  </caption>
		  <tr>
		    <td><label class="layui-form-label">��������</label></td>
		    <td>
		      <e:date name="aao102" id="a" readonly="true" defval="${ins.aao102 }"/>
		    </td>
		  </tr>
		 
		  <tr>
		    <td><label class="layui-form-label">������</label></td>
		    <td>
		        <c:if test="${ins.aao103=='1'}">
		                                ������
		        </c:if>
		        <c:if test="${ins.aao103=='2'}">
		                                ���ͨ��
		        </c:if>
		        <c:if test="${ins.aao103=='3'}">
		                                 ���δͨ��
		        </c:if>
		    </td>
		  </tr>
		
		  <tr>
		    <td><label class="layui-form-label">־Ը����</label></td>
		    <td>
		      <e:date name="aao104" id="a" readonly="true" defval="${ins.aao104 }"/>
		    </td>
		  </tr>
		  <tr>
		    <td><label class="layui-form-label">־Ը����</label></td>
		    <td>
		      <e:text id="a" name="aao105" readonly="true" defval="${ins.aao105 }"/>
		    </td>
		  </tr>
		  <tr>
		    <td><label class="layui-form-label">���𻤹�</label></td>
		    <td>
		      <e:text id="a" name="aaj103" readonly="true" defval="${ins.aaj103 }"/>
		    </td>  
		  </tr>
		  <tr>
		    <td><label class="layui-form-label">������</label></td>
		    <td>
		      <e:text id="a" name="aao106" readonly="true" defval="${ins.aao106 }"/>
		    </td>  
		  </tr>
		  <tr>
		    <td><label class="layui-form-label">����</label></td>
		    <td>
		      <e:text id="a" name="aao107" readonly="true" defval="${ins.aao107 }"/>
		    </td>  
		  </tr>
		  <tr>
		    <td colspan="2" align="center">
		      <input class="layui-btn layui-btn-sm" type="submit" name="next" formaction="<%=path%>/zhiyuanJilu.html" value="����">
		      <input class="layui-btn layui-btn-sm" type="submit" name="next" formaction="<%=path%>/chakanHuogng.html" value="�鿴�������">
		    </td>
		  </tr>
		</table>
		<e:hidden name="aau101" value="${param.aau101 }"/>
		<e:hidden name="aan101" value="${param.aan101 }"/>
		<e:hidden name="aao101" value="${ins.aao101 }"/>
		<e:hidden name="aaj101" value="${ins.aaj101 }"/>
	</form>
	</div>

</body>
</html>