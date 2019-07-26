<%@ page language="java" import="java.util.*" import="com.neusoft.system.tools.Tools" pageEncoding="GBK"%>
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
            height: 35px;
            line-height: 35px;
            padding: 0 7px;
            border: 1px solid #ccc;
            border-radius: 2px;
            margin-bottom: -2px;
            outline: none;
        }

        input:focus {
            border-color: #009E94;
        }
</style>
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="js/layer-v3.1.1/layer/layer.js"></script>
	<link rel="stylesheet" href="layui/css/layui.css">
	<link rel="styleSheet" href="layui/extend/treeGrid.css">
	<script src="layui/layui.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
    <div class="t_title">
        <fieldset class="layui-elem-field layui-field-title">
            <legend>库存管理</legend>
            <div class="layui-btn-group">
			    <a class="layui-btn layui-btn-primary"  onclick="reload()">重新加载</a>
			    <a class="layui-btn layui-btn-primary"  onclick="openAll();">展开或折叠全部</a>
			    <a class="layui-btn layui-btn-primary"  onclick="openInWindow();">提交入库</a>
			    <a class="layui-btn layui-btn-primary"  onclick="queryIns();" >查看入库数据</a>
		    </div>
		    <input type="text" id="edt-search" placeholder="输入关键字"  style="width:120px;padding-left:10px;">
		    <a class="layui-btn layui-btn-primary" id="btn-search">查询</a>
        </fieldset>
    </div>
    <div class="dBody">
    	<table id="treeTable" lay-filter="treeTable" style="width:80%;"></table>
	</div>
