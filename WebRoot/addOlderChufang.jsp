<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>添加/修改入住人健康信息</title>

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
<form action="<%=path%>/addOlderHealthy.html" method="post" class="layui-form">
<ul class="layui-nav layui-nav-tree" lay-filter="test" style="position:fixed;margin-top:50px;">
  <div ${param.aac104 eq 2?'hidden':'style' }>
  <li class="layui-nav-item">
   <a href="<%=path%>/FindByIdOlder.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
            预约入住
   </a>
  </li>
  </div>
  <div ${param.aac104 eq 2?'style':'hidden' }>
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
${msg}
<table class="layui-table" style="width:50%;margin:30px auto;">
    <caption>
       入住人处方信息${empty ins.aae101?'添加':'修改' }
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">入住人处方信息</td>
   </tr>
   <tr>
     <td>入住人病史</td>
     <td>
       <e:text name="aae102"  defval="${ins.aae102 }"/>
     </td>
   </tr>
   <tr>
     <td>疾病症状</td>
     <td>
       <e:text name="aae103"  defval="${ins.aae103 }"/> 
     </td>
   </tr>
   <tr>
     <td>治疗方案</td>
     <td>
       <e:text name="aae104"  defval="${ins.aae104 }"/> 
     </td>
   </tr>
   <tr>
     <td>注意事项</td>
     <td>
       <!--
                         按照name属性自动分组,组内单选 
        -->
        <e:text name="aae105"  defval="${ins.aae105 }"/> 
     </td>
   </tr>
   <tr>
     <td>开具药品</td>
     <td>
       <e:text name="aae106"  defval="${ins.aae106 }"/> 
     </td>
   </tr>
   <tr>
     <td>处方有效期</td>
     <td>
       <e:date name="aae107"  required="true" defval="${ins.aae107 }"/>
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="${empty ins.aae101?'添加':'修改' }"  class="layui-btn layui-btn-sm"
              formaction="<%=path%>/${empty ins.aae101?'add':'modify' }OlderChufang.html">
       <input type="submit" name="next" value="返回"  class="layui-btn layui-btn-sm"
              formaction="<%=path%>/Ruyuan.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>

<input type="hidden" name="aad101" value="${empty ins.aad101?param.aad101:ins.aad101 }">
<input type="hidden" name="aac104" value="${empty ins.aac104?param.aac104:ins.aac104 }">
<input type="hidden" name="aae101" value="${empty ins.aae101?param.aae101:ins.aae101 }">
<input type="hidden" name="aab101" value="${empty ins.aab101?param.aab101:ins.aab101 }">
<input type="hidden" name="aau101" value="${sessionScope.aau101 }"/>


</form>
</body>
</html>