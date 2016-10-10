interface INote {
    name: string;
    body: string;
}

class NewNote {
    public newNote: INote;

    constructor(private $http) {
    }

    public createNote() {
        console.log(this.newNote);
        this.$http.post("/notes", this.newNote).then((result) => {
            console.log(result);
        });
    }
}

angular.module("notes").controller("NewNote", NewNote);
