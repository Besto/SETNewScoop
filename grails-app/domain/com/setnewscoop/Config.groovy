package com.setnewscoop

class Config {

    String configName
    String configValue
    String configGroup
    String configStatus

    static constraints = {
        configName maxSize: 25, nullable: true, unique: true
        configValue maxSize: 100, nullable: true
        configGroup maxSize: 20, nullable: true
        configStatus maxSize: 1, nullable: true
    }

    static {
        println "################### initializing Config Domain ######################"

        //TODO load data from table
        Config titleMrTh = Config.findByConfigName('title_mr_th')
        Constant.titleMrTh = titleMrTh.configValue

        println "################### End initializing Config Domain ######################"
    }
}
