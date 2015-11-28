package com.setnewscoop

import java.text.DateFormat
import java.text.DecimalFormat
import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LoanController {

    private static DecimalFormat memberIdFormat = new DecimalFormat("0000");
    static allowedMethods = [create: ["POST","GET"], save: "POST", update: "POST", delete: "POST" ,getLoanId: "GET"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Loan.list(params), model: [loanInstanceCount: Loan.count()]
    }

    def show(Loan loanInstance) {
        respond loanInstance
    }

    def addLoan(){
        render view: "addLoan"
    }

    def searchMember(){
        String searchName = params.searchName;
        String searchId = params.searchId;
        int memberId = -1;
        try {
            memberId = Integer.parseInt(searchId);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        String searchSurname = params.searchSurname;
        String returnText = "Not Found";

        def c = Member.createCriteria();
        def result = c.list {
            if(memberId!=-1){
                eq("id",memberId)
            }
            if(!searchName.equals("")) {
                eq("n_first", searchName)
            }
            if(!searchSurname.equals("")) {
                eq("n_last", searchSurname)
            }
        }

        def criteriaLoan = Loan.createCriteria();
        def resultGuarantee = criteriaLoan.list {
            or{
                eq("i_guarantee1", memberIdFormat.format(memberId));
                eq("i_guarantee2", memberIdFormat.format(memberId));
            }
            projections {
                sum('m_loan')
            }
        };

        def sumGuarantee = resultGuarantee.get(0);

        println "The sum of "+memberId+" price "+sumGuarantee

        if(sumGuarantee==null){
            sumGuarantee = 0;
        }

        if(result.size() == 1){
            Member member = (Member)result.get(0);
            returnText = member.id+"|"+member.n_first+"|"+member.n_last+"|"+sumGuarantee;
        }
        else{
            returnText = "Not Found"
        }

        render view: "searchMember" ,model: [returnText:returnText];
    }

    def getLoanId(){
        String typeSymbol = params.type;
        String returnId = typeSymbol+"00000";
        if(typeSymbol!=null){
            def criteria = Loan.createCriteria();
            def resultList = criteria.list {
                like("id",typeSymbol+"%")
                order("id","desc")
            }

            if(resultList.size()>0) {
                String id = ((Loan) resultList.get(0)).getId();
                id = id.substring(id.indexOf(typeSymbol)+1);
                int numId = -1;
                try {
                    numId = Integer.parseInt(id);
                }
                catch (Exception e){
                    e.printStackTrace();
                }
                numId++;
                returnId = typeSymbol + numId;
            }
        }
        render view: "getLoanId",model: [returnId: returnId];
    }

    def create() {
        int idMember = -1;
        try {
            idMember = Integer.parseInt(params.id_member);
        }
        catch (Exception e){
            e.printStackTrace();
        }

        int idEmployee = -1;
        try {
            idEmployee = Integer.parseInt(params.id_employee);
        }
        catch (Exception e){
            e.printStackTrace();
        }

        String firstName = params.first_name;
        String lastName = params.last_name;

        println("idMember : "+idMember);
        println("idEmployee : "+idEmployee);
        println("firstName : "+firstName);
        println("lastName : "+lastName);

        def c = Member.createCriteria()
        def results = c.list {
            if(idMember!=-1){
                eq("id",idMember)
            }
            if(idEmployee!=-1) {
                eq("i_employee", idEmployee)
            }
            if(!firstName.equals("")) {
                eq("n_first", firstName)
            }
            if(!lastName.equals("")) {
                eq("n_last", lastName)
            }
        }

        String errCode = "";
        int resultCount = results.size();
        println("result : "+resultCount);
        if(resultCount==0) errCode = "1001"; //not found
        if(resultCount > 1) errCode = "1002"; //found more than 1

        if(resultCount!=1){
            render view: "addLoan",model: [errCode:errCode]
        }
        else {
            Member member = (Member)results.get(0);

            Calendar workingTime = Calendar.getInstance();
            workingTime.add(Calendar.MONTH,-2);
            Date workingDate = workingTime.getTime();

            if(member.d_member.after(workingDate)){
                errCode = "1003"
                render view: "addLoan",model: [errCode:errCode]
            }
            else {
                List loanType = new ArrayList();
                loanType.add("E");
                loanType.add("N");
                loanType.add("S");
                loanType.add("G");
                loanType.add("T");
                loanType.add("L");
                loanType.add("H");

                render view: "create" ,model: [member:member,loanType:loanType]
            }
        }
    }

    @Transactional
    def save() {
        println(">>> money_guarantee "+params.money_guarantee);

        Member member = Member.findById(params.member);

        Loan loanInstance = new Loan();
        bindData(loanInstance,params);
        loanInstance.id = params.id;

        loanInstance.f_status = "";
        loanInstance.m_tot_return = 0;

        DateFormat df = new SimpleDateFormat("dd/MM/yyy",Locale.US);
        String dTrans = params.date_trans;
        Date d_trans = df.parse(dTrans);
        loanInstance.d_trans = d_trans;

        String dBegin = params.date_begin;
        Date d_begin = df.parse(dBegin);
        loanInstance.d_begin = d_begin;

        String i_guarantee = params.i_guarantee;
        String[] guaranteeArray = i_guarantee.split("\\|");

        List money_guaranteeList = params.list('money_guarantee');
        Double money_guarantee1 = null;
        if(money_guaranteeList.size() > 0){
            money_guarantee1 = Double.parseDouble(money_guaranteeList.get(0));
        }
        Double money_guarantee2 = null;
        if(money_guaranteeList.size() > 1){
            money_guarantee2 = Double.parseDouble(money_guaranteeList.get(1));
        }
        loanInstance.money_guarantee1 = money_guarantee1;
        loanInstance.money_guarantee2 = money_guarantee2;

        try {
            if (guaranteeArray[0] != null && !guaranteeArray[0].equals("")) {
                loanInstance.i_guarantee1 = guaranteeArray[0];
            }

            if (guaranteeArray[1] != null && !guaranteeArray[1].equals("")) {
                loanInstance.i_guarantee2 = guaranteeArray[1];
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }

        println(">>>id      :"+loanInstance.id);
        println(">>>d_trans :"+loanInstance.d_trans);
        println(">>>d_begin :"+loanInstance.d_begin);
        println(">>>i_guarantee :"+i_guarantee);

        if(!loanInstance.save(flush: true ,failOnError: true)){
            render(view:  "create" ,model: [loanInstance:loanInstance,member: member])
        }

        render(view: "addLoan",model: [errCode:"1000"]);
    }

    def editLoan(){

        int idMember = -1;
        try {
            idMember = Integer.parseInt(params.id_member);
        }
        catch (Exception e){
            e.printStackTrace();
        }

        int idEmployee = -1;
        try {
            idEmployee = Integer.parseInt(params.id_employee);
        }
        catch (Exception e){
            e.printStackTrace();
        }

        String firstName = params.first_name;
        String lastName = params.last_name;

        println("idMember : "+idMember);
        println("idEmployee : "+idEmployee);
        println("firstName : "+firstName);
        println("lastName : "+lastName);

        if(idMember!=-1 || idEmployee!=-1 || firstName!=null || lastName!=null) {
            def c = Member.createCriteria()
            def results = c.list {
                if (idMember != -1) {
                    eq("id", idMember)
                }
                if (idEmployee != -1) {
                    eq("i_employee", idEmployee)
                }
                if (!firstName.equals("")) {
                    eq("n_first", firstName)
                }
                if (!lastName.equals("")) {
                    eq("n_last", lastName)
                }
            }

            String errCode = "";
            int resultCount = results.size();
            println("result : " + resultCount);
            if (resultCount == 0) errCode = "1001"; //not found
            if (resultCount > 1) errCode = "1002"; //found more than 1

            if (resultCount != 1) {
                render view: "addLoan", model: [edit: "true", errCode: errCode];
            } else {
                Member member = (Member) results.get(0);
                def criteria = Loan.createCriteria();
                def loans = criteria.list {
                    eq("member", member);
                }

                println(">>>loans : " + loans.size())
                render view: "addLoan", model: [edit: "true", loans: loans];
            }
        }
        else{
            render view: "addLoan",model: [edit:"true"]
        }
    }

    def edit() {
        String loanId = params.id_loan;
        Loan loanInstance = Loan.findById(loanId);
        String cancelFlag = params.cancel;
        if(cancelFlag==null || !cancelFlag.equals("true")){
            cancelFlag = "false";
        }

        if(loanInstance == null){
            render view: "addLoan",model: [edit:"true",errCode: "1001"];
        }
        else {
            Member member = loanInstance.member;
            String memberId = member.id;

            String[] guaranteeArray = new String[2];
            if(loanInstance.i_guarantee1!=null && !loanInstance.equals("")){
                Member guarantee1 = Member.findById(Integer.parseInt(loanInstance.i_guarantee1));
                if(guarantee1!=null){
                    def criteriaLoan = Loan.createCriteria();
                    def resultGuarantee = criteriaLoan.list {
                        or{
                            eq("i_guarantee1", memberIdFormat.format(guarantee1.id));
                            eq("i_guarantee2", memberIdFormat.format(guarantee1.id));
                        }
                        projections {
                            sum('m_loan')
                        }
                    };

                    def sumGuarantee = resultGuarantee.get(0);

                    guaranteeArray[0] = guarantee1.id+"|"+guarantee1.n_first+"|"+guarantee1.n_last+"|"+sumGuarantee;
                }
            }

            if(loanInstance.i_guarantee2!=null && !loanInstance.equals("")){
                Member guarantee2 = Member.findById(Integer.parseInt(loanInstance.i_guarantee2));
                if(guarantee2!=null){
                    def criteriaLoan = Loan.createCriteria();
                    def resultGuarantee = criteriaLoan.list {
                        or{
                            eq("i_guarantee1", memberIdFormat.format(guarantee2.id));
                            eq("i_guarantee2", memberIdFormat.format(guarantee2.id));
                        }
                        projections {
                            sum('m_loan')
                        }
                    };

                    def sumGuarantee = resultGuarantee.get(0);

                    guaranteeArray[1] = guarantee2.id+"|"+guarantee2.n_first+"|"+guarantee2.n_last+"|"+sumGuarantee;
                }
            }

            String type = loanId?loanId.substring(0,1):"";
            println(">>>type : "+type);

            List loanType = new ArrayList();
            loanType.add("E");
            loanType.add("N");
            loanType.add("S");
            loanType.add("G");
            loanType.add("T");
            loanType.add("L");
            loanType.add("H");

            println("member details : "+member.n_first+" "+member.n_last);
            render view: "edit" ,model: [member:member,loanType:loanType,loanInstance:loanInstance,
                                         guaranteeArray:guaranteeArray,type:type,cancelFlag:cancelFlag]
        }
    }

    @Transactional
    def update() {
        Member member = Member.findById(params.member);

        Loan loanInstance = Loan.findById(params.id);
        bindData(loanInstance,params);

        DateFormat df = new SimpleDateFormat("dd/MM/yyy",Locale.US);
        String dTrans = params.date_trans;
        Date d_trans = df.parse(dTrans);
        loanInstance.d_trans = d_trans;

        String dBegin = params.date_begin;
        Date d_begin = df.parse(dBegin);
        loanInstance.d_begin = d_begin;

        println(">>>member :"+member.id);
        println(">>>id      :"+loanInstance.id);
        println(">>>d_trans :"+loanInstance.d_trans);
        println(">>>d_begin :"+loanInstance.d_begin);

        if(!loanInstance.save(flush: true ,failOnError: true)){
            render(view:  "edit" ,model: [loanInstance:loanInstance,member: member])
        }

        println(">>>update success");
        render(view: "addLoan",model: [edit: "true",errCode:"1000"]);
    }

    @Transactional
    def cancel(){
        Member member = Member.findById(params.member);
        Loan loanInstance = Loan.findById(params.id);
        String cancelFlag = "true";
        //update cancel status
        loanInstance.f_status = 'D';
        loanInstance.e_reason = params.e_reason;
        println(">>>"+params.e_reason);

        if(!loanInstance.save(flush: true ,failOnError: true)){
            render(view:  "edit" ,model: [loanInstance:loanInstance,member: member,cancelFlag:cancelFlag])
        }

        println(">>>cancel success");
        render(view: "addLoan",model: [edit: "true",errCode:"1000"]);
    }

    @Transactional
    def delete(Loan loanInstance) {

        if (loanInstance == null) {
            notFound()
            return
        }

        loanInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Loan.label', default: 'Loan'), loanInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'loan.label', default: 'Loan'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
