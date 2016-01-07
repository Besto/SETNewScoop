package com.setnewscoop;

/**
 * Created by Oz on 1/6/2016.
 */
public enum EnumCompany {

    SET("SET"), FKH("FKH"), COO("COO")

    final String value;
    EnumCompany(String value){ this.value = value }

    @Override
    String toString(){ value }
    String getKey() { name() }

}
