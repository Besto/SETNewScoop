function validateField(id,type,required){
    var fieldValue = $('#'+id).val();
    fieldValue = $.trim(fieldValue);
    var result = true;
    var alertMsg = '';

    console.log('value '+id+' '+fieldValue);

    //validate require
    if(required){
        if(fieldValue==null || fieldValue==''){
            result = false;
            alertMsg = 'โปรดระบุข้อมูล';
        }
    }

    //validate type
    if(result){
        if(type=='number'){
            if(isNaN(fieldValue)){
                result = false;
                alertMsg = 'โปรดระบุตัวเลข';
            }
        }
    }

    //set display
    showDisplay(result,id,alertMsg);

    console.log('validateForm '+id+'> '+result);
    return result;
}

function showDisplay(result,id,alertMsg){
    if(result==false){
        if($('#'+id+'_group').hasClass('has-error')) {
            $('#'+id+'_group small').html(alertMsg);
        }
        else {
            $('#'+id+'_group').addClass('has-error');
            $('#' + id).parent().append('<small class="help-block">' + alertMsg + '</small>');
        }
    }
    else {
        $('#'+id+'_group').removeClass('has-error');
        $('#'+id+'_group small').remove();
    }
}