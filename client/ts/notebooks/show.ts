class NotebookShow {
    public notebook: INotebook;

    constructor(private $http, private $routeParams, private $location) {
        this.$http.get(`/notebooks/${$routeParams.id}.json`).then((result) => {
            console.log(result);
            this.notebook = result.data;
        });
    }

    public destroyNotebook() {
        if(!confirm("Are you sure you want to destroy this notebook?")) { return; }

        this.$http.delete(`/notebooks/${this.notebook.id}`).then(() => {
            this.$location.path(`/notebooks`);
        });
    }
}

angular.module("notes").controller("NotebookShow", NotebookShow);
