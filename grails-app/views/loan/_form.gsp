<style>
	.fa-trash-o{
		color: red;
		font-size: 25px;
	}
	.fa-trash-o:hover{
		color: grey;
		font-size: 25px;
	}
</style>
<div class="box-content">
		<h4 class="page-header">รายละเอียดการกู้</h4>
		<g:hiddenField name="member" value="${member.id}"/>
		<div class="row">
			<div id="type_group" class="form-group has-feedback col-md-6">
				<label class="control-label col-sm-offset-1 col-sm-4">ประเภทเงินกู้</label>
				<div class="col-sm-7">
					<g:select id="type" class="form-control" name="type" from="${loanType}" value="${type}" noSelection="['':'-เลือกประเภทเงินกู้-']" onchange="findId()"/>
				</div>
			</div>
			<div class="form-group has-feedback col-md-6">
				<label class="control-label col-sm-offset-1 col-sm-4">เลขที่สัญญา</label>
				<div class="col-sm-7">
					<span id="showIdLoan">${loanInstance?.id}</span>
					<g:hiddenField id="idLoan" name="id" value="${loanInstance?.id}"/>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group has-feedback col-md-6">
				<label class="control-label col-sm-offset-1 col-sm-4">วันที่ขอกู้เงิน</label>
				<div class="col-sm-6">
					<g:textField id="d_trans" name="date_trans" class="form-control" readonly="true"/>
					<label class="fa fa-calendar form-control-feedback" for="d_trans"></label>
				</div>
			</div>
			<div class="form-group has-feedback col-md-6">
				<label class="control-label col-sm-offset-1 col-sm-4">วันที่เริ่มคืนเงิน</label>
				<div class="col-sm-6">
					<g:textField id="d_begin" name="date_begin" class="form-control" value="" readonly="true"/>
					<label class="fa fa-calendar form-control-feedback" for="d_begin"></label>
				</div>
			</div>
		</div>
		<div class="row">
			<div id="m_loan_group" class="form-group has-feedback col-md-6">
				<label class="control-label col-sm-offset-1 col-sm-4">จำนวนเงินขอกู้เงินสหกรณ์</label>
				<div class="col-sm-6">
					<g:textField id="m_loan" class="form-control" name="m_loan" value="${loanInstance?.m_loan}"/>
				</div>
				<div class="col-sm-1">
					บาท
				</div>
			</div>
			<div id="q_month_group" class="form-group has-feedback col-md-6">
				<label class="control-label col-sm-offset-1 col-sm-4">จำนวนงวด</label>
				<div class="col-sm-6">
					<g:textField id="q_month" class="form-control" name="q_month" value="${loanInstance?.q_month}"/>
				</div>
				<div class="col-sm-1">
					งวด
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group has-feedback">
				<label class="control-label col-sm-offset-1 col-sm-3">จำนวนเงินนำส่งคืนเป็นงวดรายเดือน</label>
				<div class="col-sm-3">
					<g:textField id="m_paid_month" class="form-control" name="m_paid_month" value="" readonly="true"/>
				</div>
				<div class="col-sm-2">
					บาท(ปัดทศนิยมขึ้น)
				</div>
			</div>
		</div>
		<div class="row">
			<div id="e_reason_group" class="form-group has-feedback">
				<label class="control-label col-sm-offset-1 col-sm-3">วัตถุประสงค์ในการกู้เงิน</label>
				<div class="col-sm-6">
					<g:textField class="form-control" name="e_reason" value="${loanInstance?.e_reason}"/>
				</div>
			</div>
		</div>
		<div id="guarantee_info_group" class="form-group has-feedback">
			<label class="control-label col-sm-offset-1 col-sm-2">ข้อมูลการค้ำประกัน</label>
			<div class="col-sm-2">
				<div class="checkbox">
					<label class="control-label">
						<input type="checkbox" checked="" onchange="toggleCheckbox('#loan_share')"> ค่าหุ้น
						<i class="fa fa-square-o small"></i>
					</label>
				</div>
				<div class="checkbox">
					<label class="control-label">
						<input type="checkbox" checked="" onchange="toggleCheckbox('#loan_saving')"> เงินฝาก
						<i class="fa fa-square-o small"></i>
					</label>
				</div>
				<div class="checkbox">
					<label class="control-label">
						<input type="checkbox" checked="" onchange="toggleCheckbox('#loan_guarantee')"> บุคคลค้ำประกัน
						<i class="fa fa-square-o small"></i>
					</label>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="col-sm-10">
					<g:textField id="loan_share" name="loan_share" class="form-control" value=""/>
				</div>
				<div class="col-sm-2">บาท</div>
				<div class="col-sm-10">
					<g:textField id="loan_saving" name="loan_saving" class="form-control" value=""/>
				</div>
				<div class="col-sm-2">บาท</div>
				<div class="col-sm-10">
					<g:textField id="loan_guarantee" readonly="true" name="loan_guarantee" class="form-control" value=""/>
				</div>
				<div class="col-sm-2">บาท</div>
			</div>
			<div id="guarantee_info"></div>
		</div>
		<div class="form-group has-feedback">
			<div class="col-md-offset-9 col-md-2" align="right">
				<button id="add_guarantee_button" type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target=".add-guarantee">เพิ่มผู้คำประกัน</button>
			</div>
			<div class="col-md-offset-1 col-md-10">
				<table class="table table-striped table-bordered table-hover table-heading no-border-bottom">
					<thead>
					<tr>
						<th>รหัสสมาชิก</th>
						<th>ชื่อผู้ค้ำประกัน</th>
						<th>ยอดค้ำประกัน</th>
						<th>ค้ำประกัน</th>
						<th></th>
					</tr>
					</thead>
					<tbody id="guaranteeList">
						<g:each in="${guaranteeArray}" var="eachGuarantee">
							<g:split input="${eachGuarantee}" regex="|" index="0"/>
						</g:each>
					</tbody>
				</table>
				<g:hiddenField id="i_guarantee" name="i_guarantee" value=""/>
			</div>
		</div>
		<g:if test="${cancelFlag=='true'}">
			<div id="" class="form-group has-feedback">
				<label class="col-sm-offset-1 col-sm-2" for="e_reason">สาเหตุที่ยกเลิก *</label>
				<div class="col-sm-6">
					<g:textArea id="e_reason_delete" name="e_cancel" class="form-control" style="resize: none;" rows="5" value=""/>
				</div>
			</div>
		</g:if>
