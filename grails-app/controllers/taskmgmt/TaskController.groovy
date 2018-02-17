package taskmgmt

class TaskController {

    /**
     * display the list of tasks
     * @return
     */
    def list() {
        render view: "list",
                model:
                        [
                                tasks: Task.list()
                        ]
    }

    def redirect() {
        //change



<<<<<<< HEAD
    }
    def detail() {
//
    }
=======

    def tada() {
        //tada() is when employee gets boored with doing what they are supposed to do and get some fun time
        redirect action: "list"
        //Why are you here if you don't wana work.
        //you're fired
    }

    def listssss(){
>>>>>>> 41d43341e4f909febdc879e56bcb872ce84cb6fe

    def edit() {
        //
    }

    def update(){
        render view: "list"
    }
def su(){sdufsdifhiojas}
    }

