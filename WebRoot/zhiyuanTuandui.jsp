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
	<title>־Ը�Ŷ�</title>
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
	    <c:if test="${ins.aan109 != Null}">
		    <form class="layui-form" action="<%=path%>/addVol.html" method="post">
			     <ul class="layui-nav" lay-filter="">
				   <li class="layui-nav-item"><a href="<%=path%>/vol.jsp?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">��ҳ</a></li>
				   <li class="layui-nav-item"><a href="<%=path%>/qaddVol.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">��������</a></li>
				   <li class="layui-nav-item"><a href="<%=path%>/yuyueVol.jsp?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">ԤԼ־Ը</a></li>
				   <li class="layui-nav-item"><a href="<%=path%>/zhiyuanJilu.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">־Ը��¼</a></li>
				   <li class="layui-nav-item layui-this"><a href="<%=path%>/zhiyuanTuandui.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">־Ը�Ŷ�</a></li>
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
			         �ҵ��Ŷ�
			    <hr width="160">
			  </caption>
			  <tr>
			    <td><label class="layui-form-label">�Ŷ�����</label></td>
			    <td>
			      <e:text name="bba102" id="a" readonly="true" defval="${ins.bba102 }"/>
			    </td>
			  </tr>
			 
			  <tr>
			    <td><label class="layui-form-label">�ӳ�</label></td>
			    <td>
			      <e:text name="aan102" id="a" readonly="true" defval="${ins.aaz102 }"/>
			    </td>
			  </tr>
			 
			  <tr>
			    <td><label class="layui-form-label">�Ŷ�����</label></td>
			    <td>
			      <e:text name="bba105" id="a" readonly="true" defval="${ins.bba105 }" />
			    </td>
			  </tr>
			  
			  <tr>
			    <td><label class="layui-form-label" style="width:100px">һ��ʱ��</label></td>
			    <td> 
			      <e:text name="bba106" id="a" readonly="true"  defval="${ins.bba106 }" />
			    </td>
			  </tr>
			  
			  <tr>
			    <td><label class="layui-form-label">�Ŷ�����</label></td>
			    <td>
			      <e:textarea rows="5" cols="45" readonly="true" name="bba103" id="a" defval="${ins.bba103 }" />
			    </td>
			  </tr>
			  
			  <tr>
			    <td><label class="layui-form-label">����ʱ��</label></td>
			    <td>
			      <e:date name="bba104" readonly="true"  defval="${ins.bba104 }"/>
			    </td>
			  </tr>
			  
			  <tr>
			    <td colspan="2" align="center">
			      <input class="layui-btn layui-btn-sm" type="submit" name="next" formaction="<%=path%>/vol.jsp" value="����">
			      <c:if test="${ins.aan101 == ins.aaz101}">
			        <input class="layui-btn layui-btn-sm" type="submit" name="next" value="�޸��Ŷ���Ϣ "
		                formaction="<%=path%>/bddTeam.html">
		          </c:if>
		            <input class="layui-btn layui-btn-sm" type="submit" name="next" value="�鿴��Ա "
		                formaction="<%=path%>/chaDuiyuan.html">
		          <c:if test="${ins.aan101 != ins.aaz101}">
		            <input class="layui-btn layui-btn-sm" type="submit" name="next" value="�˳��Ŷ� "
		                formaction="<%=path%>/delTeam.html">
		          </c:if>
			    </td>
			  </tr>
			</table>
			<e:hidden name="aau101" value="${param.aau101 }"/>
			<e:hidden name="aan101" value="${param.aan101 }"/>
			<e:hidden name="bba101" value="${ins.bba101 }"/>
			</form>
	    </c:if>
	    
	    
	    <c:if test="${ins.aan109 == Null}">
	        <script language=javascript> 
	            setTimeout("document.form1.submit()",1) 
	        </script> 
	         <form class="layui-form" name="form1" action="<%=path%>/queryTeam.html" method="post">
	         
	            <e:hidden name="aau101" value="${param.aau101 }"/>
			    <e:hidden name="aan101" value="${param.aan101 }"/>
	         
	         </form>
	    </c:if>
		
	</div>

</body>
</html>