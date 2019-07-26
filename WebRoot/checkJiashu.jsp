<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>���/�޸ļ�����Ϣ</title>

<ul class="layui-nav" lay-filter="">
  <li class="layui-nav-item"><a href="<%=path%>/JiashuHome.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aau101=${empty ins.aau101?param.aau101:ins.aau101 }">**��������</a></li>
  <li class="layui-nav-item"><a href="<%=path%>/FindByIdRuyuan.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aau101=${empty ins.aau101?param.aau101:ins.aau101 }">��ס����</a></li>
  <li class="layui-nav-item layui-this" style="float:right;margin-right:50px;">
    <a href="javascript:;">��</a>
    <dl class="layui-nav-child"> <!-- �����˵� -->
      <dd>
        <a href="<%=path%>/FindByIdJiashu.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aau101=${empty ins.aau101?param.aau101:ins.aau101 }">������Ϣ</a>
      </dd>
      <dd>
        <a href="<%=path%>/userLogin.jsp">�˳���¼</a>
      </dd>
    </dl>
  </li>
</ul>
 
<script>
layui.use('element', function(){
  var element = layui.element;
  //��
});
</script>

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
<form action="<%=path%>/addJiashu.html" method="post" class="layui-form">

${msg }
<br>
<table class="layui-table" style="width:50%;margin:auto">
    <caption>
       ����${empty param.aad101?'���':'�޸�' }
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">����������Ϣ�ύ</td>
   </tr>
   <tr>
     <td>����</td>
     <td>
       <e:text name="aad102" required="true" defval="${ins.aad102 }"/> 
     </td>
   </tr>
   <tr>
     <td>���֤��</td>
     <td>
       <e:text name="aad103"  required="true" defval="${ins.aad103 }"/> 
     </td>
   </tr>
   <tr>
     <td>��ϵ�绰</td>
     <td>
       <e:text name="aad104"  required="true" defval="${ins.aad104 }"/> 
     </td>
   </tr>
   <tr>
     <td>�����˹�ϵ</td>
     <td>
       <!--
                         ����name�����Զ�����,���ڵ�ѡ 
        -->
        <e:text name="aad105" required="true"  defval="${ins.aad105 }"/> 
     </td>
   </tr>
   <tr>
     <td>������ϵ�绰</td>
     <td>
       <e:text name="aad106"  defval="${ins.aad106 }"/> 
     </td>
   </tr>
   <tr>
     <td>��ͥסַ</td>
     <td>
       <e:text name="aad107"  defval="${ins.aad107 }"/> 
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="${empty param.aad101?'���':'�޸�' }"  class="layui-btn layui-btn-sm"
              formaction="<%=path%>/${empty param.aad101?'JiashuRegandLogin':'modifyJiashu' }.html">
       <input type="submit" name="next" value="����"  class="layui-btn layui-btn-sm"
              formaction="<%=path%>/${empty param.aad101?'userRegister.jsp':'JiashuHome.html' }"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aad101" value="${param.aad101 }">

<input type="hidden" name="aau101" value="${ins.aau101 }">
<input type="hidden" name="aau102" value="${ins.aau102 }">
<input type="hidden" name="aau103" value="${ins.aau103 }">
<input type="hidden" name="aau104" value="${ins.aau104 }">
<input type="hidden" name="aau101" value="${empty ins.aau101?param.aau101:ins.aau101 }">
</form>
</body>
</html>