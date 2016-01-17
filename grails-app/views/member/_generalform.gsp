<%@ page import="com.setnewscoop.Constant" %>
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
        <label class="col-sm-offset-1 col-sm-3 control-label">ชื่อสมาชิกสหกรณ์</label>
        <div class="col-sm-3">
            ${memberInstance?.n_title}${memberInstance?.n_first}&nbsp;${memberInstance?.n_last}
        </div>
    </div>
    <div class="row">
            <label class="col-sm-offset-1 col-sm-3 control-label">วันที่เป็นสมาชิกสหกรณ์</label>
            <div class="col-sm-3">
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

</div>
