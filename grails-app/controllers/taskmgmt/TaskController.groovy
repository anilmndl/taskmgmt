package taskmgmt

class TaskController {

    /**
     * display the list of tasks
     * @return
     */
    def list() {
        // added a comment
        render view: "list",
                model:
                        [
                                tasks: Task.list()
                        ]
    }

    def detail(){

    }

    def edit(){
        
    }


    def tada() {
        //tada() is when employee gets boored with doing what they are supposed to do and get some fun time
        redirect action: "list"
        //Why are you here if you don't wana work.
        //you're fired
    }

    def listssss(){

    }
}
