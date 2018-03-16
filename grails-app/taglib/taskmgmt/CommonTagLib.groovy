package taskmgmt

import com.sun.jmx.snmp.tasks.TaskServer

import javax.xml.ws.Service
import java.text.SimpleDateFormat

class CommonTagLib {

//    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    static namespace = "common"

    TaskService taskService

    def hello = { attrs ->
        def output = ''
        if(attrs.status == "default"){
            output = "<span class=\"label label-default\"> " + attrs.name + "</span>"
        }else if(attrs.status == "success"){
            output = "<span class=\"label label-default\"> " + attrs.name + "</span>"
        }else{
            output = "n/a"
        }
        out << output
    }

    def dateFormat = { attrs, body ->
        out << new SimpleDateFormat("dd-mm-yyyy").format(attrs.date)
    }
}
