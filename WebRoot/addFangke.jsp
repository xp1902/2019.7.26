<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>��ӷÿ�</title>

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
<jsp:include page="header.jsp"></jsp:include>
${msg }
<br>
<form action="<%=path%>/addFangke.html" method="post" class="layui-form">



<table class="layui-table" style="width:50%;margin:auto">
    <caption>
       ��ӷÿ�
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">�ÿ͸�����Ϣ��¼</td>
   </tr>
   <tr>
     <td>����</td>
     <td>
       <e:text name="aam102" required="true" defval="${ins.aam102 }"/> 
     </td>
   </tr>
   <tr>
     <td>��ϵ�绰</td>
     <td>
       <e:text name="aam103"  required="true" defval="${ins.aam103 }"/> 
     </td>
   </tr>
   <tr>
     <td>��ע</td>
     <td>
       <e:text name="aam105"  defval="${ins.aam105 }"/> 
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="��� "  class="layui-btn layui-btn-sm"
              formaction="<%=path%>/addFangke.html">
     </td>
   </tr>
</table>
</form>
</body>
</html>