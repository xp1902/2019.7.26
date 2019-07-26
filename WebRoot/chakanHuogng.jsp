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
	<title>�鿴����</title>
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
	  #div1{
	    pointer-events: none;
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
		          ������Ϣ
		    <hr width="160">
		  </caption>
		  
		  <tr>
		    <td><label class="layui-form-label">���</label></td>
		    <td>
		      <e:text name="aaj102" readonly="true" id="a" defval="${ins.aaj102 }"/>
		    </td>
		  </tr>
		  <tr>
		    <td><label class="layui-form-label">����</label></td>
		    <td>
		      <e:text name="aaj103" readonly="true" id="a" defval="${ins.aaj103 }"/>
		    </td>
		  </tr>
		 
		  <tr>
		    <td><label class="layui-form-label">�Ա�</label></td>
		    <td>
			    <div id="div1">
			      <c:if test="${ins.aaj104=='1'}">
						            ��
				   </c:if>
				   <c:if test="${ins.aaj104=='2'}">
						            Ů
				   </c:if>
				   <c:if test="${ins.aaj104=='3'}">
						            ��ȷ�� 
				   </c:if>
			    </div>
		    </td>
		  </tr>
		
		  <tr>
		    <td><label class="layui-form-label">��������</label></td>
		    <td>
		      <e:date name="aaj105" id="a" readonly="true" defval="${ins.aaj105 }"/>
		    </td>
		  </tr>
		  <tr>
		    <td><label class="layui-form-label">��ϵ�绰</label></td>
		    <td>
		      <e:text id="a" name="aaj108" readonly="true" defval="${ins.aaj108 }"/>
		    </td>
		  </tr>
		  
		  <tr>
		    <td colspan="2" align="center">
		      <input class="layui-btn layui-btn-sm" type="submit" name="next" formaction="<%=path%>/zhiyXijie.html" value="����">
			  <input class="layui-btn layui-btn-sm" type="submit" name="next" formaction="<%=path%>/oldChakan.html" value="�鿴������Ϣ">
		    </td>
		  </tr>
		</table>
		<e:hidden name="aau101" value="${param.aau101 }"/>
	    <e:hidden name="aan101" value="${param.aan101 }"/>
	    <e:hidden name="aaj101" value="${param.aaj101 }"/>
	    <e:hidden name="aao101" value="${param.aao101 }"/>
	</form>
	</div>

</body>
</html>