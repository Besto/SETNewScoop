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

        <g:form class="form-horizontal" action="updateShare" onsubmit="return validateForm();">

            <g:render template="generalForm"/>

            <br/>
            <g:hiddenField name="i_member" value="${memberInstance?.id}"/>
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
                                <input type="radio" name="purpose" value="1" checked> เปลี่ยนค่าหุ้นรายเดือน (ใหม่)
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
                        <div id="m_new_share_group" class="form-group has-feedback">
                        <div class="col-sm-8">
                            <input type="text" id="m_new_share" name="m_new_share" class="form-control" value=""
                                   onkeypress="validateNum(event,'currency',false);"
                                   onblur="showformatNum(this, 'currency',2,0,99999999999.99);"
                                   onkeyup="Mask_FormatNumber(event);"
                                   onfocus="checkZero(this);"/>

                        </div>
                        <div class="col-sm-2">บาท</div>
                        </div>
                    </div>

                </div>

            </div>

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

    function validateForm(){
        var validateFlag = true;
        var result;
        result = validateField("d_effect",'',true);
        validateFlag = validateFlag && result;


        var purpose = document.getElementsByName('purpose');
        var purpose_value;
        for(var i = 0; i < purpose.length; i++){
            if(purpose[i].checked){
                purpose_value = purpose[i].value;
            }
        }

        if(purpose_value=="1"){
        result = validateField("m_new_share",'',true);
        validateFlag = validateFlag && result;
        }else{
            result = validateField("m_new_share",'',false);
            validateFlag = validateFlag && result;
        }

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
</body>
</html>
