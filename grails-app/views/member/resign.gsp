<%@ page import="com.setnewscoop.EnumStatus; com.setnewscoop.Member" %>
<%@ page import="com.setnewscoop.Constant" %>
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
            <li><a href="#">สมาชิกลาออก</a></li>
        </ol>
    </div>
</div>

<div class="well">
    <div class="content scaffold-create" role="main">
        <h1 class="page-header">สมาชิกลาออก</h1>
        <g:if test="${errCode}">
            <g:set var="code" value="member.errorcode.create.${errCode}"/>
            <g:if test="${errCode=='1000'}">
                <div class="alert alert-success" role="alert">${message(code: code)}</div>
            </g:if>
            <g:else>
                <div class="alert alert-danger" role="alert">${message(code: code)}</div>
            </g:else>
        </g:if>

        <g:form class="form-horizontal" action="updateShare" onsubmit="return validateForm();">

            <div class="box-content">
                <h4 class="page-header">ข้อมูลทั่วไป</h4>

                <div class="row">

                    <label class="col-sm-offset-1 col-sm-3 control-label">รหัสสมาชิกสหกรณ์</label>
                    <div class="col-sm-2">

                        <g:formatNumber number="${memberInstance?.id}" format="0000" />

                    </div>
                    <label class="col-sm-2 control-label">รหัสพนักงาน</label>
                    <div class="col-sm-2">
                        <g:formatNumber number="${memberInstance?.i_employee}" format="00000" />
                    </div>
                </div>
                <div class="row">

                    <label class="col-sm-offset-1 col-sm-3 control-label">บริษัท</label>
                    <div class="col-sm-2">

                        ${memberInstance?.n_company}

                    </div>
                    <label class="col-sm-2 control-label">ฝ่าย</label>
                    <div class="col-sm-2">
                        ${memberInstance?.e_dep}
                    </div>
                </div>
                <div class="row">

                    <label class="col-sm-offset-1 col-sm-3 control-label">วันที่เริ่มเข้าทำงาน</label>
                    <div class="col-sm-2">

                        <g:formatDate format="dd/MM/yyyy" date="${memberInstance?.d_start}"/>

                    </div>
                    <label class="col-sm-2 control-label">สถานภาพ</label>
                    <div class="col-sm-2">
                        ${message(code: 'enum.value.'+memberInstance.f_status)}
                    </div>
                </div>
                <div class="row">

                    <label class="col-sm-offset-1 col-sm-3 control-label">คำนำหน้า</label>
                    <div class="col-sm-2">
                        ${memberInstance?.n_title}
                    </div>
                </div>
                <div class="row">
                    <label class="col-sm-offset-1 col-sm-3 control-label">ชื่อ</label>
                    <div class="col-sm-2">
                        ${memberInstance?.n_first}
                    </div>

                    <label class="col-sm-2 control-label">นามสกุล</label>
                    <div class="col-sm-2">
                        ${memberInstance?.n_last}
                    </div>
                </div>
                <div class="row">
                    <label class="col-sm-offset-1 col-sm-3 control-label">เบอร์โทรศัพท์ (บ้าน)</label>
                    <div class="col-sm-2">
                        ${memberInstance?.e_tel}
                    </div>

                    <label class="col-sm-2 control-label">เบอร์มือถือ</label>
                    <div class="col-sm-2">
                        ${memberInstance?.e_mobile}
                    </div>
                </div>
                <div class="row">
                    <label class="col-sm-offset-1 col-sm-3 control-label">เบอร์โทรศัพท์ (ที่ทำงาน)</label>
                    <div class="col-sm-2">
                        ${memberInstance?.e_off_tel}
                    </div>

                    <label class="col-sm-2 control-label">อีเมล์</label>
                    <div class="col-sm-2">
                        ${memberInstance?.e_mail}
                    </div>
                </div>

            </div>

            <br/>

            <div class="box-content">
               <h4 class="page-header">ข้อมูลค่าหุ้น/เงินฝาก</h4>

                <div class="row">
                    <label class="col-sm-offset-1 col-sm-3 control-label">วันที่เป็นสมาชิกสหกรณ์</label>
                    <div class="col-sm-2">
                        <g:formatDate format="dd/MM/yyyy" date="${memberInstance?.d_member}"/>
                    </div>
                </div>
                <div class="row">
                    <label class="col-sm-offset-1 col-sm-3 control-label">ค่าหุ้นรายเดือน (เดือนละ)</label>
                    <div class="col-sm-2">
                        <g:formatNumber number="${memberInstance?.m_share}" format="#,###,###.00" /> บาท
                    </div>
                    <label class="col-sm-2 control-label">คิดเป็นมูลค่า</label>
                    <div class="col-sm-2">
                        <g:formatNumber number="${memberInstance?.m_share/Constant.SHARED}" format="#,###,###" /> หุ้น
                    </div>
                </div>
                <div class="row">

                    <label class="col-sm-offset-1 col-sm-3 control-label">ค่าหุ้นสะสม</label>
                    <div class="col-sm-2">
                        <g:formatNumber number="${memberInstance?.m_tot_share}" format="#,###,##0.00"/> บาท
                    </div>

                    <label class="col-sm-2 control-label">คิดเป็นมูลค่า</label>
                    <div class="col-sm-2">
                        <g:formatNumber number="${memberInstance?.m_tot_share/Constant.SHARED}" format="#,###,###" /> หุ้น
                    </div>
                </div>
                <div class="row">
                    <label class="col-sm-offset-1 col-sm-3 control-label">เงินฝากออมทรัพย์พิเศษ-อุดมทรัพย์</label>
                    <div class="col-sm-2">
                        xxxxx บาท
                    </div>
                </div>


            </div>

            <br/>

            <div class="box-content">
                <h4 class="page-header">ข้อมูลเงินกู้</h4>

                <table class="table m-table table-bordered table-hover table-heading" id="ticker-table">
                    <thead>
                    <tr>
                        <th></th>
                        <th>เลขที่สัญญา</th>
                        <th>ยอดเงินกู้ (บาท)</th>
                        <th>ยอดรวมเงินกู้ที่ส่งคืน (บาท)</th>
                        <th>คงเหลือ (บาท)</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${listRow1}" var="rows">
                        <tr>
                            <td>${rows.NAME}</td>
                            <td>${rows.s_trans}</td>
                            <td><g:formatNumber number="${rows.m_loan}" format="#,###,###.00" /></td>
                            <td><g:formatNumber number="${rows.m_tot_return}" format="#,###,###.00" /></td>
                            <td><g:formatNumber number="${rows.balance}" format="#,###,###.00" /></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>

                <div class="box-content">
                    <h4 class="page-header">ข้อมูลผู้ค้ำประกันสัญญาเงินกู้ประเภทต่างๆ</h4>

                    <table class="table m-table table-bordered table-hover table-heading" id="ticker-table">
                        <thead>
                        <tr>
                            <th>ลำดับ</th>
                            <th>หมายเลขสมาชิกสหกรณ์</th>
                            <th>ชื่อ-นามสกุลสมาชิก</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${listRow2}" var="rows">
                            <tr>
                                <td><g:formatNumber number="${rows.num}" format="###,###" /></td>
                                <td>${rows.i_member}</td>
                                <td>${rows.n_title}${rows.n_first}&nbsp;${rows.n_last}</td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>



                </div>

            </div>

            <br/>

            <div class="box-content">
                <h4 class="page-header">ข้อมูลรายการที่ค้ำประกันให้กับสมาชิกอืน</h4>

                <table class="table m-table table-bordered table-hover table-heading" id="ticker-table">
                    <thead>
                    <tr>
                        <th>เลขที่สัญญาเงินกู้</th>
                        <th>หมายเลขสมาชิกสหกรณ์</th>
                        <th>ชื่อ-นามสกุลสมาชิก</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${listRow3}" var="rows">
                    <tr>
                        <td>${rows.s_trans}</td>
                        <td>${rows.i_member}</td>
                        <td>${rows.n_title}${rows.n_first}&nbsp;${rows.n_last}</td>
                    </tr>
                    </g:each>
                    </tbody>
                </table>



            </div>
            <br/>
            <div align="center">
                <g:submitButton name="update" class="btn btn-primary btn-label-left"
                                value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                <a href="./changeSharedMember" class="btn btn-primary btn-label-left" style="margin-left: 20px">${message(code: 'default.button.back.label', default: 'Back')}</a>
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
