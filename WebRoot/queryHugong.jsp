<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>����������Ϣ</title>
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
</head>
<body>
<%=session %>
${msg}
<br>
<br>
<form action="<%=path%>/addHugong.html" method="post" class="layui-form">
<table  border="1" align="center" width="45%">
    <caption>
       	������Ϣ�޸�
       	<hr width="160">
    </caption>
   <tr>
     <td colspan="2" align="center">������Ϣ</td>
   </tr>
   <tr>
     <td>����</td>
     <td>
       <e:text name="aaj103" required="true" autofocus="true" defval="${ins.aaj103 }"/> 
     </td>
   </tr>
   <tr>
     <td>���</td>
     <td>
       <e:text name="aaj102"  readonly="true" defval="${ins.aaj102 }"/> 
     </td>
   </tr>
   <tr>
     <td>�Ա�</td>
     <td>
        <e:radio name="aaj104" value="��:1,Ů:2,��ȷ��:3" defval="${ins.aaj104 }"/>
     </td>
   </tr>
   <tr>
     <td>����</td>
     <td>
       <e:date name="aaj105" defval="${ins.aaj105 }"/>
     </td>
   </tr>
   <tr>
     <td>���֤��</td>
     <td>
       <e:text name="aaj106" defval="${ins.aaj106 }" />
     </td>
   </tr>
   <tr>
     <td>��ְ����</td>
     <td>
        <e:date name="aaj107"  readonly="true" defval="${ins.aaj107 }"/> 
     </td>
   </tr>
   <tr>
     <td>��ϵ�绰</td>
     <td>
       <e:text name="aaj108"  required="true" defval="${ins.aaj108 }"/> 
     </td>
   </tr>
   <tr>
     <td>��������</td>
     <td>
       <e:radio name="aaj109" value="�ؼ�:01,һ��:02,����:03,����:04,��ͨ:05" required="true" defval="${ins.aaj109 }"/>
     </td>
   </tr>
   <tr>
     <td>��ע</td>
     <td>
       <e:textarea rows="5" cols="45" name="aaj110" defval="${ins.aaj110 }"/>
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="�޸�"
              formaction="<%=path%>/modifyHugong.html">
       <input type="submit" name="next" value="����" 
              formaction="<%=path%>/hugong.jsp"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aaj101" value="${ins.aaj101 }">
</form>
</body>
</html>