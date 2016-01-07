package com.setnewscoop

/**
 * Created by Oz on 1/6/2016.
 */
public enum EnumStatus {


    A(1), B(2), C(3)

    final String value;
    EnumStatus(String value){ this.value = value }

    @Override
    String toString(){ value }
    String getKey() { name() }

}
