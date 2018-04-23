<!-- Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>

                <h2 class="modal-title" id="exampleModalLongTitle">Delete ${controllerName.capitalize()}</h2>
            </div>

            <div class="modal-body">
                <h4>Are you sure you want to delete this ${controllerName.toLowerCase()}?</h4>
            </div>

            <div class="modal-footer">
                <table class="table table-responsive">
                    <button type="button" class="btn btn-success" data-dismiss="modal"><i
                            class="fa fa-times"
                            aria-hidden="true"></i> No</button>
                    <g:form controller="${controllerName}" action="delete" id="${data.id}"
                            method="POST">
                        <button class="btn btn-danger"><i class="fa fa-trash"
                                                          aria-hidden="true"></i> Yes
                        </button>
                    </g:form>
                </table>
            </div>
        </div>
    </div>
</div>
%{--end Modal--}%