<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
</style>

<script type="text/javascript">

</script>
   <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
   <script src="js/layer-v3.1.1/layer/layer.js"></script>
   <link rel="stylesheet" href="layui/css/layui.css">
   <script src="layui/layui.js"></script>
   <script src="layui/uselayui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>��ס����</title>

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

</head>
<body>
<form method="post">
<br>
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

<div class="layui-row layui-col-space10" style="margin-left:210px;margin-top:10px;width:80%">
  <div class="layui-col-md4">
    <div class="">
      <div class="" style="background-image: url(&quot;//www.orpea.cn/imaginary/resize?type=webp&amp;url=http%3A%2F%2Fapp%2Fsites%2Fdefault%2Ffiles%2F2018-02%2FREA_229753_019.jpg&amp;width=1040&quot;);">
        <img src="./images/huan.jpg" alt="���ŵ����ϻ�������ʩ" style="width:100%;height:auto;">
      </div>
      <div class="" style="padding:20px;">
        <h2 class="" style="line-height: 1.2;color: #000;margin-bottom: 0.625em;text-align: center;font-size:24px;">���ŵ����ϻ�������ʩ</h2>
        <p class="" style="line-height: 1.5;color: #7d7d7d;margin: 0 0 1em;font-size:16px;">����������֮�ң�ֻ����׷������Ʒ�ʵ��㡣</p>
      </div>
    </div>
  </div>
  <div class="layui-col-md4">
    <div class="">
      <div class="" style="background-image: url(&quot;//www.orpea.cn/imaginary/resize?type=webp&amp;url=http%3A%2F%2Fapp%2Fsites%2Fdefault%2Ffiles%2F2018-05%2F4R6A1523-%25E6%25A8%25A1%25E7%25B3%258A%25E5%25B0%258F.jpg&amp;width=1040&quot;);">
        <img src="./images/she.jpg" alt="ŷ�ޱ�׼�ĳ����ջ�" style="width:100%;height:auto;">
      </div>
      <div class="" style="padding:20px;">
        <h2 class="" style="line-height: 1.2;color: #000;margin-bottom: 0.625em;text-align: center;font-size:24px;">�����ջ�</h2>
        <p class="" style="line-height: 1.5;color: #7d7d7d;margin: 0 0 1em;font-size:16px;">������Ϊ���ģ��Լ�ͥΪŦ����ȫ���չ����˵�������ӣ����������ҽ��֧�֡�</p>
      </div>
    </div>
  </div>
  <div class="layui-col-md4">
    <div class="">
      <div class="" style="background-image: url(&quot;//www.orpea.cn/imaginary/resize?type=webp&amp;url=http%3A%2F%2Fapp%2Fsites%2Fdefault%2Ffiles%2F2018-06%2F4R6A1700%25E5%25B0%258F.jpg&amp;width=1040&quot;);">
        <img src="./images/eat.jpg" style="width:100%;height:auto;">
      </div>
      <div class="" style="padding:20px;">
        <h2 class="" style="line-height: 1.2;color: #000;margin-bottom: 0.625em;text-align: center;font-size:24px;">�Ŵ�ؼ���������ʳ��ȫ</h2>
        <p class="" style="line-height: 1.5;color: #7d7d7d;margin: 0 0 1em;font-size:16px;">�ḻ��ζ�Ľ�����ʳ.</p>
      </div>
    </div>
  </div>
</div>

<input type="hidden" name="aad101" value="${ins.aad101 }">
<input type="hidden" name="aab101" value="${empty ins.aab101?param.aab101:ins.aab101 }">
<input type="hidden" name="aac104" value="${empty ins.aac104?param.aac104:ins.aac104 }">
<input type="hidden" name="aau101" value="${empty ins.aau101?param.aau101:ins.aau101 }">
<input type="hidden" name="aau101" value="${sessionScope.aau101 }"/>


</form>
</body>
</html>