<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
   <title>Insert title here</title>
   <style type="text/css">
     tr
     {
        height:30px;
     }
   </style>
</head>
<body>
${msg }
<br>
<br>
<form action="<%=request.getContextPath()%>/queryEmp.html" method="post">
  <!-- ��ѯ������ -->
	<table border="1" width="95%" align="center">
	  <caption>
	               Ա������
	    <hr width="160">
	  </caption>
	  <tr>
	    <td colspan="4">��ѯ����</td>
	  </tr>
	  <tr>
	    <td>����</td>
	    <td>
	      <e:text name="qaab102"/>
	    </td>
	    <td>Ա�����</td>
	    <td>
	      <e:text name="qaab103"/>
	    </td>
	  </tr>
	  <tr>
	    <td>�Ա�</td>
	    <td>
	      <e:radio name="qaab105" value="��:1,Ů:2,��ȷ��:3,���޶�:''" defval=""/>
	    </td>
	    <td>����</td>
	    <td>
	      <e:select name="qaab106" value="����:01,����:02,����:03,����:04,������:05" header="true" />
	    </td>
	  </tr>
	  <tr>
	    <td>����[B]</td>
	    <td>
	      <e:date name="baab104"/>
	    </td>
	    <td>����[E]</td>
	    <td>
	      <e:date name="eaab104"/>
	    </td>
	  </tr>
	</table>
	${rows }
	<!-- ���ݵ����� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td></td>
	    <td>���</td>
	    <td>����</td>
	    <td>���</td>
	    <td>����</td>
	    <td>�Ա�</td>
	    <td>����</td>
	    <td>�ֻ�����</td>
	    <td>�����ʼ�</td>
	    <td></td>
	  </tr>
	  <!--
	         ע������
	    1.$�������ŵĽ������ }��˫����֮��,��������ֿո�
	    2.���е�����֮������Ҫ��һ���ո�,���򱨴�
	    3.var ����,�൱����ҳ�涨���������,���  ins����������$ {  }
	   -->
	  <c:if test="${rows!=null }">
	     <c:forEach items="${rows }" var="ins" varStatus="vs">
    	   	  <tr>
			    <td></td>
			    <td>${vs.count }</td>
			    <td>${ins.aab102 }</td>
			    <td>${ins.aab103 }</td>
			    <td>${ins.aab104 }</td>
			    <td>${ins.aab105 }</td>
			    <td>${ins.aab106 }</td>
			    <td>${ins.aab108 }</td>
			    <td>${ins.aab109 }</td>
			    <td></td>
			  </tr>
	      </c:forEach>
	  </c:if>
	</table>
	
	<!-- ���ܰ�ť�� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="��ѯ">
	       <input type="submit" name="next" value="���" 
	              formaction="<%=request.getContextPath()%>/addEmp.jsp">
	       <input type="submit" name="next" value="ɾ��" disabled="disabled">
	    </td>
	  </tr>
	</table>
</form>
</body>
</html>