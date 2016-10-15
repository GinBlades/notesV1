interface INote {
    name: string;
    body: string;
}

class NewNote {
    public newNote: INote;

    constructor(private $http, private $location) {
    }

    public createNote() {
        this.$http.post("/notes", this.newNote).then((result) => {
            this.$location.path("/");
        });
    }
}

angular.module("notes").controller("NewNote", NewNote);
