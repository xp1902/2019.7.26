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
<title>入住服务</title>

<ul class="layui-nav" lay-filter="">
  <li class="layui-nav-item"><a href="<%=path%>/JiashuHome.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aau101=${empty ins.aau101?param.aau101:ins.aau101 }">**颐养中心</a></li>
  <li class="layui-nav-item layui-this"><a href="<%=path%>/FindByIdRuyuan.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aau101=${empty ins.aau101?param.aau101:ins.aau101 }">入住服务</a></li>
  <li class="layui-nav-item" style="float:right;margin-right:50px;">
    <a href="javascript:;">我</a>
    <dl class="layui-nav-child"> <!-- 二级菜单 -->
      <dd>
        <a href="<%=path%>/FindByIdJiashu.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aau101=${empty ins.aau101?param.aau101:ins.aau101 }">个人信息</a>
      </dd>
      <dd>
        <a href="<%=path%>/userLogin.jsp">退出登录</a>
      </dd>
    </dl>
  </li>
</ul>
 
<script>
layui.use('element', function(){
  var element = layui.element;
  //…
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
            预约入住
   </a>
  </li>
  </div>
  <div ${ins.aac104 eq 2?'style':'hidden' }>
  <li class="layui-nav-item">
   <a href="<%=path%>/FindByIdAxx01.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
            查看预约情况
   </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/FindByIdOlderHealthy.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
             入住人健康状况
    </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/addOlderChufang.jsp?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
             入住人处方添加
    </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/QueryChufang.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
             处方查询
    </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/QueryOlderDaily.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
             入住人日常信息
    </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/QueryOlderPeriodCon.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
             入住人近况
    </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/QueryOlderOut.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
             外出事项记录
     </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/OutOlder.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
            申请外出
    </a>
  </li>
  </div>
  <li class="layui-nav-item">
    <a href="<%=path%>/FankuiJiashu.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
            反馈意见
    </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/QueryFankuiJiashu.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
            反馈记录
    </a>
  </li>
</ul>

<div class="layui-row layui-col-space10" style="margin-left:210px;margin-top:10px;width:80%">
  <div class="layui-col-md4">
    <div class="">
      <div class="" style="background-image: url(&quot;//www.orpea.cn/imaginary/resize?type=webp&amp;url=http%3A%2F%2Fapp%2Fsites%2Fdefault%2Ffiles%2F2018-02%2FREA_229753_019.jpg&amp;width=1040&quot;);">
        <img src="./images/huan.jpg" alt="优雅的适老化环境设施" style="width:100%;height:auto;">
      </div>
      <div class="" style="padding:20px;">
        <h2 class="" style="line-height: 1.2;color: #000;margin-bottom: 0.625em;text-align: center;font-size:24px;">优雅的适老化环境设施</h2>
        <p class="" style="line-height: 1.5;color: #7d7d7d;margin: 0 0 1em;font-size:16px;">精美的颐养之家，只属于追求完美品质的你。</p>
      </div>
    </div>
  </div>
  <div class="layui-col-md4">
    <div class="">
      <div class="" style="background-image: url(&quot;//www.orpea.cn/imaginary/resize?type=webp&amp;url=http%3A%2F%2Fapp%2Fsites%2Fdefault%2Ffiles%2F2018-05%2F4R6A1523-%25E6%25A8%25A1%25E7%25B3%258A%25E5%25B0%258F.jpg&amp;width=1040&quot;);">
        <img src="./images/she.jpg" alt="欧洲标准的长期照护" style="width:100%;height:auto;">
      </div>
      <div class="" style="padding:20px;">
        <h2 class="" style="line-height: 1.2;color: #000;margin-bottom: 0.625em;text-align: center;font-size:24px;">长期照护</h2>
        <p class="" style="line-height: 1.5;color: #7d7d7d;margin: 0 0 1em;font-size:16px;">以老人为中心，以家庭为纽带，全面照顾老人的生活起居，给予所需的医护支持。</p>
      </div>
    </div>
  </div>
  <div class="layui-col-md4">
    <div class="">
      <div class="" style="background-image: url(&quot;//www.orpea.cn/imaginary/resize?type=webp&amp;url=http%3A%2F%2Fapp%2Fsites%2Fdefault%2Ffiles%2F2018-06%2F4R6A1700%25E5%25B0%258F.jpg&amp;width=1040&quot;);">
        <img src="./images/eat.jpg" style="width:100%;height:auto;">
      </div>
      <div class="" style="padding:20px;">
        <h2 class="" style="line-height: 1.2;color: #000;margin-bottom: 0.625em;text-align: center;font-size:24px;">九大关键，保障饮食安全</h2>
        <p class="" style="line-height: 1.5;color: #7d7d7d;margin: 0 0 1em;font-size:16px;">丰富美味的健康饮食.</p>
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