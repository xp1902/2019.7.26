<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>���/�޸���ס����Ϣ</title>

<ul class="layui-nav" lay-filter="">
  <li class="layui-nav-item"><a href="<%=path%>/JiashuHome.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aau101=${empty ins.aau101?param.aau101:ins.aau101 }">**��������</a></li>
  <li class="layui-nav-item layui-this"><a href="<%=path%>/FindByIdRuyuan.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aau101=${empty ins.aau101?param.aau101:ins.aau101 }">��ס����</a></li>
  <li class="layui-nav-item" style="float:right;margin-right:50px;">
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

<script type="text/javascript">

</script>
   <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
   <script src="js/layer-v3.1.1/layer/layer.js"></script>
   <link rel="stylesheet" href="layui/css/layui.css">
   <script src="layui/layui.js"></script>
   <script src="layui/uselayui.js"></script>
</head>
<body>
<p ${empty param.aab101?'style':'hidden' }>δ�ύ����</p>
<p ${param.aac104 eq 1?'style':'hidden' }>�������ύ��������</p>
<p ${param.aac104 eq 3?'style':'hidden' }>�������ύ������ʧ��</p>
<form action="<%=path%>/addOlder.html" method="post" class="layui-form">
<ul class="layui-nav layui-nav-tree" lay-filter="test" style="position:fixed;margin-top:50px;">
  <div ${ins.aac104 eq 2?'hidden':'style' }>
  <li class="layui-nav-item">
   <a href="<%=path%>/FindByIdOlder.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
            ԤԼ��ס
   </a>
  </li>
  </div>
  <div ${ins.aac104 eq 2?'style':'hidden' }>
  <li class="layui-nav-item">
   <a href="<%=path%>/FindByIdAxx01.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
            �鿴ԤԼ���
   </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/FindByIdOlderHealthy.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
             ��ס�˽���״��
    </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/addOlderChufang.jsp?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
             ��ס�˴������
    </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/QueryChufang.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
             ������ѯ
    </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/QueryOlderDaily.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
             ��ס���ճ���Ϣ
    </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/QueryOlderPeriodCon.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
             ��ס�˽���
    </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/QueryOlderOut.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
             ��������¼
     </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/OutOlder.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
            �������
    </a>
  </li>
  </div>
  <li class="layui-nav-item">
    <a href="<%=path%>/FankuiJiashu.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
            �������
    </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/QueryFankuiJiashu.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
            ������¼
    </a>
  </li>
