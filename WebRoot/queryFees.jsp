<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<style>
        input {
            height: 33px;
            line-height: 33px;
            padding: 0 7px;
            padding-left: 5px;
            border: 1px solid #ccc;
            border-radius: 2px;
            margin-bottom: -2px;
            outline: none;
        }

        input:focus {
            border-color: #009E94;
        }
        .layui-icon .layui-tree-102 .layui-tree-leaf:before {
		    content: "\e621";
		}
        
        .layui-btn:not(.layui-btn-lg ):not(.layui-btn-sm):not(.layui-btn-xs) {
		    height: 34px;
		    line-height: 34px;
		    padding: 0 8px;
		}
		
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
    <div class="t_title">
        <fieldset class="layui-elem-field layui-field-title">
            <legend>库存管理</legend>
            <table class="layui-table" style="width:75%;align:center;">
			<tr>
				<td>时间范围</td><td align="center">
				<input type="text" name="bbbf107" id="date" lay-verify="date" class="layui-input" style="width:120px;padding-left: 5px;">		  
			    </td><td align="center">
			    <input type="text" name="ebbf107" id="date1" lay-verify="date" class="layui-input" style="width:120px;padding-left: 5px;">	  
                </td><td>状态 </td><td>
				<e:select value="挂账:1,交款:2,免除:3" name="bbf104"/>
                </td><td>类型 </td><td>
				<e:select value="初始费用:1,入住费用:2,阶段性缴费:3,请假退款:4" name="bbf103"/>
                </td><td align="center">
			    <input type="text" name="aab103"  id="aab103" placeholder="老人姓名"  class="layui-input" style="width:120px;padding-left: 5px;">
			    </td><td>
			    <button class="layui-btn layui-icon" id="searchBtn">查询</button>
				</td>
			</tr>
			</table>
        </fieldset>
    </div>
<table class="layui-hide" id="test" lay-filter="test">
	
</table>
 
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
    <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
</script>
 
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
 
<script>
layui.use('table', function(){
  var table = layui.table;

  var $ = layui.$, active = {
  	reload:function(){
  		var bbf103= $("#bbf103").val();
  		var bbf104= $("#bbf104").val();
  		var aab103 =$("#aab103").val();
  		var bbbf107 =$("#date").val();
  		var ebbf107 =$("#date1").val();
  		if(1){
  			console.log(bbbf107);
  			table.reload('test',
  			{page:
  				{
  					curr:1//重新从第1页开始
  				}
  				,where:{bbf103:bbf103,
  					bbf104:bbf104,
  					aab103:aab103,
  					bbbf107:bbbf107,
  					ebbf107:ebbf107}//这里传向后台
  				
  				,url:'<%=path%>/fees/queryFees.htm'
  				,method:'get'
  			});
  	}
  	}
  };
  $('#searchBtn').on('click', function(){
  	var type = 'reload';
  	active[type] ? active[type].call(this) : '';
  });
  
  table.render({
    elem: '#test'
    ,url:'<%=path%>/fees/queryFees.htm'
    ,toolbar: '#toolbarDemo'
    ,cellMinWidth:100
    ,title: '支出审核表'
    ,cols: [[
      {type: 'checkbox', fixed: 'left'}
      ,{field:'bbf107', title:'日期', fixed: 'left', unresize: true, sort: true}
      ,{field:'cnbbf103', title:'类型'}
      ,{field:'cnbbf104', title:'状态'}
      ,{field:'aab103', title:'老人'}
      ,{field:'aak103', title:'操作员'}
      ,{field:'bbf105', title:'说明'}
      ,{align:'center', title:'操作'
      	,templet:function(d){
      		var html = '';
      		var queryBtn = '<a class="layui-btn layui-btn-xs" lay-event="query">[查看]</a>';
      		return queryBtn;
      	}	
      }
    ]]
    ,page: true
  });
  
  
  //头工具栏事件
  table.on('toolbar(test)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    switch(obj.event){
      case 'getCheckData':
        var data = checkStatus.data;
        layer.alert(JSON.stringify(data));
      break;
      case 'getCheckLength':
        var data = checkStatus.data;
        layer.msg('选中了：'+ data.length + ' 个');
      break;
      case 'isAll':
        layer.msg(checkStatus.isAll ? '全选': '未全选');
      break;
    };
  });
  
  //监听行工具事件
  table.on('tool(test)', function(obj){
    var data = obj.data;
    //console.log(obj)
    if(obj.event === 'del'){
      layer.confirm('真的删除行么', function(index){
        obj.del();
        layer.close(index);
      });
    } else if(obj.event === 'edit'){
      layer.prompt({
        formType: 2
        ,value: data.email
      }, function(value, index){
        obj.update({
          email: value
        });
        layer.close(index);
      });
    }
  });
});


</script>
    
</body>
</html>