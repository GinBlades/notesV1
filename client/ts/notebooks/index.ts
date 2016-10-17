class NotebookIndex {
    public notebooks: INotebook[];

    constructor(private $http) {
        this.$http.get(`/notebooks.json`).then((result) => {
            console.log(result);
            this.notebooks = result.data;
        });
    }
}

angular.module("notes").controller("NotebookIndex", NotebookIndex);
