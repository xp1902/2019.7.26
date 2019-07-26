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
	<title>������Ϣ</title>
	<style type="text/css">
	  #a{
	    outline:none;
	    border:0;		
	    }

	</style>
	<script>
	
	
		layui.use('element', function(){
		  var element = layui.element;
		});
	</script>
</head>
<body>

	<div class="layui-form-item">
	<form class="layui-form" action="<%=path%>/addVol.html" method="post">
	    <c:if test="${ins.aan101 != Null}">
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
		 </c:if>
		${msg}
	    <br>
	    <br>
		<table class="layui-table" style="width:50%;margin:30px auto;">
		  <caption>
		          ��д������Ϣ
		    <hr width="160">
		  </caption>
		  <tr>
		    <td><label class="layui-form-label">����</label></td>
		    <td>
		      <c:if test="${param.aan101 != Null}">
		      <e:text name="aan102" readonly="true" id="a" defval="${ins.aan102 }"/>
		      </c:if>
		      <c:if test="${param.aan101 == Null}">
		      <e:text name="aan102" required="true" id="a" defval="${ins.aan102 }"/>
		      </c:if>
		    </td>
		  </tr>
		 
		  <tr>
		    <td><label class="layui-form-label">�Ա�</label></td>
		    <td>
		      <e:radio name="aan103" required="true" value="��:1,Ů:2,��ȷ��:3" defval="${empty param.aan101?'1':ins.aan103 }"/>
		    </td>
		  </tr>
		
		  <tr>
		    <td><label class="layui-form-label">��������</label></td>
		    <td>
		      <e:date name="aan104" required="true" defval="${ins.aan104 }"/>
		    </td>
		  </tr>
		  <tr>
		    <td><label class="layui-form-label">��ϵ�绰</label></td>
		    <td>
		      <e:text id="a" name="aan105" required="true" defval="${ins.aan105 }"/>
		    </td>
		  </tr>
		  <tr>
		    <td><label class="layui-form-label">������λ</label></td>
		    <td>
		      <e:text id="a" name="aan106" required="true" defval="${ins.aan106 }"/>
		    </td>  
		  </tr>
		  <tr>
		    <td colspan="2" align="center">
		      <input class="layui-btn layui-btn-sm" type="submit" name="next" value="����" formnovalidate="formnovalidate"
		          formaction="<%=path%>/${empty param.aan101?'userRegister.jsp':'volHome.html' }" >
		      <input class="layui-btn layui-btn-sm" type="submit" name="next" value="${empty param.aan101?'���':'�޸�' }"
	              formaction="<%=path%>/${empty param.aan101?'bdd':'modify' }Vol.html">
		    </td>
		  </tr>
		</table>
		<e:hidden name="aau101" value="${param.aau101 }"/>
		<e:hidden name="aan101" value="${param.aan101 }"/>
		<e:hidden name="aau102" value="${param.aau102 }"/>
		<e:hidden name="aau103" value="${param.aau103 }"/>
		<e:hidden name="aau104" value="${param.aau104 }"/>
	</form>
	</div>

</body>
</html>