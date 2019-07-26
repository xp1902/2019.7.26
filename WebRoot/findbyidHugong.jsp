<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>护工个人信息</title>
<style type="text/css">
  td{
      height:30px;
  }
  msg{
     color:#FF0000
  }
</style>
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="js/layer-v3.1.1/layer/layer.js"></script>
   	<link rel="stylesheet" href="layui/css/layui.css">
   	<script src="layui/layui.js"></script>
   	<script src="layui/uselayui.js"></script>   
<script>
//注意：导航 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function(){var element = layui.element;});
</script>	 
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	

${msg}
<br>
<br>
<form action="<%=path%>/queryOneHugong.html" method="post" class="layui-form">
<table class="layui-table" style="width:50%;margin:30px auto;">
    <caption>
       	护工信息修改
       	<hr width="160">
    </caption>
   <tr>
     <td colspan="2" align="center">个人信息</td>
   </tr>
   <tr>
     <td>姓名</td>
     <td>
       <e:text name="aaj103" required="true" autofocus="true" defval="${ins.aaj103 }"/> 
     </td>
   </tr>
   <tr>
     <td>编号</td>
     <td>
       <e:text name="aaj102"  readonly="true" defval="${ins.aaj102 }"/> 
     </td>
   </tr>
   <tr>
     <td>性别</td>
     
     <td>
    <e:radio name="aaj104" value="男:1,女:2,不确定:3" defval="${ins.aaj104 }"/>
     </td>
   </tr>
   <tr>
     <td>生日</td>
     <td>
       <e:date name="aaj105" defval="${ins.aaj105 }"/>
     </td>
   </tr>
   <tr>
     <td>身份证号</td>
     <td>
       <e:text name="aaj106" defval="${ins.aaj106 }" />
     </td>
   </tr>
   <tr>
     <td>入职日期</td>
     <td>
        <e:date name="aaj107"  readonly="true" defval="${ins.aaj107 }"/> 
     </td>
   </tr>
   <tr>
     <td>联系电话</td>
     <td>
       <e:text name="aaj108"  required="true" defval="${ins.aaj108 }"/> 
     </td>
   </tr>
   <tr>
     <td>护工级别</td>
     <td>
       <e:radio name="aaj109" value="特级:1,一级:2,二级:3,三级:4,普通:5" required="true" defval="${ins.aaj109 }"/>
     </td>
   </tr>
   <tr>
     <td>备注</td>
     <td>
       <e:textarea rows="5" cols="45" name="aaj110" defval="${ins.aaj110 }"/>
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="修改" class="layui-btn"
              formaction="<%=path%>/modifyHugong.html">
     </td>
   </tr>
</table>
<input type="hidden" name="aaj101" value="${sessionScope.aaj101 }"/>
</form>
</body>
</html>