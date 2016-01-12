package com.setnewscoop

import org.grails.databinding.BindingFormat

/**
 * Created by Oz on 1/12/2016.
 */
class ChgShare {

    String i_member;
    @BindingFormat('dd/MM/yyyy')
    Date d_trans;
    Double m_old_share;
    Double m_new_share;
    @BindingFormat('dd/MM/yyyy')
    Date d_effect;
    String f_change;

    static mapping = {

        version false
        id generator:"increment", column: "id", sqlType: "INT"
        i_member column: "i_member", sqlType: "varchar", length: 4
        d_trans column: "d_trans", sqlType: "datetime"
        m_old_share column: "m_old_share", sqlType: "double"
        m_new_share column: "m_new_share", sqlType: "double"
        d_effect column: "d_effect", sqlType: "datetime"
        f_change column: "f_change", sqlType: "varchar", length: 1


    }

    static constraints = {
        i_member nullable : true;
        d_trans nullable : true;
        m_old_share nullable : true;
        m_new_share nullable : true;
        d_effect nullable : true;
        f_change nullable : true;

    }

}
