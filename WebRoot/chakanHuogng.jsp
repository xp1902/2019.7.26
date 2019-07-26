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
	<title>查看护工</title>
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
		   <li class="layui-nav-item"><a href="<%=path%>/vol.jsp?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">首页</a></li>
		   <li class="layui-nav-item"><a href="<%=path%>/qaddVol.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">个人中心</a></li>
		   <li class="layui-nav-item"><a href="<%=path%>/yuyueVol.jsp?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">预约志愿</a></li>
		   <li class="layui-nav-item layui-this"><a href="<%=path%>/zhiyuanJilu.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">志愿记录</a></li>
		   <li class="layui-nav-item"><a href="<%=path%>/zhiyuanTuandui.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">志愿团队</a></li>
		   <li class="layui-nav-item" style="float:right;margin-right:20px">
		     <a href="javascript:;">我</a>
		     <dl class="layui-nav-child"> <!-- 二级菜单 -->
		       <dd><a href="<%=path%>/qaddVol.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">个人中心</a></dd>
		       <dd><a href="<%=path%>/shouye.jsp">退出登录</a></dd>
		     </dl>
		   </li>
		 </ul>
		${msg}
	    <br>
	    <br>
		<table class="layui-table" style="width:50%;margin:30px auto;">
		  <caption>
		          护工信息
		    <hr width="160">
		  </caption>
		  
		  <tr>
		    <td><label class="layui-form-label">编号</label></td>
		    <td>
		      <e:text name="aaj102" readonly="true" id="a" defval="${ins.aaj102 }"/>
		    </td>
		  </tr>
		  <tr>
		    <td><label class="layui-form-label">姓名</label></td>
		    <td>
		      <e:text name="aaj103" readonly="true" id="a" defval="${ins.aaj103 }"/>
		    </td>
		  </tr>
		 
		  <tr>
		    <td><label class="layui-form-label">性别</label></td>
		    <td>
			    <div id="div1">
			      <c:if test="${ins.aaj104=='1'}">
						            男
				   </c:if>
				   <c:if test="${ins.aaj104=='2'}">
						            女
				   </c:if>
				   <c:if test="${ins.aaj104=='3'}">
						            不确定 
				   </c:if>
			    </div>
		    </td>
		  </tr>
		
		  <tr>
		    <td><label class="layui-form-label">出生日期</label></td>
		    <td>
		      <e:date name="aaj105" id="a" readonly="true" defval="${ins.aaj105 }"/>
		    </td>
		  </tr>
		  <tr>
		    <td><label class="layui-form-label">联系电话</label></td>
		    <td>
		      <e:text id="a" name="aaj108" readonly="true" defval="${ins.aaj108 }"/>
		    </td>
		  </tr>
		  
		  <tr>
		    <td colspan="2" align="center">
		      <input class="layui-btn layui-btn-sm" type="submit" name="next" formaction="<%=path%>/zhiyXijie.html" value="返回">
			  <input class="layui-btn layui-btn-sm" type="submit" name="next" formaction="<%=path%>/oldChakan.html" value="查看老人信息">
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