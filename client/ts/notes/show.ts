interface INote {
    name: string;
    body: string;
}

class ShowNote {
    public note: INote;

    constructor(private $http, private $routeParams, private $location) {
        this.$http.get(`/notes/${$routeParams.id}.json`).then((result) => {
            console.log(result);
            this.note = result.data;
        });
    }

    public destroyNote() {
        if(!confirm("Are you sure you want to destroy this note?")) { return; }

        this.$http.delete(`/notes/${this.note.id}`).then(() => {
            this.$location.path(`/notes`);
        });
    }
}

angular.module("notes").controller("ShowNote", ShowNote);
