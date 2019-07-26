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
	<title>ԤԼ־Ը</title>
	<style type="text/css">
	    #div1
	    {
	       width:200px;
	       margin:auto;
	    }
	    #sub1
	    {
	       position:relative;
	       left: 20px;
	    }
	    #sub2
	    {
	       position:relative;
	       left: 50px;
	    }
	</style>
	
	<script>
	
	
		layui.use('element', function(){
		  var element = layui.element;
		});
	</script>
	
</head>

<body>

	<div class="layui-form-item" >
		<form class="layui-form" action="<%=path%>/yuyueVol.html" id="form1" method="post">
			<ul class="layui-nav" lay-filter="">
			   <li class="layui-nav-item"><a href="<%=path%>/vol.jsp?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">��ҳ</a></li>
			   <li class="layui-nav-item"><a href="<%=path%>/qaddVol.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">��������</a></li>
			   <li class="layui-nav-item layui-this"><a href="<%=path%>/yuyueVol.jsp?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">ԤԼ־Ը</a></li>
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
			${msg}
		    <br>
		    <br>
		    <div id="div1">
			    <label class="layui-form-label">־Ը����<br></label><e:date name="aao104" defval="${ins.aao104 }"/><br><br>
			    <input class="layui-btn layui-btn-xs" id="sub1" type="submit" name="next" 
			                                  formaction="<%=path%>/${empty param.aao101?'vol.jsp':'zhiyuanJilu.html' }" value="����">
			    <input class="layui-btn layui-btn-xs" id="sub2" type="submit" value="${empty param.aao101?'�ύ':'�޸�' }"
			                                  formaction="<%=path%>/${empty param.aao101?'yuyueVol':'gaiYuyue' }.html">
			    <e:hidden name="aan101" value="${param.aan101 }"/>
			    <e:hidden name="aau101" value="${param.aau101 }"/>
			    <e:hidden name="aao101" value="${ins.aao101 }"/>
		    </div>
		</form>    
	</div>
</body>
</html>