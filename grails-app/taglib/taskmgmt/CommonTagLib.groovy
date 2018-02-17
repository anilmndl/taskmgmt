package taskmgmt

class CommonTagLib {

//    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    static namespace = "common"

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
}
