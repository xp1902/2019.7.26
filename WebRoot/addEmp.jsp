<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>Insert title here</title>
</head>
<body><jsp:include page="header.jsp"></jsp:include>
<br>${msg }
<br>
<form action="<%=path%>/addEmp.html" method="post" class="layui-form" align="center">
<table  class="layui-table" lay-skin="row" align="center" width="45%" class="layui-table">
    <caption>
       Ա�����
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">Ա������</td>
   </tr>
   <tr>
     <td>����</td>
     <td>
       <e:text name="aaj103" required="true" autofocus="true"/> 
     </td>
   </tr>
   <tr>
   		<td>���֤��</td>
   		<td><e:text name="aaj106" required="true" autofocus="true"/></td>
   </tr>
   <tr>
     <td>����</td>
     <td>
       <e:date name="aaj105"  required="true"/>
     </td>
   </tr>
   <tr>
     <td>�Ա�</td>
     <td>
        <e:radio name="aaj104" value="��:1,Ů:2,��ȷ��:3"/>
     </td>
   </tr>
   <tr>
     <td>�ֻ�����</td>
     <td>
       <e:text name="aaj108"  required="true"/> 
     </td>
   </tr>
   <tr>
   <td>��������</td>
   	<td>
   		<e:select value="�ؼ�:1,һ��:2,����:3,����:4,��ͨ:5" name="aaj109" required="true"/>
   	</td>
   </tr>
   <tr>
     <td>��ע</td>
     <td>
       <e:textarea rows="5" cols="45" name="aaj110"/>
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="${empty param.aab101?'���':'�޸�' }"
              formaction="<%=path%>/addEmp.html" class="layui-btn">
       <input type="submit" name="next" value="����" 
              formaction="<%=path%>/queryEmp.html"
              formnovalidate="formnovalidate" class="layui-btn">
     </td>
   </tr>
</table>
<input type="hidden" name="aaj101" value="${param.aab101 }">
<e:hidden name="qaaj103"/>
<e:hidden name="qaaj102"/>
<e:hidden name="baaj105"/>
<e:hidden name="eaaj105"/>
<e:hidden name="qaaj104"/>
<e:hidden name="qaaj109"/>
<e:hidden name="qaaj108"/>
<e:hidden name="qaaj106"/>

</form>
</body>
</html>