package taskmgmt

class DeleteTagLib {
    //static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "delete"

    def hello = { attrs ->
        def output =''
        if(attrs.flag!="deleted"){
            output="<g:link controller=\"TaskController\" class=\"btn btn-sucess btn-xs\" action=\"delete(attrs.id)\" id=\"attrs.id\">Delete</g:link>"
        }else{
            //do nothing
        }

      //  <a href="#" >
       // <g:link controller="employee" action="profile" id="7">Jane Doe</g:link>
       // if(attrs.status == "default"){
       //     output = "<span class=\"label label-default\"> " + attrs.name + "</span>"
       // }else if(attrs.status == "success"){
      //      output = "<span class=\"label label-default\"> " + attrs.name + "</span>"
       // }else{
        //    output = "n/a"
       // }
        out << output
    }
}
