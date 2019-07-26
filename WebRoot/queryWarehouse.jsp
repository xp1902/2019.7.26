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
            <legend>������</legend>
            <div class="layui-btn-group">
			    <a class="layui-btn layui-btn-primary"  onclick="reload()">���¼���</a>
			    <a class="layui-btn layui-btn-primary"  onclick="openAll();">չ�����۵�ȫ��</a>
			    <a class="layui-btn layui-btn-primary"  onclick="openInWindow();">�ύ���</a>
			    <a class="layui-btn layui-btn-primary"  onclick="queryIns();" >�鿴�������</a>
		    </div>
		    <input type="text" id="edt-search" placeholder="����ؼ���"  style="width:120px;padding-left:10px;">
		    <a class="layui-btn layui-btn-primary" id="btn-search">��ѯ</a>
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
        treeGrid = layui.treeGrid;//����Ҫ
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
        		layer.confirm('����ȡʧ�ܣ�', {icon: 5});
        	}
        });
        
        ptable=treeGrid.render({
            id:tableId
            ,elem: '#'+tableId
            ,idField:'code'
            ,data:dataify
            ,cellMinWidth: 100
            ,treeId:'code'//����id�ֶ�����
            ,treeUpId:'pcode'//���θ�id�ֶ�����
            ,treeShowName:'name'//������ʽ��ʾ���ֶ�
            ,cols: [[
                 {type:'radio', sort:true}
                ,{field:'name', edit:'text',width:150, title: '���������'}
                ,{field:'code',width:80, title: '���',sort:true}
                ,{field: 'aap102',width:75, title:'����',sort:true}
                ,{field: 'aap104',width:75, title:'��λ',sort:true}
                ,{field: 'aap105',width:75, title:'����',sort:true}
                ,{field: 'aap103',width:150,title:'��ע'}
                ,{width:80,align:'center', title:'�鿴'
                	,templet:function(d){
                		var html = '';
                		var queryBtn = '<a class="layui-btn layui-btn-xs" lay-event="query">�鿴[�޸�]</a>';
                		return queryBtn;
                	}
                }
                ,{width:100,title: '����', align:'center'/*toolbar: '#barDemo'*/
                    ,templet: function(d){
	                    var html='';
	                    var addBtn='<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="add">���</a>';
	                    var delBtn='<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">ɾ��</a>';
	                    return addBtn+delBtn;
                	}
                }
            ]]
            ,page:true
            ,parseData:function (res) {//���ݼ��غ�ص�
                return res;
            }
            ,onClickRow:function (index, o) {
                console.log(index,o,"������");
            }
            ,onDblClickRow:function (index, o) {
                console.log(index,o,"˫��");
            }
            ,onCheck:function (obj,checked,isAll) {//��ѡ�¼�
                console.log(obj,checked,isAll,"��ѡ");
                msg("��ѡ,��F12���ڿ���̨�鿴��ϸ������");
            }
            ,onRadio:function (obj) {//��ѡ�¼�
                console.log(obj,"��ѡ");
                msg("��ѡ,��F12���ڿ���̨�鿴��ϸ������");
            }
        });

        treeGrid.on('tool('+tableId+')',function (obj) {
            if(obj.event === 'del'){//ɾ����
                del(obj);
            }else if(obj.event==="add"){//�����
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
        layer.confirm("��ȷ��ɾ����������������¼��ڵ���һ��ɾ�����˲������ܳ�����", {icon: 3, title:'��ʾ'},
            function(index){//ȷ���ص�
        		$.ajax({
        			type:'post',
        			url:'<%=path%>/delWarehouse.htm',
        			data:{'aap101':aap101, 'pcode':pcode, 'aap102': '0'},
        			success:function(data){
        				if(JSON.parse(data).msg == '1')
        				{
        	                obj.del();
        					layer.msg("ɾ���ɹ�!");
        				}
        				else
        					layer.msg("ɾ��ʧ�ܣ�ɾ��ǰ����տ�����ɾ���������ӽڵ㣡");
        			},
        			error:function(data){
						layer.msg("ɾ��ʧ�ܣ�ɾ��ǰ����տ�����ɾ���������ӽڵ㣡");
        			}
        		});
                layer.close(index);
            },function (index) {//ȡ���ص�
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
    		area:['630px','300px'], //��������
			title:'�������Ϣ',
			content: ['<%=path%>/FindByIdWarehouse.html?aap101=' + aap101,'no'],
			btn:['�޸���Ϣ', '����'],
			yes:function(index, layero){
				layer.close(index);
		    	var newsFrom = layer.getChildFrame('#myform', index);
			      //ajax�ύ
			      var params = newsFrom.serialize(); // http request parameters. 
				  params = encodeURI(params);
			      $.ajax({
						type: "POST",
						dataType: "json",
						url: "<%=path%>/modifyItem.htm",
						data: params,
						success: function(result) {
							layer.msg('����ɹ���');
							location.reload();
						},
						error: function() {
							layer.msg("����ʧ�ܣ�");
						}
					});
			}
    	});
    }
   //��Ӳֿ���
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
        			layer.msg("��ӳɹ�");
        		}
        		else
        			layer.msg("���ʧ��");
        	},
        	error:function(data){
        	}
        });
    }

    function print() {
        console.log(treeGrid.cache[tableId]);
        var loadIndex=layer.msg("�����Ѵ�ӡ����F12���ڿ���̨�鿴��", {
            time:3000
            ,offset: 'auto'//����
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
	//��ѡ��
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
    		area:['650px','400px'], //��������
			title:'��ⵥ��Ϣ',
			content:'<%=path%>/addIn.jsp' + fix,
			btn:['�ύ���', '����'],
			yes:function(index, layero){
				layer.close(index);
		    	var newsFrom = layer.getChildFrame('#myform', index);
			      //ajax�ύ
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
								layer.msg('����ɹ�',{offset:['50%'],time: 500},function(){location.reload();});
							}
							else
								layer.msg('����ʧ�ܣ�');
						},
						error: function() {
							layer.msg("����ʧ�ܣ�");
						}
					});
			}
    	});
	}
    //��ѡ��ť
    function radioStatus() {
        var data = treeGrid.radioStatus(tableId)
        layer.alert(JSON.stringify(data));
    }
    function getCheckLength() {
        var checkStatus = treeGrid.checkStatus(tableId)
            ,data = checkStatus.data;
        layer.msg('ѡ���ˣ�'+ data.length + ' ��');
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
            layer.msg("��������������", {icon: 5});
        } else if (searchCount == 0) {
            layer.msg("û��ƥ����", {icon: 5});
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