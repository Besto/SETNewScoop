<div class="box-content">
    <h4 class="page-header">ข้อมูลทั่วไป</h4>

    <div class="row">
        <div class="form-group col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">รหัสสมาชิกสหกรณ์</label>
            <div class="col-sm-7">
                <label class="control-label">0000</label>
            </div>
        </div>
        <div id="memberCode_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">รหัสพนักงาน</label>
            <div class="col-sm-7">
                <g:textField id="memberCode" class="form-control" name="memberCode" value=""/>
            </div>
        </div>
    </div>
    <div class="row">
        <div id="company_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">บริษัท</label>
            <div class="col-sm-7">
                <g:select id="company" class="form-control" name="company" from="${Constant.COMPANY}" value="" noSelection="['':'-โปรดระบุ-']"/>
            </div>
        </div>
        <div id="dept_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">ฝ่าย</label>
            <div class="col-sm-7">
                <g:textField id="dept" class="form-control" name="dept" value=""/>
            </div>
        </div>
    </div>
    <div class="row">
        <div id="d_startWork_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">วันที่เริ่มเข้าทำงาน</label>
            <div class="col-sm-6">
                <g:textField id="d_startWork" name="startWorkDate" class="form-control"/>
                <label class="fa fa-calendar form-control-feedback" for="d_startWork"></label>
            </div>
        </div>
        <div id="memberStatus_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">สถานภาพ</label>
            <div class="col-sm-7">
                <g:select id="memberStatus" class="form-control" name="memberStatus" from="${Constant.MEMBER_STATUS}" value="" noSelection="['':'-โปรดระบุ-']"/>
            </div>
        </div>
    </div>

    <div class="row">
        <div id="title_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">คำนำหน้า</label>
            <div class="col-sm-4">
                <g:select id="title" name="title"  class="form-control" from="${Constant.MEMBER_TITLE}" value="" noSelection="['':'-โปรดระบุ-']"/>
            </div>
            <div id="titleText" class="col-sm-3">

            </div>
        </div>
    </div>

    <div class="row">
        <div id="name_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">ชื่อ</label>
            <div class="col-sm-7">
                <g:textField id="name" class="form-control" name="name" value=""/>
            </div>
        </div>
        <div id="lastname_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">นามสกุล</label>
            <div class="col-sm-7">
                <g:textField id="lastname" class="form-control" name="lastname" value=""/>
            </div>
        </div>

    </div>

    <div class="row">
        <div id="home_tel_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">เบอร์โทรศัพท์ (บ้าน)</label>
            <div class="col-sm-7">
                <g:textField id="home_tel" class="form-control" name="home_tel" value=""/>
            </div>
        </div>
        <div id="mobile_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">เบอร์มือถือ</label>
            <div class="col-sm-7">
                <g:textField id="mobile" class="form-control" name="e_tel" value=""/>
            </div>
        </div>

    </div>


    <div class="row">
        <div id="hometel_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">เบอร์โทรศัพท์ (ที่ทำงาน)</label>
            <div class="col-sm-7">
                <g:textField id="hometel" class="form-control" name="home_tel" value=""/>
            </div>
        </div>
        <div id="mail_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">อีเมล์</label>
            <div class="col-sm-7">
                <g:textField id="mail" class="form-control" name="mail" value=""/>
            </div>
        </div>

    </div>

</div>

<br/>

<div class="box-content">
    <h4 class="page-header">ข้อมูลการสมัครเป็นสมาชิกสหกรณ์</h4>
    <div class="row">
        <div id="d_regis_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">วันที่สมัครเป็นสมาชิกสหกรณ์</label>
            <div class="col-sm-6">
                <g:textField id="d_regis" name="d_regis" class="form-control"/>
                <label class="fa fa-calendar form-control-feedback" for="d_regis"></label>
            </div>
        </div>
    </div>
    <div class="row">
        <div id="moneyShared_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">ค่าหุ้นรายเดือน (เดือนละ)</label>
            <div class="col-sm-6">
                <g:textField id="moneyShared" class="form-control" name="moneyShared" value=""/>
            </div>
            <div class="col-sm-1">
                บาท
            </div>
        </div>
        <div id="" class="form-group has-feedback col-md-6">
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
        $('#d_startWork').datepicker({
            setDate: new Date(),
            dateFormat : 'dd/mm/yy'
        });

        $('#d_regis').datepicker({
            setDate: new Date(),
            dateFormat : 'dd/mm/yy'
        });

        $("#title").change(function(){
            if($('#title').val()=="อื่นๆ"){
                $("#titleText").append('<input type="text" name="titleOther" id="titleOther" class="form-control"/>');
            }else{

                $("#titleOther").remove();
            }
        });


    })

    $('#moneyShared').keyup(function(){

        if(event.which >= 37 && event.which <= 40){
            event.preventDefault();
        }

        $(this).val(function(index, value) {
            return value
                    .replace(/\D/g, "")
                    .replace(/([0-9])([0-9]{2})$/, '$1.$2')
                    .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",")
                    ;
        });

        var moneyShared = $('#moneyShared').val();
        var shared = '${Constant.SHARED}';
        $('#sharedAmount').html(moneyShared/shared + ' หุ้น');
    });

</script>