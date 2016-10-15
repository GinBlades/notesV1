interface INote {
    name: string;
    body: string;
}

class ShowNote {
    public note: INote;

    constructor(private $http, private $routeParams) {
        this.$http.get(`/notes/${$routeParams.id}.json`).then((result) => {
            console.log(result);
            this.note = result.data;
        });
    }
}

angular.module("notes").controller("ShowNote", ShowNote);