</ul>
${msg}
<table class="layui-table" style="width:50%;margin:30px auto;">
    <caption>
       ��ס����Ϣ${empty param.aab101?'���':'�޸�' }
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">��ס����Ϣ</td>
   </tr>
   <c:if test="${!empty ins.aab101 }">
	   <tr>
	     <td>���</td>
	     <td>
	       <e:text name="aab102"  readonly="true" defval="${ins.aab102 }"/> 
	     </td>
	   </tr>
   </c:if>
   <tr>
     <td>����</td>
     <td>
       <e:text name="aab103" required="true" defval="${ins.aab103 }"/> 
     </td>
   </tr>
   <tr>
     <td>�Ա�</td>
     <td>
       <!--
                         ����name�����Զ�����,���ڵ�ѡ 
        -->
        <e:radio name="aab104" value="��:1,Ů:2,��ȷ��:3" defval="${empty param.aab101?'1':ins.aab104 }"/>
     </td>
   </tr>
   <tr>
     <td>��Ȥ</td>
     <td>
       <e:text name="aab105"   defval="${ins.aab105 }"/>
     </td>
   </tr>
   <tr>
     <td>����</td>
     <td>
        <e:text name="aab106"  required="true" defval="${ins.aab106 }"/> 
     </td>
   </tr>
   <tr>
     <td>����</td>
     <td>
       <e:select name="aab107" value="����:1,�ɹ���:2,����:3,����:4,ά�����:5,
                                                                                                   ����:6,����:7,׳��:8,������:9,������:10,
                                                                                                   ����:11,����:12,����:13,����:14,������:15,
                                                                                                   ������:16,��������:17,����:18,����:19,������:20,
                                                                                                   ����:21,���:22,��ɽ��:23,������:24,ˮ��:25,
                                                                                                   ������:26,������:27,������:28,�¶�������:29,����:30,
                                                                                                   ���Ӷ���:31,������:32,Ǽ��:33,������:34,������:35,
                                                                                                   ë����:36,������:37,������:38,������:39,������:40,
                                                                                                   ��������:41,ŭ��:42,���α����:43,����˹��:44,���¿���:45,
                                                                                                   ������:46,������:47,ԣ����:48,����:49,��������:50,
                                                                                                   ������:51,���״���:52,������:53,�Ű���:54,�����:55,
                                                                                                   ��ŵ��:56,����:57" defval="${ins.aab107 }" />
     </td>
   </tr>
   <tr>
     <td>��������</td>
     <td>
       <e:date name="aab108"  required="true" defval="${ins.aab108 }"/>
     </td>
   </tr>
   <tr>
     <td>������ò</td>
     <td>
       <!--
                         ����name�����Զ�����,���ڵ�ѡ 
        -->
        <e:select name="aab109" value="�й���Ա:1,�й�Ԥ����Ա:2,������Ա:3,��ﵳԱ:4,������Ա:5,
                                                                                                     �񽨻�Ա:6,�����Ա:7,ũ������Ա:8,�¹�����Ա:9,����ѧ����Ա:10,
                                                                                                     ̨����Ա:11,�޵�����ʿ:12,Ⱥ��:13" defval="${ins.aab109 }" />
     </td>
   </tr>
   <tr>
     <td>������ϵ���ֻ���</td>
     <td>
       <e:text name="aab110"  required="true" defval="${ins.aab110 }"/>
     </td>
   </tr>
   <tr>
     <td>���֤��</td>
     <td>
        <e:text name="aab112" required="true" defval="${ins.aab112 }"/>
     </td>
   </tr>
   <tr>
     <td>ҽ�Ʊ���</td>
     <td>
       <e:text name="aab113"  defval="${ins.aab113 }"/>
     </td>
   </tr>
   <tr>
     <td>������</td>
     <td>
       <e:select name="aab114" value="�ؼ�:1,һ��:2,����:3,����:4,��ͨ:5" defval="${ins.aab114 }" />
     </td>
   </tr>
   <tr>
     <td></td>
     <td>
     <textarea rows="8" cols="75" readonly>
��ͨ���������������������������һ�����͡�
����������������������������������ʲ��̱����־�����ߡ�
�������������������������������˵����ˣ������죬����ʳ����С���ܹ�����
һ���������ʲ�ж����ѻ�˫Ŀʧ�����մ�����־����ģ�����С�����������
�ؼ�����������ȫ�������������Դ�����С��ʧ�����о����ϰ������ˣ��������Ҫ����������չ��ߡ�
     </textarea>
     </td>
   </tr>
   <tr>
     <td>������Ժ����</td>
     <td>
       <e:date name="aac103"  required="true" defval="${ins.aac103 }"/>
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="${empty param.aab101?'ԤԼ��ס':'ԤԼ�޸�' }"  class="layui-btn layui-btn-sm"
              formaction="<%=path%>/${empty param.aab101?'addOlder':'modifyOlderYuyue' }.html">
       <input type="submit" name="next" value="����"   class="layui-btn layui-btn-sm"
              formaction="<%=path%>/Ruyuan.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aad101" value="${empty ins.aad101?param.aad101:ins.aad101 }">
<input type="hidden" name="aab101" value="${empty ins.aab101?param.aab101:ins.aab101 }">
<input type="hidden" name="aac104" value="${empty ins.aac104?param.aac104:ins.aac104 }">
<input type="hidden" name="aau101" value="${sessionScope.aau101 }"/>


</form>
</body>
</html>