<script>
    var editObj=null,ptable=null,treeGrid=null,tableId='treeTable',layer=null;
    layui.config({
        base: 'layui/extend/'
    }).extend({
        treeGrid:'treeGrid'
    }).use(['jquery','treeGrid','layer'], function(){
        var $=layui.jquery;
        treeGrid = layui.treeGrid;//很重要
        layer=layui.layer;
        
        var dataify = null;
        $.ajax({
        	type:'post',
        	async:false,
        	url:'<%=path %>/queryWarehouse.htm',
        	success:function(data){
        		dataify = JSON.parse(data).data;
        	},
        	error:function(){
        		layer.confirm('库存读取失败！', {icon: 5});
        	}
        });
        
        ptable=treeGrid.render({
            id:tableId
            ,elem: '#'+tableId
            ,idField:'code'
            ,data:dataify
            ,cellMinWidth: 100
            ,treeId:'code'//树形id字段名称
            ,treeUpId:'pcode'//树形父id字段名称
            ,treeShowName:'name'//以树形式显示的字段
            ,cols: [[
                 {type:'radio', sort:true}
                ,{field:'name', edit:'text',width:150, title: '库存项名称'}
                ,{field:'code',width:80, title: '编号',sort:true}
                ,{field: 'aap102',width:75, title:'数量',sort:true}
                ,{field: 'aap104',width:75, title:'单位',sort:true}
                ,{field: 'aap105',width:75, title:'单价',sort:true}
                ,{field: 'aap103',width:150,title:'备注'}
                ,{width:80,align:'center', title:'查看'
                	,templet:function(d){
                		var html = '';
                		var queryBtn = '<a class="layui-btn layui-btn-xs" lay-event="query">查看[修改]</a>';
                		return queryBtn;
                	}
                }
                ,{width:100,title: '操作', align:'center'/*toolbar: '#barDemo'*/
                    ,templet: function(d){
	                    var html='';
	                    var addBtn='<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="add">添加</a>';
	                    var delBtn='<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>';
	                    return addBtn+delBtn;
                	}
                }
            ]]
            ,page:true
            ,parseData:function (res) {//数据加载后回调
                return res;
            }
            ,onClickRow:function (index, o) {
                console.log(index,o,"单击！");
            }
            ,onDblClickRow:function (index, o) {
                console.log(index,o,"双击");
            }
            ,onCheck:function (obj,checked,isAll) {//复选事件
                console.log(obj,checked,isAll,"复选");
                msg("复选,按F12，在控制台查看详细参数！");
            }
            ,onRadio:function (obj) {//单选事件
                console.log(obj,"单选");
                msg("单选,按F12，在控制台查看详细参数！");
            }
        });

        treeGrid.on('tool('+tableId+')',function (obj) {
            if(obj.event === 'del'){//删除行
                del(obj);
            }else if(obj.event==="add"){//添加行
                add(obj.data);
            }else if(obj.event==="query"){
            	query(obj.data);
            }else if(obj.event==="modify"){
            	modify(obj.data);
            }
        });
    });

    function del(obj) {
    	var aap101 = obj.data.aap101;
    	var pcode = obj.data.code;
        layer.confirm("你确定删除数据吗？如果存在下级节点则一并删除，此操作不能撤销！", {icon: 3, title:'提示'},
            function(index){//确定回调
        		$.ajax({
        			type:'post',
        			url:'<%=path%>/delWarehouse.htm',
        			data:{'aap101':aap101, 'pcode':pcode, 'aap102': '0'},
        			success:function(data){
        				if(JSON.parse(data).msg == '1')
        				{
        	                obj.del();
        					layer.msg("删除成功!");
        				}
        				else
        					layer.msg("删除失败！删除前请清空库存或者删除其所有子节点！");
        			},
        			error:function(data){
						layer.msg("删除失败！删除前请清空库存或者删除其所有子节点！");
        			}
        		});
                layer.close(index);
            },function (index) {//取消回调
               layer.close(index);
            }
        );
    }

    function modify(pObj){
    	
    }

    function query(pObj){
    	var aap101 = pObj.aap101;
    	layer.open({
    		type:2,
    		shade:0.8,
    		area:['630px','300px'], //弹出层宽高
			title:'库存项信息',
			content: ['<%=path%>/FindByIdWarehouse.html?aap101=' + aap101,'no'],
			btn:['修改信息', '返回'],
			yes:function(index, layero){
				layer.close(index);
		    	var newsFrom = layer.getChildFrame('#myform', index);
			      //ajax提交
			      var params = newsFrom.serialize(); // http request parameters. 
				  params = encodeURI(params);
			      $.ajax({
						type: "POST",
						dataType: "json",
						url: "<%=path%>/modifyItem.htm",
						data: params,
						success: function(result) {
							layer.msg('保存成功！');
							location.reload();
						},
						error: function() {
							layer.msg("保存失败！");
						}
					});
			}
    	});
    }
   //添加仓库项
    function add(pObj) {
        var pcode = pObj.code;
        $.ajax({
        	type:"post",
        	url:"<%=path%>/addWarehouse.htm",
        	data:{'pcode': pcode},
        	success:function(data){
        		if(JSON.parse(data).msg == '1'){
        			var param =JSON.parse(data).ins;
        			treeGrid.addRow(tableId,pObj?pObj[treeGrid.config.indexName]+1:0,param);
        			layer.msg("添加成功");
        		}
        		else
        			layer.msg("添加失败");
        	},
        	error:function(data){
        	}
        });
    }

    function print() {
        console.log(treeGrid.cache[tableId]);
        var loadIndex=layer.msg("对象已打印，按F12，在控制台查看！", {
            time:3000
            ,offset: 'auto'//顶部
            ,shade: 0
        });
    }
    
    function openorclose() {
        var map=treeGrid.getDataMap(tableId);
        var o= map['102'];
        treeGrid.treeNodeOpen(o,!o[treeGrid.config.cols.isOpen]);
    }


    function openAll() {
        var treedata=treeGrid.getDataTreeList(tableId);
        treeGrid.treeOpenAll(tableId,!treedata[0][treeGrid.config.cols.isOpen]);
    }
	//多选框
    function getCheckData() {
        var checkStatus = treeGrid.checkStatus(tableId)
            ,data = checkStatus.data;
        layer.alert(JSON.stringify(data));
    }
	function openInWindow(){
        var data = treeGrid.radioStatus(tableId);
		data = JSON.stringify(data);
		data = JSON.parse(data);
		var name = encodeURI(data.name);
		var aap101 = data.aap101;
		var aap103 = encodeURI(data.aap103);
		var fix = "?name=" + name + "&aap101=" + aap101 + "&aap103=" + aap103;
		layer.open({
    		type:2,
    		shade:0.8,	
    		area:['650px','400px'], //弹出层宽高
			title:'入库单信息',
			content:'<%=path%>/addIn.jsp' + fix,
			btn:['提交入库', '返回'],
			yes:function(index, layero){
				layer.close(index);
		    	var newsFrom = layer.getChildFrame('#myform', index);
			      //ajax提交
			      var params = newsFrom.serialize(); // http request parameters. 
				  params = encodeURI(params);
			      $.ajax({
						type: "POST",
						dataType: "json",
						url: "<%=path%>/addIns.htm",
						data: params,
						success: function(result) {
							console.log(result.msg);
							if(JSON.parse(result).msg == '1'){
								layer.msg('保存成功',{offset:['50%'],time: 500},function(){location.reload();});
							}
							else
								layer.msg('保存失败！');
						},
						error: function() {
							layer.msg("保存失败！");
						}
					});
			}
    	});
	}
    //单选按钮
    function radioStatus() {
        var data = treeGrid.radioStatus(tableId)
        layer.alert(JSON.stringify(data));
    }
    function getCheckLength() {
        var checkStatus = treeGrid.checkStatus(tableId)
            ,data = checkStatus.data;
        layer.msg('选中了：'+ data.length + ' 个');
    }

    function reload() {
        treeGrid.reload(tableId,{
            page:{
                curr:1
            }
        });
    }
    
    function queryIns(){
    	window.open("<%=path%>/queryIns.jsp");
    }
    
    $('#btn-search').click(function () {
        var keyword = $('#edt-search').val();
        var searchCount = 0;
        $('#treeTable').next('.treeGrid').find('.layui-table-body tbody tr td').each(function () {
            $(this).css('background-color', 'transparent');
            var text = $(this).text();
            if (keyword != '' && text.indexOf(keyword) >= 0) {
                $(this).css('background-color', 'rgba(250,230,160,0.5)');
                if (searchCount == 0) {
                    treetable.expandAll('#treeTable');
                    $('html,body').stop(true);
                    $('html,body').animate({scrollTop: $(this).offset().top - 150}, 500);
                }
                searchCount++;
            }
        });
        if (keyword == '') {
            layer.msg("请输入搜索内容", {icon: 5});
        } else if (searchCount == 0) {
            layer.msg("没有匹配结果", {icon: 5});
        }
    });
</script>
<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?e2af8415b6ffbaeb52de4d080cb4ba85";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
${sessionScope.aak101 }
</body>
</html>