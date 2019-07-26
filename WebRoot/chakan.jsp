<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
   <title>�鿴����</title>
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
   <script src="js/layer-v3.1.1/layer/layer.js"></script>
   <link rel="stylesheet" href="layui/css/layui.css">
   <script src="layui/layui.js"></script>
   <script src="layui/uselayui.js"></script>
   
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
     tr
     {
        height:45px;
     }
     #div1{
	    pointer-events: none;
	  }
	</style>
      
</head>
<body>

	<div class="layui-form-item">
		<form class="layui-form" id="form1" action="<%=path%>/zhiyuanJilu.html" method="post">
			<ul class="layui-nav" lay-filter="">
			   <li class="layui-nav-item"><a href="<%=path%>/vol.jsp?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">��ҳ</a></li>
			   <li class="layui-nav-item"><a href="<%=path%>/qaddVol.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">��������</a></li>
			   <li class="layui-nav-item"><a href="<%=path%>/yuyueVol.jsp?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">ԤԼ־Ը</a></li>
			   <li class="layui-nav-item layui-this"><a href="<%=path%>/zhiyuanJilu.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">־Ը��¼</a></li>
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

		
		    <!-- ������ -->
		  
			<table class="layui-table" style="width:90%;margin:30px auto;">
			  <caption>
			          ������Ϣ
			    <hr width="160">
			  </caption>
		    </table>
			<!-- ���ݵ����� -->
			<table class="layui-table" style="width:90%;margin-left:auto;margin-right:auto;margin-top:30px;margin-bottom:0px;" >
			  <thead>
			  <tr>
			    <td></td>
			    <td>���</td>
			    <td>����</td>
			    <td>�Ա�</td>
			    <td>��Ȥ</td>
			    <td>����</td>
			    <td>��������</td>
			    <td>������ò</td>    
			    <td>��λ</td>
			  </tr>
			  </thead>
			   <c:choose>
			     <c:when test="${rows!=null }">
			         <!-- ��ʾʵ�ʲ�ѯ�������� -->
				     <c:forEach items="${rows }" var="ins" varStatus="vs">
			    	   	  <tr>
						    <td>${vs.count }</td>				    
						    <td>${ins.aab102 }</td>
						    <td>${ins.aab103  }</td>
						    <td>
							    <div id="div1">
								   <c:if test="${ins.aab104=='1'}">
										            ��
								   </c:if>
								   <c:if test="${ins.aab104=='2'}">
										            Ů
								   </c:if>
								   <c:if test="${ins.aab104=='3'}">
										            ��ȷ��
								   </c:if>
							   </div>
						   </td>
						    <td>${ins.aab105 }</td>
						    <td> <div id="div1"><e:select name="aab107" readonly="true" value="����:01,׳��:02,����:03,����:04,����:05,
		                                                                                                 ά�����:06,������:07,����:08,�ɹ���:09,����:10,
		                                                                                                 ������:11,����:12,����:13,������:14,����:15,
		                                                                                                 ������:16,��������:17,����:18,����:19,���:20,
		                                                                                                 ������:21,������:22,������:23,��ɽ��:24,������:25,
		                                                                                                 ˮ��:26,����:27,������:28,Ǽ��:29,����:30,
		                                                                                                 ������:31,������:32,�¶�������:33,���Ӷ���:34,������:35,
		                                                                                                 ë����:36,������:37,������:38,��������:39,������:40,
		                                                                                                 ������:41,���¿���:42,ŭ��:43,����:44,��ŵ��:45,
		                                                                                                 �°���:46,������:47,����˹��:48,ԣ����:49,���α����:50,
		                                                                                                 �Ű���:51,���״���:52,������:53,��������:54,������:55,
		                                                                                                 �����:56" defval="${ins.aab107 }"/></div></td>
						    <td>${ins.aab108 }</td>
							<td>${ins.aab109 }</td>
							<td>${ins.aai102 }��¥${ins.aai103 }��${ins.aai104 }��${ins.aai105 }��</td>
						  </tr>
				      </c:forEach>
				      <!-- ������� -->
				      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="10">
					          <tr>
					            <td></td>
					            <td></td>
					            <td></td>
					            <td></td>
					            <td></td>
					            <td></td>
					            <td></td>
					            <td></td>
					            <td></td>
					          </tr>
				      </c:forEach>
			     </c:when>
			     <c:otherwise>
			        <c:forEach begin="1" step="1" end="10">
			           <tr>
			             <td></td>
			             <td></td>
			             <td></td>
			             <td></td>
			             <td></td>
			             <td></td>
			             <td></td>
						 <td></td>
					     <td></td>
			           </tr>
			        </c:forEach>
			     </c:otherwise>
			   </c:choose>
			</table>
			
			<!-- ���ܰ�ť�� -->
			<table class="layui-table" style="width:90%;margin-left: auto;margin-right: auto;margin-bottom:30px;">
			  <tr>
			    <td align="center">
			       <input class="layui-btn" type="submit" name="next" formaction="<%=path%>/chakanHuogng.html" value="����">
		
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