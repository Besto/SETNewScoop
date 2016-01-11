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
            <li><a href="#">การเปลี่ยนแปลงค่าหุ้นของสมาชิก</a></li>
        </ol>
    </div>
</div>

<div class="well">
    <div class="content scaffold-create" role="main">
        <h1 class="page-header">ข้อมูลการเปลี่ยนแปลงค่าหุ้น</h1>
        <g:if test="${errCode}">
            <g:set var="code" value="member.errorcode.create.${errCode}"/>
            <g:if test="${errCode=='1000'}">
                <div class="alert alert-success" role="alert">${message(code: code)}</div>
            </g:if>
            <g:else>
                <div class="alert alert-danger" role="alert">${message(code: code)}</div>
            </g:else>
        </g:if>

        <g:form class="form-horizontal" action="update" onsubmit="return validateForm();">

            <g:render template="generalForm"/>

            <br/>

            <div class="box-content">
                <h4 class="page-header">ข้อมูลการเปลี่ยนแปลงค่าหุ้น</h4>




                <div class="row">
                    <div id="d_effect_group" class="form-group has-feedback col-md-6">
                        <label class="control-label col-sm-offset-1 col-sm-5">วันที่มีผลต่อการเปลี่ยนแปลงค่าหุ้น</label>
                        <div class="col-sm-6">
                            <g:textField id="d_effect" name="d_effect" class="form-control" />
                            <label class="fa fa-calendar form-control-feedback" for="d_effect"></label>
                        </div>
                    </div>
                </div>


                <div id="change_share_group" class="form-group has-feedback">
                    <label class="control-label col-sm-3">ความประสงค์</label>
                    <div class="col-sm-3">
                        <div class="radio-button">
                            <label class="control-label">
                                <input type="radio" name="purpose" value="1"> เปลี่ยนค่าหุ้นรายเดือน (ใหม่)
                            </label>
                        </div>
                        <div class="radio-button">
                            <label class="control-label">
                                <input type="radio" name="purpose" value="2"> หยุดส่งค่าหุ้น (เนื่องจากส่งครบ 84 งวด)
                            </label>
                        </div>
                        <div class="radio-button">
                            <label class="control-label">
                                <input type="radio" name="purpose" value="3"> หยุดส่งค่าหุ้น
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="col-sm-8">
                            <input type="text" id="share" name="share" class="form-control" value="" >
                        </div>
                        <div class="col-sm-2">บาท</div>

                    </div>

                </div>

            </div>

            <div align="center">
                <g:submitButton name="update" class="btn btn-primary btn-label-left"
                                value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                <a href="./editMember" class="btn btn-primary btn-label-left" style="margin-left: 20px">${message(code: 'default.button.back.label', default: 'Back')}</a>
            </div>
        </g:form>
    </div>
</div>
<script>
    $(document).ready(function(){

        $('#d_effect').datepicker({
            setDate: new Date(),
            dateFormat : 'dd/mm/yy'
        });

    })
</script>
</body>
</html>
