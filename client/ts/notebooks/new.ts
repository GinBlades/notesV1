class NotebookNew {
    public notebook: INotebook;

    constructor(private $http, private $location) { }

    public createNotebook() {
        this.$http.post("/notebooks", this.notebook).then((result) => {
            console.log(result);
            this.$location.path("/");
        });
    }
}

angular.module("notes").controller("NotebookNew", NotebookNew);
