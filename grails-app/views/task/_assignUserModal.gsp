<!-- Modal -->
<div class="modal fade" id="assignUserModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>

                <h2 class="modal-title" id="exampleModalLongTitle">
                    <g:if test="${task.taskStatus==taskmgmt.enums.TaskStatus.ASSIGNED}">
                        Reassign User
                    </g:if>
                    <g:else>
                        Assign User
                    </g:else>
                </h2>
            </div>
            <g:form controller="task" action="assigned" id="${task.id}" method="POST">
                <div class="modal-body">
                    <div class="form-group">
                        <label><h4>User</h4></label>
                        <g:select class="btn btn-default dropdown-toggle" from="${userList}"
                                  name="user" optionKey="id"
                                  optionValue="firstName"
                                  noSelection="['': '--Users--']" required="required"/>
                    </div>
                </div>

                <div class="modal-footer">
                    <table class="table table-responsive">
                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i
                                class="fa fa-times"
                                aria-hidden="true"></i> Cancel</button>

                            <button type="submit" class="btn btn-success"><i class="fa fa-male"
                                                              aria-hidden="true"></i>
                <g:if test="${task.taskStatus==taskmgmt.enums.TaskStatus.ASSIGNED}">
                    Reassign
                </g:if>
                <g:else>
                    Assign
                </g:else>
                </button>
            </g:form>
        </table>
        </div>
        </div>
    </div>
</div>
%{--end Modal--}%