class HomeCtrl {
    public notebooks: INotebook[];
    public notes: INote[];
    constructor(private $http) {
        this.$http.get("/notebooks.json").then((result) => {
            console.log(result.data);
            this.notebooks = result.data;
        });
        this.$http.get("/notes.json").then((result) => {
            console.log(result.data);
            this.notes = result.data;
        });
    }
}

angular.module("notes")
.controller("HomeCtrl", HomeCtrl);
