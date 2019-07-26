<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>tree-table</title>
    <link rel="stylesheet" href="assets/layui/css/layui.css">
    <link rel="stylesheet" href="assets/common.css"/>
</head>
<body>
<div class="layui-container layui-text">
    <br>
    <h1>
        Layui���α��treetable -
        <small><a href="https://gitee.com/whvse/treetable-lay" target="_blank">��Ŀ��ַ</a></small>
    </h1>
    <br>
    <div class="layui-btn-group">
        <button class="layui-btn" id="btn-expand">ȫ��չ��</button>
        <button class="layui-btn" id="btn-fold">ȫ���۵�</button>
        <button class="layui-btn" id="btn-refresh">ˢ�±��</button>
    </div>
    &nbsp;
    <div class="layui-btn-group">
        <a class="layui-btn layui-btn-normal" href="menu.html">�˵�����</a>
        <a class="layui-btn layui-btn-normal" href="test.html">��Ȳ���</a>
        <a class="layui-btn layui-btn-normal" href="test2.html">�Զ���ͼ��</a>
        <a class="layui-btn layui-btn-normal" href="test3.html">����</a>
        <a class="layui-btn layui-btn-normal" href="test5.html">��������</a>
    </div>
    &emsp;
    <a class="layui-btn layui-btn-primary" href="https://whvse.gitee.io/treetable/" target="_blank">BOM���α��</a>

    <table id="table1" class="layui-table" lay-filter="table1"></table>
    
    <h3>
        �Ƽ���<a href="https://easyweb.vip/" target="_blank">EasyWeb����ϵͳģ��</a>
    </h3>
</div>
<!-- ������ -->
<script type="text/html" id="oper-col">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">�޸�</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">ɾ��</a>
</script>

<script src="assets/layui/layui.js"></script>
<script>

layui.config({
    base: 'module/'
}).extend({
    treetable: 'treetable-lay/treetable'
}).use(['table', 'treetable'], function () {
    var $ = layui.jquery;
    var table = layui.table;
    var treetable = layui.treetable;

    // ��Ⱦ���
    layer.load(2);
    treetable.render({
        treeColIndex: 1,
        treeSpid: -1,
        treeIdName: 'authorityId',
        treePidName: 'parentId',
        elem: '#auth-table',
        url: 'json/menus.json',
        page: false,
        cols: [[
            {type: 'numbers'},
            {field: 'authorityName', minWidth: 200, title: 'Ȩ������'},
            {field: 'authority', title: 'Ȩ�ޱ�ʶ'},
            {field: 'menuUrl', title: '�˵�url'},
            {
                field: 'isMenu', width: 80, align: 'center', templet: function (d) {
                    if (d.isMenu == 1) {
                        return '<span class="layui-badge layui-bg-gray">��ť</span>';
                    }
                    if (d.parentId == -1) {
                        return '<span class="layui-badge layui-bg-blue">Ŀ¼</span>';
                    } else {
                        return '<span class="layui-badge-rim">�˵�</span>';
                    }
                }, title: '����'
            }
        ]],
        done: function () {
            layer.closeAll('loading');
        }
    });

    $('#btn-expand').click(function () {
        treetable.expandAll('#auth-table');
    });

    $('#btn-fold').click(function () {
        treetable.foldAll('#auth-table');
    });

    $('#btn-search').click(function () {
        var keyword = $('#edt-search').val();
        var searchCount = 0;
        $('#auth-table').next('.treeTable').find('.layui-table-body tbody tr td').each(function () {
            $(this).css('background-color', 'transparent');
            var text = $(this).text();
            if (keyword != '' && text.indexOf(keyword) >= 0) {
                $(this).css('background-color', 'rgba(250,230,160,0.5)');
                if (searchCount == 0) {
                    treetable.expandAll('#auth-table');
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
});
</script>
</body>
</html>