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
        Layui树形表格treetable -
        <small><a href="https://gitee.com/whvse/treetable-lay" target="_blank">项目地址</a></small>
    </h1>
    <br>
    <div class="layui-btn-group">
        <button class="layui-btn" id="btn-expand">全部展开</button>
        <button class="layui-btn" id="btn-fold">全部折叠</button>
        <button class="layui-btn" id="btn-refresh">刷新表格</button>
    </div>
    &nbsp;
    <div class="layui-btn-group">
        <a class="layui-btn layui-btn-normal" href="menu.html">菜单管理</a>
        <a class="layui-btn layui-btn-normal" href="test.html">深度测试</a>
        <a class="layui-btn layui-btn-normal" href="test2.html">自定义图标</a>
        <a class="layui-btn layui-btn-normal" href="test3.html">多表格</a>
        <a class="layui-btn layui-btn-normal" href="test5.html">搜索功能</a>
    </div>
    &emsp;
    <a class="layui-btn layui-btn-primary" href="https://whvse.gitee.io/treetable/" target="_blank">BOM树形表格</a>

    <table id="table1" class="layui-table" lay-filter="table1"></table>
    
    <h3>
        推荐：<a href="https://easyweb.vip/" target="_blank">EasyWeb管理系统模板</a>
    </h3>
</div>
<!-- 操作列 -->
<script type="text/html" id="oper-col">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
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

    // 渲染表格
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
            {field: 'authorityName', minWidth: 200, title: '权限名称'},
            {field: 'authority', title: '权限标识'},
            {field: 'menuUrl', title: '菜单url'},
            {
                field: 'isMenu', width: 80, align: 'center', templet: function (d) {
                    if (d.isMenu == 1) {
                        return '<span class="layui-badge layui-bg-gray">按钮</span>';
                    }
                    if (d.parentId == -1) {
                        return '<span class="layui-badge layui-bg-blue">目录</span>';
                    } else {
                        return '<span class="layui-badge-rim">菜单</span>';
                    }
                }, title: '类型'
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
            layer.msg("请输入搜索内容", {icon: 5});
        } else if (searchCount == 0) {
            layer.msg("没有匹配结果", {icon: 5});
        }
    });
});
</script>
</body>
</html>