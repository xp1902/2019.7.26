<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">

.layui-btn {
background-color:#393D49;
}


</style>

 <script type="text/javascript">

</script>
   <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
   <script src="js/layer-v3.1.1/layer/layer.js"></script>
   <link rel="stylesheet" href="layui/css/layui.css">
   <script src="layui/layui.js"></script>
   <script src="layui/uselayui.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>־Ը����ҳ</title>

	<ul class="layui-nav" lay-filter="">
	   <li class="layui-nav-item layui-this"><a href="<%=path%>/vol.jsp?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">��ҳ</a></li>
	   <li class="layui-nav-item"><a href="<%=path%>/qaddVol.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">��������</a></li>
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
 
 <script>
//ע�⣺���� ���� element ģ�飬�����޷����й����Բ���
layui.use('element', function(){
  var element = layui.element;
  
  //��
});
</script>


</head>
<body>
	<form method="post">
	
		<section>
		  <div style="width:80%;margin:0px auto;z-index:1;">
		    <img src="./images/home.jpg" style="width:100%;height:500px">
		    <div>
		    </div>
		  </div>
		</section>
		<fieldset class="layui-elem-field" style="width:60%;margin:10px auto;padding:5px 10px;">
		  <legend style="font-size: 40px;line-height: 1.2;color: #204479;margin-bottom: 0.5em;">**��������</legend>
		  <div class="layui-field-box" style="font-size: 18px;line-height: 1.5;color: #7d7d7d;margin: 0;">
		     **�������Ļ����й����Ϸ�����ҵ������չ���޴���������ؽ���������״��**�������ķ��۳����Ƚ���չ������̽�����ʺ��й����顢����ŷ�ޱ�׼�ӹ�ĳ����ջ����Ϸ���ģʽ��
		  </div>
		</fieldset>
		
		<input type="hidden" name="aan101" value="${empty ins.aan101?param.aan101:ins.aan101 }">
	</form>
</body>
</html>