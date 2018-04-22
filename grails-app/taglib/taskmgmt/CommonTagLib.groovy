package taskmgmt

import java.text.SimpleDateFormat
import groovy.time.TimeCategory

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
            output = new SimpleDateFormat("EEE, dd MMM yyyy").format(attrs.dateValue)
        } else {
            output = "<span class=\"label label-warning\"><em>No Data</em></span>"
        }
        out << output
    }

    def dateFormatWithTime = { attrs ->
        def output = ""
        if (attrs.dateValue != null) {
            output = new SimpleDateFormat("hh:mm a, EEE, dd MMMMMMMMMM yyyy").format(attrs.dateValue)
        } else {
            output = "<span class=\"label label-warning\"><em>No Data</em></span>"
        }
        out << output
    }
    def vacationMode = { attrs ->
        def output = ""
        if (attrs.IsOnVacation) {
            output = "<span class=\"label label-warning\"><em>On</em></span>"
        } else {
            output = "<span class=\"label label-primary\"><em>Off</em></span>"
        }
        out << output
    }
    def dueDate = { attrs ->
        def output = ""
        if (attrs.dateValue != null) {
            use(groovy.time.TimeCategory) {
                def duration = attrs.dateValue - new Date()
                if (duration.days >= 3 && duration.hours > 0 && duration.minutes > 0) {
                    output = "<div class=\"label label-success\">" +
                            new SimpleDateFormat("dd MMMMMMMMMM yyyy").format(attrs.dateValue) + "</div>"
                } else if (duration.days >= 1 && duration.hours > 0 && duration.minutes > 0 && duration.days < 3) {
                    output = "<div class=\"label label-warning\">" +
                            new SimpleDateFormat("dd MMMMMMMMMM yyyy").format(attrs.dateValue) + "</div>"
                } else if (duration.days < 1 && duration.hours < 0 && duration.minutes < 0) {
                    output = "<div class=\"label label-danger\">" + new SimpleDateFormat("dd MMMMMMMMMM yyyy").format(attrs.dateValue) + "</div>"
                } else {
                    output = "<div class=\"label label-danger\">" + new SimpleDateFormat("dd MMMMMMMMMM yyyy").format(attrs.dateValue) + "</div>"
                }
            }
        } else {
            output = "<span class=\"label label-info\"><em>No Data</em></span>"
            //            https://stackoverflow.com/questions/2755835/duration-between-two-dates-in-groovy

        }

        out << output
    }
}
