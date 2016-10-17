class NotebookShow {
    public notebook: INotebook;

    constructor(private $http, private $routeParams) {
        this.$http.get(`/notebooks/${$routeParams.id}.json`).then((result) => {
            console.log(result);
            this.notebook = result.data;
        });
    }
}

angular.module("notes").controller("NotebookShow", NotebookShow);
