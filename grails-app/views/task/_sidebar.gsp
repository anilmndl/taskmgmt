<div class="col-sm-2 hidden-xs">
    <div class="affix sidebar">
        <ul class="nav nav-pills nav-stacked">
            <li><g:link controller="task" action="list"><i class="fa fa-paperclip"
                                                           aria-hidden="true"></i> List Tasks</g:link></li>
            <li><g:link controller="task" action="listCompleted"><i class="fa fa-suitcase"
                                                                    aria-hidden="true"></i> List Completed task</g:link></li>
            <hr>
            <label>Filters:</label>
            <li><input type="checkbox" name="taskStatus">Created Task</li>
            <li><input type="checkbox" name="taskStatus">Assigned Task</li>
            <li><input type="checkbox" name="taskStatus">Approaching due date</li>
        </ul>
    </div>
</div>