</div>
<div id="addGuaranteeModal" class="modal fade add-guarantee" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg">
		<div class="modal-content box-content">
			<h4 class="page-header">เพิ่มผู้ค้ำประกัน</h4>
			<div>
				<p class="bg-danger" id="alertMsg"></p>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">ชื่อ</label>
				<div class="col-sm-4">
					<input id="searchName" name="searchName" type="text" class="form-control" placeholder="ชื่อ" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip for name">
				</div>
				<label class="col-sm-2 control-label">นามสกุล</label>
				<div class="col-sm-4">
					<input id="searchSurname" name="searchSurname" type="text" class="form-control" placeholder="นามสกุล" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip for last name">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">รหัสสมาชิก</label>
				<div class="col-sm-4">
					<g:textField id="searchId" name="searchId" class="form-control"/>
				</div>
			</div>
			<div align="center">
				<a href="javascript:searchMember()" class="btn btn-info btn-label-left" style="margin-left: 20px">เพิ่ม</a>
				<a href="javascript:closeModal()" class="btn btn-danger btn-label-left" style="margin-left: 20px">ยกเลิก</a>
			</div>
		</div>
	</div>
</div>
<script>
	var numGuarantee = 0;

	function searchMember(){

		if(numGuarantee < ${Constant.numGuarantee}) {
			var searchName = $('#searchName').val();
			var searchSurname = $('#searchSurname').val();
			var searchId = $('#searchId').val();

			$.get("/SETNewScoop/loan/searchMember?searchName=" + searchName + "&searchSurname=" + searchSurname + "&searchId=" + searchId, function (data) {
				var returnValue = data.trim();

				if (returnValue == 'Not Found') {
					$('#alertMsg').html('ไม่พบข้อมูลสมาชิก');
				}
				else {
					numGuarantee++;
					var res = returnValue.split('|');

					$('#guaranteeList').append('<tr id="row_'+res[0]+'"><td>'
												+ res[0] + '</td><td>'
												+ res[1]+' '+ res[2] + '</td><td>'
												+ res[3] + '</td><td>'
												+ '<input class="form-control" name="money_guarantee" value=""/>' + '</td>'
												+ '<td align="center"><a href="javascript:deleteGuarantee('+res[0]+')"><i class="fa fa-trash-o"></i></a></td></tr>');
					var i_guarantee = $('#i_guarantee').val();
					i_guarantee = i_guarantee+res[0]+'|';
					$('#i_guarantee').val(i_guarantee);
					$('#alertMsg').html('');
					$('#addGuaranteeModal').modal('hide');
				}
			});
		}
		else {
			$('#alertMsg').html('ผู้ค้ำประกันเต็มแล้วไม่สามารถเพิ่มได้');
		}
	}

	function deleteGuarantee(memberId){
		if(numGuarantee > 0){
			$('#row_'+memberId).remove();
			var i_guarantee = $('#i_guarantee').val();
			i_guarantee = i_guarantee.replace(memberId+'|','');
			$('#i_guarantee').val(i_guarantee);
			numGuarantee--;
		}
		else {
			alert('ไม่มีผู้คำประกัน');
		}
	}

	function closeModal(){
		$('#addGuaranteeModal').modal('hide');
	}

	function calculateMPaidMonth(){
		var m_loan = $('#m_loan').val();
		var q_month = $('#q_month').val();
		if(m_loan!=''&&q_month!=''){
			var m_paid_month = Math.ceil(m_loan/q_month);
			$('#m_paid_month').val(m_paid_month);
		}
	}

	function calculatePeopleGuarantee(){
		var sumPeopleGuarantee = 0;
		$("input[name='money_guarantee']").each(function() {
			var value = parseFloat($(this).val());
			sumPeopleGuarantee = sumPeopleGuarantee + value;
		});

		$('#loan_guarantee').val(sumPeopleGuarantee);
	}

	function toggleCheckbox(id){
		$(id).prop('disabled', function (_, val) { return ! val; });
		$(id).val('');

		if(id=='#loan_guarantee'){
			$('#add_guarantee_button').toggle();
			$('#guaranteeList').html('');
			$('#i_guarantee').val('');
		}
	}


	$(document).ready(function() {
		calculateMPaidMonth();

		$('#d_trans').val('<g:formatDate format="dd/MM/yyyy" date="${loanInstance?loanInstance.d_trans:new java.util.Date()}"/>');
		$('#d_trans').datepicker({
			dateFormat : 'dd/mm/yy'
		});
		$('#d_begin').val('<g:formatDate format="dd/MM/yyyy" date="${loanInstance?loanInstance.d_begin:new java.util.Date()}"/>');
		$('#d_begin').datepicker({
			setDate: new Date(),
			dateFormat : 'dd/mm/yy'
		});

		$('#m_loan').focusout(function() {
			calculateMPaidMonth();
		});

		$('#q_month').focusout(function() {
			calculateMPaidMonth();
		});
	});

	function findId(){
		var type = $('#type').val();
		$.get( "/SETNewScoop/loan/getLoanId?type="+type, function( data ) {
			var returnValue = data.trim();
			$('#idLoan').val(returnValue);
			$('#showIdLoan').html(returnValue);
		});
	}

	function validateGuarantee(){
		var result = true;
		var loan = $('#m_loan').val();
		var loan_share = $('#loan_share').val();
		if(loan_share==''){
			loan_share = 0;
		}
		else loan_share = parseFloat(loan_share);

		var loan_saving = $('#loan_saving').val();
		if(loan_saving==''){
			loan_saving = 0;
		}
		else loan_saving = parseFloat(loan_saving);

		var loan_guarantee = $('#loan_guarantee').val();
		if(loan_guarantee==''){
			loan_guarantee = 0;
		}
		else loan_guarantee = parseFloat(loan_guarantee);

		var sum_guarantee = loan_share+loan_saving+loan_guarantee;

		alert(sum_guarantee +' = '+ loan_share+' + '+loan_saving+' + '+loan_guarantee);
		if(loan!=sum_guarantee){
			result = false;
		}

		showDisplay(result,'guarantee_info','เงินค้ำประกันไม่ตรงกับจำนวนเงินกู้ (เงินค้ำ = '+sum_guarantee+',เงินกู้ = '+loan+')');

		return result;
	}

	function validateForm(){
		var validateFlag = true;
		var result;
		result = validateField("type",'',true);
		validateFlag = validateFlag && result;
		result = validateField("m_loan",'number',true);
		validateFlag = validateFlag && result;
		result = validateField("q_month",'number',true);
		validateFlag = validateFlag && result;
		result = validateField("e_reason",'',true);
		validateFlag = validateFlag && result;
		calculatePeopleGuarantee();
		result = validateGuarantee();
		validateFlag = validateFlag && result;

		return validateFlag;
	}
</script>

