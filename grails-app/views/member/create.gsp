<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'member.label', default: 'Member')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div class="row">
    <div id="breadcrumb" class="col-md-12">
        <ol class="breadcrumb">
            <li><g:link class="list" action="">ข้อมูลสมาชิกสหกรณ์</g:link></li>
            <li><a href="#">เพิ่มข้อมูลสมาชิกสหกรณ์</a></li>
        </ol>
    </div>
</div>
<div class="well">
    <div class="content scaffold-create" role="main">
        <h1 class="page-header">เพิ่มข้อมูลสมาชิกสหกรณ์</h1>
        <g:form class="form-horizontal">

            <g:render template="form"/>

            <div align="center">
                <g:submitButton name="create" class="btn btn-primary btn-label-left"
                                value="${message(code: 'default.button.create.label', default: 'Create')}"/>
            </div>
        </g:form>
    </div>
</div>
</body>
</html>
