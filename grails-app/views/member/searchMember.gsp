<%--
  Created by IntelliJ IDEA.
  User: Oz
  Date: 12/8/2015
  Time: 8:25 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'member.label', default: 'Member')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
    <g:if test="${type=='edit'}">
        <g:set var="action" value="editMember"/>
        <g:set var="labelPage" value="แก้ไขข้อมูลสมาชิกสหกรณ์"/>
    </g:if>
    <g:elseif test="${type=='resign'}" >
        <g:set var="action" value="resignMember"/>
        <g:set var="labelPage" value="สมาชิกลาออก"/>
    </g:elseif>
    <g:elseif test="${type=='changeShared'}" >
        <g:set var="action" value="changeSharedMember"/>
        <g:set var="labelPage" value="การเปลี่ยนแปลงค่าหุ้นของสมาชิก"/>
    </g:elseif>
    <div class="row">
        <div id="breadcrumb" class="col-md-12">
            <ol class="breadcrumb">
                <li><g:link class="list">ข้อมูลสมาชิกสหกรณ์</g:link></li>
                <li><a href="#">${labelPage}</a></li>
            </ol>
        </div>
    </div>
    <div class="well">
        <h1 class="page-header">${labelPage}</h1>
        <div>
            <p align="center" class="lead">ค้นหาข้อมูลสมาชิก</p>
            <g:if test="${errCode}">
                <g:set var="code" value="member.errorcode.create.${errCode}"/>
                <g:if test="${errCode=='1000'}">
                    <div class="alert alert-success" role="alert">${message(code: code)}</div>
                </g:if>
                <g:else>
                    <div class="alert alert-danger" role="alert">${message(code: code)}</div>
                </g:else>
            </g:if>
            <g:form action="${action}" class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-offset-1 col-sm-2 control-label">รหัสสมาชิกสหกรณ์</label>
                    <div class="col-sm-3">
                        <g:textField class="form-control" name="id_member" value=""/>
                    </div>
                    <label class="col-sm-2 control-label">รหัสพนักงาน</label>
                    <div class="col-sm-3">
                        <g:textField class="form-control" name="id_employee" value=""/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-1 col-sm-2 control-label">ชื่อ</label>
                    <div class="col-sm-3">
                        <g:textField class="form-control" name="first_name" value=""/>
                    </div>
                    <label class="col-sm-2 control-label">นามสกุล</label>
                    <div class="col-sm-3">
                        <g:textField class="form-control" name="last_name" value=""/>
                    </div>
                </div>
                <div class="col-sm-offset-6">
                    <g:submitButton name="submit" class="btn btn-primary btn-label-left" value="Submit" />
                </div>
            </g:form>
        </div>
        <br>
        <g:if test="${members}">
            <div>
                <table class="table table-striped table-bordered table-hover table-heading no-border-bottom">
                    <thead>
                    <tr>
                        <th class="col-md-3">รหัสสมาชิกสหกรณ์</th>
                        <th class="col-md-2">รหัสพนักงาน</th>
                        <th class="col-md-2">ชื่อ</th>
                        <th class="col-md-3">นามสกุล</th>
                        <th class="col-md-2"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${members}" var="member">
                        <tr>
                            <td>${member.id}</td>
                            <td>${member.i_employee}</td>
                            <td>${member.n_first}</td>
                            <td>${member.n_last}</td>
                            <td>
                                <g:if test="${type=='edit'}">
                                    <a class="btn btn-warning" href="./edit?id_member=${member.id}">แก้ไข</a>&nbsp;&nbsp;
                                </g:if>
                                <g:elseif test="${type=='resign'}" >
                                    <a class="btn btn-warning" href="./edit?id_member=${member.id}">แก้ไข</a>&nbsp;&nbsp;
                                </g:elseif>
                                <g:elseif test="${type=='changeShared'}" >
                                    <a class="btn btn-warning" href="./changeShared?id_member=${member.id}">แก้ไข</a>&nbsp;&nbsp;
                                </g:elseif>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </g:if>
    </div>

</body>
</html>