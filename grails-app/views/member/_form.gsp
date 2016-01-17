<%@ page import="com.setnewscoop.Constant" %>
<%@ page import="com.setnewscoop.EnumCompany" %>
<%@ page import="com.setnewscoop.EnumStatus" %>
<%@ page import="com.setnewscoop.EnumTitle" %>
<div class="box-content">
    <h4 class="page-header">ข้อมูลทั่วไป</h4>

    <div class="row">
        <div class="form-group col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">รหัสสมาชิกสหกรณ์</label>
            <div class="col-sm-7">
                <label class="control-label">${memberId}</label>
                <g:hiddenField name="memberId" value="${memberId}"/>
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
                %{--<g:select id="n_company" class="form-control" name="n_company" from="${Constant.COMPANY}" value="${memberInstance?.n_company}" noSelection="['':'-โปรดระบุ-']"/>--}%
                <g:select id="n_company" class="form-control" name="n_company" from="${EnumCompany.values()}" value="${memberInstance?.n_company}" optionKey="key" noSelection="['':'-โปรดระบุ-']"/>
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
                <g:textField id="d_start" name="d_start" class="form-control" value="${formatDate(format:'dd/MM/yyyy',date:memberInstance?.d_start)}"/>
                <label class="fa fa-calendar form-control-feedback" for="d_start"></label>
            </div>
        </div>
        <div id="f_status_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">สถานภาพ</label>
            <div class="col-sm-7">
                %{--<g:select id="_f_status" class="form-control" name="_f_status" from="${Constant.MEMBER_STATUS}" value="${memberInstance?.f_status}" noSelection="['':'-โปรดระบุ-']"/>--}%
                <g:select id="f_status" class="form-control" name="f_status" from="${EnumStatus.values()}" value="${memberInstance?.f_status}" valueMessagePrefix="enum.value" optionKey="value" noSelection="['':'-โปรดระบุ-']"/>
            </div>
        </div>
    </div>

    <div class="row">
        <div id="n_title_group" class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">คำนำหน้า</label>
            <div class="col-sm-4">
                %{--<g:select id="n_title" name="n_title"  class="form-control" from="${Constant.MEMBER_TITLE}" value="${memberInstance?.n_title}" noSelection="['':'-โปรดระบุ-']"/>--}%
                <g:select id="n_title" name="n_title"  class="form-control" from="${EnumTitle.values()}" value="${memberInstance?.n_title}" optionKey="value" noSelection="['':'-โปรดระบุ-']"/>
            </div>
            <div id="titleText" class="col-sm-3">
                <g:if test="${type == 'edit' && memberInstance?.n_title == 'อื่นๆ'}">
                    <input type="text" name="title_other" id="title_other" class="form-control" value="${memberInstance?.title_other}"/>
                </g:if>
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
    <g:if test="${type != 'edit'}">
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
                <g:textField id="m_share" class="form-control" name="m_share" value="${memberInstance?.m_share}"
                             onkeypress="validateNum(event,'currency',false);"
                             onblur="showformatNum(this, 'currency',2,0,99999999999.99);"
                             onkeyup="Mask_FormatNumber(event);"
                             onfocus="checkZero(this);"/>
            </div>
            <div class="col-sm-1">
                บาท
            </div>
        </div>
        <div class="form-group has-feedback col-md-6">
            <label class="control-label col-sm-offset-1 col-sm-4">คิดเป็นมูลค่าหุ้น</label>
            <div class="col-sm-6">
                <label id="sharedAmount" class="control-label">0</label>
            </div>
            <div class="col-sm-1">
                <label class="control-label">หุ้น</label>
            </div>
        </div>
    </div>
    </g:if>
    <g:else>
        <div class="row">
            <div class="form-group has-feedback col-md-6">
                <label class="control-label col-sm-offset-1 col-sm-4">วันที่สมัครเป็นสมาชิกสหกรณ์</label>
                <div class="col-sm-6">
                    <label class="control-label"><g:formatDate format="dd/MM/yyyy" date="${memberInstance.d_member}"/></label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group has-feedback col-md-6">
                <label class="control-label col-sm-offset-1 col-sm-4">ค่าหุ้นรายเดือน (เดือนละ)</label>
                <div class="col-sm-6">
                    <label class="control-label"><g:formatNumber number="${memberInstance?.m_share}" format="#,###,###.00" /></label>
                </div>
                <div class="col-sm-1">
                    <label class="control-label">บาท</label>
                </div>
            </div>
            <div class="form-group has-feedback col-md-6">
                <label class="control-label col-sm-offset-1 col-sm-4">คิดเป็นมูลค่า</label>
                <div class="col-sm-6">
                    <label class="control-label"><g:formatNumber number="${memberInstance?.m_share/Constant.SHARED}" format="#,###,###" /></label>
                </div>
                <div class="col-sm-1">
                    <label class="control-label">หุ้น</label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group has-feedback col-md-6">
                <label class="control-label col-sm-offset-1 col-sm-4">ค่าหุ้นสะสม</label>
                <div class="col-sm-6">
                    <label class="control-label"><g:formatNumber number="${memberInstance?.m_tot_share}" format="#,###,##0.00"/></label>
                </div>
                <div class="col-sm-1">
                    <label class="control-label">บาท</label>
                </div>
            </div>
            <div class="form-group has-feedback col-md-6">
                <label class="control-label col-sm-offset-1 col-sm-4">คิดเป็นมูลค่า</label>
                <div class="col-sm-6">
                    <label class="control-label"><g:formatNumber number="${memberInstance?.m_tot_share/Constant.SHARED}" format="#,###,###" /></label>
                </div>
                <div class="col-sm-1">
                    <label class="control-label">หุ้น</label>
                </div>
            </div>
        </div>
    </g:else>
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
        if(moneyShared == ""){
            $('#sharedAmount').html(0);
            return;
        }
        var shared = '${Constant.SHARED}';
        moneyShared = moneyShared.replace(/\,/g,'');
        moneyShared = parseFloat(moneyShared);
        var sharedValue = moneyShared/shared;
        $('#sharedAmount').html(sharedValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
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
         result = validateField("f_status",'',true);
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

    function validateFormEdit(){
        var validateFlag = true;
        var result;
        result = validateField("i_employee",'number',true);
        validateFlag = validateFlag && result;
        result = validateField("n_company",'',true);
        validateFlag = validateFlag && result;
        result = validateField("d_start",'',true);
        validateFlag = validateFlag && result;
        result = validateField("f_status",'',true);
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
        return validateFlag;
    }


    function selectCreateRange(e) {
        var t = "";
        if (window.getSelection) {
            t = e.value.substring(e.selectionStart, e.selectionEnd)
        } else {
            t = document.selection ? document.selection.createRange().text : document.createRange()
        }
        return t
    }
    function validateNum(e, t, n) {
        var r = e ? e : window.event;
        var t = t ? t : "DIGIT";
        var i = "";
        var s = r.keyCode ? r.keyCode : r.which ? r.which : r.charCode;
        s = r.charCode == 0 ? -1 : s;
        var o = r.srcElement ? r.srcElement : r.target;
        var u = true;
        if (s != -1 && s != 13 && s != 9 && s != 8 && s != 35 && s != 36 && s != 37 && s != 38 && s != 39 && s != 40) {
            if (n == true) {
                att_minus = true;
                minusLen = 1
            } else {
                att_minus = false;
                minusLen = 0
            }
            var a = false;
            var f = false;
            var l = false;
            switch (t.toLocaleUpperCase()) {
                case "DIGIT":
                    if (!(s >= "0".charCodeAt() && s <= "9".charCodeAt())) i = "This field accepts numbers only.";
                    break;
                case "INTEGER":
                    if (s == 46) {
                        u = false;
                        break
                    }
                    if (s != "-".charCodeAt() && att_minus && o.value.indexOf("-") < 0) {
                        var c = o.value.replace(/,/gi, "");
                        if (c.length >= o.maxLength - 1) {
                            u = false;
                            break
                        }
                    }
                    if (s == "-".charCodeAt() && att_minus) {
                        if (isMinus(o.value.charCodeAt(0)) || o.value.indexOf("-") >= 0 || doGetCaretPosition(o) != 0) {
                            u = false
                        }
                    } else {
                        u = u && s >= "0".charCodeAt() && s <= "9".charCodeAt()
                    }
                    if (!u) {
                        i = "This field accepts numbers only."
                    }
                    break;
                case "FLOAT":
                case "CURRENCY":
                    var h = o.value;
                    var p = o.getAttribute("Digit") ? o.getAttribute("Digit") : o.NumberScale;
                    var d = p > 0 ? 1 : 0;
                    var v = o.maxLength - p - d - (att_minus ? 1 : 0);
                    v -= Math.floor(v / 4);
                    var m = o.maxLength - p - d;
                    if (att_minus) {
                        m -= 1
                    }
                    m = Math.floor(m / 3) - (m % 3 == 0 ? 2 : 1) - (o.value.split(",").length - 1);
                    m = m < 0 ? 0 : m;
                    var g = "";
                    if (h.charAt(0) == "+" || h.charAt(0) == "-") {
                        g = h.charAt(0);
                        if (g != "-") {
                            g = ""
                        }
                        h = h.substring(1, h.length)
                    }
                    var c;
                    var y;
                    if (h.indexOf(".") < 0) {
                        c = h
                    } else {
                        c = h.split(".")[0];
                        y = h.split(".")[1]
                    }
                    var b = selectCreateRange(o);
                    if (s == "-".charCodeAt()) {
                        if (att_minus) {
                            if (isMinus(o.value.charCodeAt(0)) || o.value.indexOf("-") >= 0 || doGetCaretPosition(o) != 0) {
                                u = false;
                                break
                            } else {
                                u = true;
                                break
                            }
                        } else {
                            u = false;
                            break
                        }
                    }
                    if (s == ".".charCodeAt()) {
                        if (p == 0) {
                            u = false;
                            break
                        }
                        if (b.indexOf(".") < 0 && h.indexOf(".") >= 0) {
                            u = false;
                            break
                        }
                        u = true;
                        break
                    }
                    if (s >= "0".charCodeAt() && s <= "9".charCodeAt()) {
                        if (h.indexOf(".") < 0 || o.value.indexOf(".") >= doGetCaretPosition(o)) {
                            if (b.length <= 0) {
                                if (c.replace(/,/gi, "").length >= v) {
                                    u = false;
                                    break
                                }
                            } else {
                                if (o.value.indexOf(".") >= 0 && o.value.indexOf(".") <= doGetCaretPosition(o) && c.length + d + minusLen > o.maxLength - p - d - m) {
                                    u = false;
                                    break
                                }
                            }
                        } else if (b.length <= 0 && y.length == p) {
                            u = false;
                            break
                        }
                    } else {
                        u = false;
                        break
                    }
                    break
            }
        }
        if (s == 46 && t.toLocaleUpperCase() == "INTEGER") i = "This field accepts numbers onlyl.";
        if (i != "" || !u) {
            if (window.event) {
                window.event.returnValue = false
            } else {
                e.preventDefault()
            }
        }
    }
    function checkZero(e) {
        var t = e;
        var n = parseFloat(t.value);
        if (n == 0) t.value = "";
        t.select()
    }
    function showformatNum(e, t, n, r, i) {
        var s = e;
        var o = s.value;
        o = o.split(",").join("");
        if (o < r && r.toString() != "") o = r;
        else if (o > i && i.toString() != "") o = i;
        s.value = FormatNumber(o, t, n)
    }
    function FormatNumber(e, t, n) {
        if (e.toString() == "" || isNaN(e)) e = 0;
        switch (t) {
            case "integer":
                return e;
            case "float":
            case "currency":
                return FormatFloat(t, e, n);;
            default:
                return 0
        }
    }
    function FormatInteger(e) {
        if (e != 0) {
            for (var t = 0; t < e.length; t++) {
                if (e.charAt(t) == "0") {
                    e = e.substring(t + 1, e.length);
                    t--
                } else break
            }
            var n = new RegExp("(-?[0-9]+)([0-9]{3})");
            while (n.test(e)) {
                e = e.toString().replace(n, "$1" + "," + "$2")
            }
        }
        return e
    }
    function FormatFloat(e, t, n) {
        preDecimal = t.toString().split(".")[0];
        postDecimal = t.toString().split(".")[1] != null ? t.toString().split(".")[1] : "";
        if (postDecimal.length < n) {
            if (postDecimal.length == 0) postDecimal = "0";
            for (var r = postDecimal.length; r < n; r++) {
                postDecimal += "0"
            }
        } else if (postDecimal.length > n) {
            var i = Math.pow(10, n);
            var s = (Math.round(t * i) / i).toString().split(".");
            preDecimal = s[0];
            postDecimal = s[1];
            if (postDecimal == undefined) postDecimal = "00";
            else if (postDecimal.length < n) for (var r = postDecimal.length; r < n; r++) postDecimal += "0"
        }
        if (preDecimal != 0) {
            for (var o = 0; o < preDecimal.length; o++) {
                if (preDecimal.charAt(o) == "0") {
                    preDecimal = preDecimal.substring(o + 1, preDecimal.length);
                    o--
                } else break
            }
            if (e == "currency") {
                var u = new RegExp("(-?[0-9]+)([0-9]{3})");
                while (u.test(preDecimal)) {
                    preDecimal = preDecimal.replace(u, "$1" + "," + "$2")
                }
            }
        } else if (preDecimal.length > 1) {
            if (preDecimal.charAt(0) == "-") preDecimal = "-" + 0;
            else preDecimal = 0
        } else {
            preDecimal = 0
        }
        return n == 0 ? preDecimal : preDecimal + "." + postDecimal
    }
    function Mask_FormatNumber(e) {
        var t = e ? e : window.event;
        var n = t.srcElement ? t.srcElement : t.target;
        var r = n.getAttribute("NumberMode") ? n.getAttribute("NumberMode") : n.NumberMode;
        var i = t.keyCode ? t.keyCode : t.which ? t.which : t.charCode;
        var s = doGetCaretPosition(n);
        if (i >= 48 && i <= 57 || i >= 96 && i <= 105 || i == 109 || i == 110 || i == 46 || i == 8) {
            var o = n.value;
            var u = false;
            if (o.indexOf("-") > 0) {
                u = true;
                o = o.replace(/-/gi, "")
            }
            o = o.replace(/,/gi, "");
            if (o.indexOf(".") >= 0) {
                var a = o.split(".");
                o = FormatInteger(a[0]) + "." + a[1]
            } else {
                o = FormatInteger(o)
            }
            if (u) o = "-" + o;
            s += o.length - n.value.length;
            n.value = o;
            n.realValue = o.replace(/,/gi, "");
            setCaretPosition(n, s)
        }
    }
    function doGetCaretPosition(e) {
        var t = 0;
        if (document.selection) {
            e.focus();
            var n = document.selection.createRange();
            n.moveStart("character", -e.value.length);
            t = n.text.length
        } else if (e.selectionStart || e.selectionStart == "0") t = e.selectionStart;
        return t
    }
    function setCaretPosition(e, t) {
        if (e.setSelectionRange) {
            e.focus();
            e.setSelectionRange(t, t)
        } else if (e.createTextRange) {
            var n = e.createTextRange();
            n.collapse(true);
            n.moveEnd("character", t);
            n.moveStart("character", t);
            n.select()
        }
    }
    isMinus = function(e) {
        return e == "-".charCodeAt(0) || e == 45 || e == 40
    }
</script>