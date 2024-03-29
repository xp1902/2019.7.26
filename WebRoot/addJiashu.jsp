<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>添加/修改家属信息</title>

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


</head>
<body>
${msg }
<br>
<form action="<%=path%>/addJiashu.html" method="post" class="layui-form">



<table class="layui-table" style="width:50%;margin:auto">
    <caption>
       家属${empty param.aad101?'添加':'修改' }
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">家属个人信息提交</td>
   </tr>
   <tr>
     <td>姓名</td>
     <td>
       <e:text name="aad102" required="true" defval="${ins.aad102 }"/> 
     </td>
   </tr>
   <tr>
     <td>身份证号</td>
     <td>
       <e:text name="aad103"  required="true" defval="${ins.aad103 }"/> 
     </td>
   </tr>
   <tr>
     <td>联系电话</td>
     <td>
       <e:text name="aad104"  required="true" defval="${ins.aad104 }"/> 
     </td>
   </tr>
   <tr>
     <td>与老人关系</td>
     <td>
       <!--
                         按照name属性自动分组,组内单选 
        -->
        <e:text name="aad105" required="true"  defval="${ins.aad105 }"/> 
     </td>
   </tr>
   <tr>
     <td>紧急联系电话</td>
     <td>
       <e:text name="aad106"  defval="${ins.aad106 }"/> 
     </td>
   </tr>
   <tr>
     <td>家庭住址</td>
     <td>
       <e:text name="aad107"  defval="${ins.aad107 }"/> 
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="添加 "  class="layui-btn layui-btn-sm"
              formaction="<%=path%>/JiashuRegandLogin.html">
       <input type="submit" name="next" value="返回"  class="layui-btn layui-btn-sm"
              formaction="<%=path%>/userRegister.jsp }"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aad101" value="${param.aad101 }">

<input type="hidden" name="aau101" value="${ins.aau101 }">
<input type="hidden" name="aau102" value="${ins.aau102 }">
<input type="hidden" name="aau103" value="${ins.aau103 }">
<input type="hidden" name="aau104" value="${ins.aau104 }">
</form>
</body>
</html>