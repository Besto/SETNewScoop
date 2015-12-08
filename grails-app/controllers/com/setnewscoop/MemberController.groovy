package com.setnewscoop

import java.text.DateFormat
import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MemberController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

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

//        DateFormat df = new SimpleDateFormat("dd/MM/yyy",Locale.US);
//        String dStart = params.d_start;
//        Date d_start = df.parse(dStart);
//        memberInstance.d_start = d_start;
//
//        String dMember = params.d_member_string;
//        Date _dMember = df.parse(dMember);
//        memberInstance.d_member = _dMember;

        println("memberInstance.d_member : " + memberInstance.d_member);

        if(!memberInstance.save(flush: true ,failOnError: true)){
            render(view:  "create" ,model: [memberInstance:memberInstance,memberId: memberId])
        }

        memberId++;
        render(view: "create",model: [errCode:"1000",memberId: memberId]);

    }

    def edit(Member memberInstance) {
        respond memberInstance
    }

    @Transactional
    def update(Member memberInstance) {
        if (memberInstance == null) {
            notFound()
            return
        }

        if (memberInstance.hasErrors()) {
            respond memberInstance.errors, view:'edit'
            return
        }

        memberInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Member.label', default: 'Member'), memberInstance.id])
                redirect memberInstance
            }
            '*'{ respond memberInstance, [status: OK] }
        }
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
