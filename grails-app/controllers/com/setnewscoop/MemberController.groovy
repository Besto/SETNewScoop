package com.setnewscoop

import java.text.DateFormat
import java.text.SimpleDateFormat
import java.text.DecimalFormat

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MemberController {

    static allowedMethods = [create: ["POST","GET"], save: "POST", update: "POST", delete: "POST"]

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
                isNull("d_expired")
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

    @Transactional
    def update() {
        Member memberInstance = Member.findById(params.memberId);

        bindData(memberInstance,params);

        if(!memberInstance.save(flush: true ,failOnError: true)){
            render( view: "edit", model: [memberInstance: memberInstance, memberId:memberInstance.id, type: 'edit'])
        }

        println(">>>update success");
        render view: "searchMember", model: [type: "edit", errCode: "1000"];
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
