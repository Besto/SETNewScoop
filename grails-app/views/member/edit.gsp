<%@ page import="com.setnewscoop.Member" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'member.label', default: 'Member')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<div class="row">
    <div id="breadcrumb" class="col-md-12">
        <ol class="breadcrumb">
            <li><g:link class="list" action="">ข้อมูลสมาชิกสหกรณ์</g:link></li>
            <li><a href="#">แก้ไขข้อมูลสมาชิกสหกรณ์</a></li>
        </ol>
    </div>
</div>

<div class="well">
    <div class="content scaffold-create" role="main">
        <h1 class="page-header">แก้ไขข้อมูลสมาชิกสหกรณ์</h1>
        <g:if test="${errCode}">
            <g:set var="code" value="member.errorcode.create.${errCode}"/>
            <g:if test="${errCode=='1000'}">
                <div class="alert alert-success" role="alert">${message(code: code)}</div>
            </g:if>
            <g:else>
                <div class="alert alert-danger" role="alert">${message(code: code)}</div>
            </g:else>
        </g:if>

        <g:form class="form-horizontal" action="update" onsubmit="return validateFormEdit();">

            <g:render template="form"/>

            <div align="center">
                <g:submitButton name="update" class="btn btn-primary btn-label-left"
                                value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                <a href="./editMember" class="btn btn-primary btn-label-left" style="margin-left: 20px">${message(code: 'default.button.back.label', default: 'Back')}</a>
            </div>
        </g:form>
    </div>
</div>
</body>
</html>
