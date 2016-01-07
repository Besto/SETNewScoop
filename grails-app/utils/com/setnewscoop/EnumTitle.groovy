package com.setnewscoop

/**
 * Created by Oz on 1/6/2016.
 */
public enum EnumTitle {

    A("นาย"), B("น.ส."), C("นาง"), D("อื่นๆ")

    final String value;
    EnumTitle(String value){ this.value = value }

    @Override
    String toString(){ value }
    String getKey() { name() }
}
