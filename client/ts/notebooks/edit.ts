class NotebookEdit {
    public notebook: INotebook;

    constructor(private $http, private $routeParams, private $location) {
        this.$http.get(`/notebooks/${$routeParams.id}.json`).then((result) => {
            console.log(result);
            this.notebook = result.data;
        });
    }

    public updateNotebook() {
        this.$http.put(`/notebooks/${this.notebook.id}`, this.notebook).then((result) => {
            console.log(result);
            this.$location.path(`/notebooks/${this.notebook.id}`);
        });
    }
}

angular.module("notes").controller("NotebookEdit", NotebookEdit);
