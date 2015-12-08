<%@ page import="com.setnewscoop.Constant" %>
<div class="box-content">
    <h4 class="page-header">ข้อมูลทั่วไป</h4>

    <div class="row">
        <div class="form-group col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">รหัสสมาชิกสหกรณ์</label>
            <div class="col-sm-7">
                <label class="control-label">${memberId}</label>
            </div>
        </div>
        <div id="i_employee_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">รหัสพนักงาน</label>
            <div class="col-sm-7">
                <g:textField id="i_employee" class="form-control" name="i_employee" value="${memberInstance?.i_employee}"/>
            </div>
        </div>
    </div>
    <div class="row">
        <div id="n_company_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">บริษัท</label>
            <div class="col-sm-7">
                <g:select id="n_company" class="form-control" name="n_company" from="${Constant.COMPANY}" value="${memberInsatnce?.n_company}" noSelection="['':'-โปรดระบุ-']"/>
            </div>
        </div>
        <div class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">ฝ่าย</label>
            <div class="col-sm-7">
                <g:textField id="e_dep" class="form-control" name="e_dep" value="${memberInstance?.e_dep}"/>
            </div>
        </div>
    </div>
    <div class="row">
        <div id="d_start_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">วันที่เริ่มเข้าทำงาน</label>
            <div class="col-sm-6">
                <g:textField id="d_start" name="d_start" class="form-control" value="${memberInstance?.d_start}"/>
                <label class="fa fa-calendar form-control-feedback" for="d_start"></label>
            </div>
        </div>
        <div id="_f_status_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">สถานภาพ</label>
            <div class="col-sm-7">
                <g:select id="_f_status" class="form-control" name="_f_status" from="${Constant.MEMBER_STATUS}" value="${memberInstance?.f_status}" noSelection="['':'-โปรดระบุ-']"/>
            </div>
        </div>
    </div>

    <div class="row">
        <div id="n_title_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">คำนำหน้า</label>
            <div class="col-sm-4">
                <g:select id="n_title" name="n_title"  class="form-control" from="${Constant.MEMBER_TITLE}" value="${memberInstance?.n_title}" noSelection="['':'-โปรดระบุ-']"/>
            </div>
            <div id="titleText" class="col-sm-3">

            </div>
        </div>
    </div>

    <div class="row">
        <div id="n_first_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">ชื่อ</label>
            <div class="col-sm-7">
                <g:textField id="n_first" class="form-control" name="n_first" value="${memberInstance?.n_first}"/>
            </div>
        </div>
        <div id="n_last_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">นามสกุล</label>
            <div class="col-sm-7">
                <g:textField id="n_last" class="form-control" name="n_last" value="${memberInstance?.n_last}"/>
            </div>
        </div>

    </div>

    <div class="row">
        <div class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">เบอร์โทรศัพท์ (บ้าน)</label>
            <div class="col-sm-7">
                <g:textField id="e_tel" class="form-control" name="e_tel" value="${memberInstance?.e_tel}"/>
            </div>
        </div>
        <div id="e_mobile_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">เบอร์มือถือ</label>
            <div class="col-sm-7">
                <g:textField id="e_mobile" class="form-control" name="e_mobile" value="${memberInstance?.e_mobile}"/>
            </div>
        </div>

    </div>


    <div class="row">
        <div class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">เบอร์โทรศัพท์ (ที่ทำงาน)</label>
            <div class="col-sm-7">
                <g:textField id="e_off_tel" class="form-control" name="e_off_tel" value="${memberInstance?.e_off_tel}"/>
            </div>
        </div>
        <div id="e_mail_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">อีเมล์</label>
            <div class="col-sm-7">
                <g:textField id="e_mail" class="form-control" name="e_mail" value="${memberInstance?.e_mail}"/>
            </div>
        </div>

    </div>

</div>

<br/>

<div class="box-content">
    <h4 class="page-header">ข้อมูลการสมัครเป็นสมาชิกสหกรณ์</h4>
    <div class="row">
        <div id="d_member_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">วันที่สมัครเป็นสมาชิกสหกรณ์</label>
            <div class="col-sm-6">
                <g:textField id="d_member" name="d_member" class="form-control" value="${memberInstance?.d_member}"/>
                <label class="fa fa-calendar form-control-feedback" for="d_member"></label>
            </div>
        </div>
    </div>
    <div class="row">
        <div id="m_share_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">ค่าหุ้นรายเดือน (เดือนละ)</label>
            <div class="col-sm-6">
                <g:textField id="m_share" class="form-control" name="m_share" value="${memberInstance?.m_share}"/>
            </div>
            <div class="col-sm-1">
                บาท
            </div>
        </div>
        <div class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">คิดเป็นมูลค่าหุ้น</label>
            <div class="col-sm-7">
                <label id="sharedAmount" class="control-label">0 หุ้น</label>
            </div>
        </div>
    </div>
</div>
<br/>


<script>

    $(document).ready(function(){
        $('#d_start').datepicker({
            setDate: new Date(),
            dateFormat : 'dd/mm/yy'
        });

        $('#d_member').datepicker({
            setDate: new Date(),
            dateFormat : 'dd/mm/yy'
        });

        $("#n_title").change(function(){
            if($('#n_title').val()=="อื่นๆ"){
                $("#titleText").append('<input type="text" name="title_other" id="title_other" class="form-control" value="${memberInstance?.title_other}"/>');
            }else{

                $("#title_other").remove();
            }
        });


    })

    $('#m_share').keyup(function(){
        /*
        if(event.which >= 37 && event.which <= 40){
            event.preventDefault();
        }

        $(this).val(function(index, value) {
            return value
                    .replace(/\D/g, "")
                    .replace(/([0-9])([0-9]{2})$/, '$1.$2')
                    .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",")
                    ;
        });*/

        var moneyShared = $('#m_share').val();
        var shared = '${Constant.SHARED}';
        $('#sharedAmount').html(moneyShared/shared + ' หุ้น');
    });


    function validateForm(){
        var validateFlag = true;
        var result;
         result = validateField("i_employee",'number',true);
         validateFlag = validateFlag && result;
         result = validateField("n_company",'',true);
         validateFlag = validateFlag && result;
         result = validateField("d_start",'',true);
         validateFlag = validateFlag && result;
         result = validateField("_f_status",'',true);
         validateFlag = validateFlag && result;
         result = validateField("n_title",'',true);
         validateFlag = validateFlag && result;
         result = validateField("n_first",'',true);
         validateFlag = validateFlag && result;
         result = validateField("n_last",'',true);
         validateFlag = validateFlag && result;
         result = validateField("e_mobile",'',true);
         validateFlag = validateFlag && result;
         result = validateField("e_mail",'',true);
         validateFlag = validateFlag && result;
         result = validateField("d_member",'',true);
         validateFlag = validateFlag && result;
         result = validateField("m_share",'',true);
         validateFlag = validateFlag && result;
        return validateFlag;
    }

</script>