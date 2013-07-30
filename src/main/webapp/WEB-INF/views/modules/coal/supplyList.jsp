<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>供方管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        function page(n,s){
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/coal/supply/">供方列表</a></li>
    <shiro:hasPermission name="coal:supply:edit"><li><a href="${ctx}/coal/supply/form">供方添加</a></li></shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="supply" action="${ctx}/coal/supply/" method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    &nbsp;&nbsp;<label>供方名称 ：</label><form:input path="supplyName" htmlEscape="false" maxlength="200" class="input-medium"/>
    &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
</form:form>
<tags:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered ">
    <thead><tr><th>供方编码</th><th>供方名称</th><shiro:hasPermission name="coal:supply:edit"><th>操作</th></shiro:hasPermission></tr></thead>
    <tbody>
    <c:forEach items="${page.list}" var="supply">
        <tr>
            <td><a href="${ctx}/coal/supply/form?id=${supply.supplyId}">${supply.supplyId}</a></td>
            <td>${supply.supplyName}</td>
            <shiro:hasPermission name="coal:supply:edit"><td>
                <a href="${ctx}/coal/supply/form?id=${supply.supplyId}">修改</a>
                <a href="${ctx}/coal/supply/delete?id=${supply.supplyId}" onclick="return confirmx('确认要删除该供方吗？', this.href)">删除</a>
            </td></shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>
