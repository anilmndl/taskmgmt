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
        if (attrs.status == "default") {
            output = "<span class=\"label label-default\"> " + attrs.name + "</span>"
        } else if (attrs.status == "success") {
            output = "<span class=\"label label-default\"> " + attrs.name + "</span>"
        } else {
            output = "n/a"
        }
        out << output
    }

    def dateFormat = { attrs ->
        def output = ""
        if (attrs.dateValue != null) {
            output = new SimpleDateFormat("EEE, dd MMMMMMMMMM yyyy").format(attrs.dateValue)
        } else {
            output = "<span class=\"alert-info\"><em>No Data</em></span>"
        }
        out << output
    }

    def dateFormatWithTime = { attrs ->
        def output = ""
        if (attrs.dateValue != null) {
            output = new SimpleDateFormat("hh:mm a, EEE, dd MMMMMMMMMM yyyy").format(attrs.dateValue)
        } else {
            output = "<span class=\"alert-info\"><em>No Data</em></span>"
        }
        out << output
    }
}
