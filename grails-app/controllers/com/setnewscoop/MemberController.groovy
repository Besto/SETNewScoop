package com.setnewscoop

import java.text.DateFormat
import java.text.SimpleDateFormat
import java.text.DecimalFormat

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MemberController {

    static allowedMethods = [create: ["POST","GET"], save: "POST", update: "POST", delete: "POST", updateShare: "POST"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Member.list(params), model:[memberInstanceCount: Member.count()]
    }

    def show(Member memberInstance) {
        respond memberInstance
    }

    def create() {

        def memberId = Member.createCriteria().get {
                        projections {
                            max "id"
                        }
                    } as int
        memberId++;
        render view: "create" ,model: [memberId:memberId]
    }

    @Transactional
    def save() {

        def memberId = Member.createCriteria().get {
            projections {
                max "id"
            }
        } as int
        memberId++;

        Member memberInstance = new Member();
        bindData(memberInstance,params);

        String shared = params.m_share;
        memberInstance.m_share = Double.parseDouble(shared.replaceAll(",", ""));
        memberInstance.m_tot_share = 0;
        if(!memberInstance.save(flush: true ,failOnError: true)){
            render(view:  "create" ,model: [memberInstance:memberInstance,memberId: memberId])
        }

        memberId++;
        render(view: "create",model: [errCode:"1000",memberId: memberId]);

    }

    def edit() {
        String memberId = params.id_member;
        Member memberInstance = Member.findById(memberId);

        render( view: "edit", model: [memberInstance: memberInstance, memberId:memberInstance.id, type: 'edit'])

    }


    def editMember(){

        int idMember = -1;
        try {
            idMember = Integer.parseInt(params.id_member);
        }
        catch (Exception e){
            //e.printStackTrace();
        }

        int idEmployee = -1;
        try {
            idEmployee = Integer.parseInt(params.id_employee);
        }
        catch (Exception e){
            //e.printStackTrace();
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
                /*isNull("d_expired")*/
            }

            String errCode = "";
            int resultCount = results.size();
            println("result : " + resultCount);

            if (resultCount == 0) {
                errCode = "1001" //not found
                render view: "searchMember", model: [type: "edit", errCode: errCode];
            }

            if(resultCount == 1){
                Member memberInstance = (Member) results.get(0);
                render( view: "edit", model: [memberInstance: memberInstance, memberId:memberInstance.id, type: 'edit'])
            }else if (resultCount > 1){
                render view: "searchMember", model: [type: "edit", members: results];
            }

        }else{
            render view: "searchMember",model: [type:"edit"]

        }
    }

    def resignMember(){

        int idMember = -1;
        try {
            idMember = Integer.parseInt(params.id_member);
        }
        catch (Exception e){
            //e.printStackTrace();
        }

        int idEmployee = -1;
        try {
            idEmployee = Integer.parseInt(params.id_employee);
        }
        catch (Exception e){
            //e.printStackTrace();
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
                /*isNull("d_expired")*/
            }

            String errCode = "";
            int resultCount = results.size();
            println("result : " + resultCount);

            if (resultCount == 0) {
                errCode = "1001" //not found
                render view: "searchMember", model: [type: "edit", errCode: errCode];
            }

            if(resultCount == 1){
                Member memberInstance = (Member) results.get(0);
                render( view: "edit", model: [memberInstance: memberInstance, memberId:memberInstance.id, type: 'edit'])
            }else if (resultCount > 1){
                render view: "searchMember", model: [type: "edit", members: results];
            }

        }else{
            render view: "searchMember",model: [type:"resign"]

        }
    }

    def changeSharedMember(){

        int idMember = -1;
        try {
            idMember = Integer.parseInt(params.id_member);
        }
        catch (Exception e){
            //e.printStackTrace();
        }

        int idEmployee = -1;
        try {
            idEmployee = Integer.parseInt(params.id_employee);
        }
        catch (Exception e){
            //e.printStackTrace();
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
                /*isNull("d_expired")*/
            }

            String errCode = "";
            int resultCount = results.size();
            println("result : " + resultCount);

            if (resultCount == 0) {
                errCode = "1001" //not found
                render view: "searchMember", model: [type: "changeShared", errCode: errCode];
            }

            if(resultCount == 1){
                Member memberInstance = (Member) results.get(0);

                render( view: "changeShared", model: [memberInstance: memberInstance])
            }else if (resultCount > 1){
                render view: "searchMember", model: [type: "changeShared", members: results];
            }

        }else{
            render view: "searchMember",model: [type:"changeShared"]

        }
    }

    def changeShared() {
        String memberId = params.id_member;
        Member memberInstance = Member.findById(memberId);

        render( view: "changeShared", model: [memberInstance: memberInstance])

    }

    @Transactional
    def updateShare() {

        double m_old_share = 0;

        println("Call update Share");
        String purpose = params.purpose;
        println("purpose : " + purpose);

        ChgShare chgShareInstance = new ChgShare();
        bindData(chgShareInstance, params);

        if (purpose.equals("1")) {
        String m_new_share = params.m_new_share;
        chgShareInstance.m_new_share = Double.parseDouble(m_new_share.replaceAll(",", ""));
        }

        println("chgShareInstance i_member: " + params.i_member)
        println("chgShareInstance d_effect: " + chgShareInstance.d_effect)
        println("chgShareInstance m_new_share: " + chgShareInstance.m_new_share)

        chgShareInstance.d_trans = chgShareInstance.d_effect;

        def result = ChgShare.executeQuery("select m_new_share from ChgShare " +
                "where i_member = ? and id = (select  max(id) from ChgShare where i_member = ?)",
                [params.i_member, params.i_member])

        if(result.size() != 0){
            m_old_share = (Double)result.get(0);

        }
        println("chgShareOld : " + m_old_share)

        if(purpose.equals("1")){

            chgShareInstance.m_old_share = m_old_share;
            chgShareInstance.f_change = ""
            chgShareInstance.save(flush: true ,failOnError: true)
            render view: "searchMember", model: [type: "changeShared", errCode: "1200"];

        }else if(purpose.equals("2")){

            chgShareInstance.m_old_share = m_old_share;
            chgShareInstance.f_change = "";
            chgShareInstance.m_new_share = 0;
            chgShareInstance.save(flush: true ,failOnError: true)
            render view: "searchMember", model: [type: "changeShared", errCode: "1200"];

        }else if(purpose.equals("3")){

//            def loanResult = Loan.executeQuery("select id from Loan where member = ? and f_status = ? and left(s_trans,1) = ?",
//            [params.member,"","N"])
            int memberId = params.i_member as int
            println memberId
            def loanResult = Loan.executeQuery("select id from Loan as loan where loan.member.id = ?  and f_status = ? and  substring(s_trans, 1, 1) = ?", [memberId,"","N"])

            println("loanResult.size() : "+loanResult.size())


            if(loanResult.size() != 0){

                render view: "searchMember", model: [type: "changeShared", errCode: "9000", NumLoan: loanResult.get(0)];

            }else {

                chgShareInstance.m_old_share = m_old_share;
                chgShareInstance.f_change = "1";
                chgShareInstance.m_new_share = 0;
                chgShareInstance.save(flush: true, failOnError: true)
                render view: "searchMember", model: [type: "changeShared", errCode: "1200"];

            }
        }



    }

    @Transactional
    def update() {
        Member memberInstance = Member.findById(params.memberId);

        bindData(memberInstance,params);

        if(!memberInstance.save(flush: true ,failOnError: true)){
            render( view: "edit", model: [memberInstance: memberInstance, memberId:memberInstance.id, type: 'edit'])
        }

        println(">>>update success");
        render view: "searchMember", model: [type: "edit", errCode: "1100"];
    }

    @Transactional
    def delete(Member memberInstance) {

        if (memberInstance == null) {
            notFound()
            return
        }

        memberInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Member.label', default: 'Member'), memberInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'member.label', default: 'Member'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
