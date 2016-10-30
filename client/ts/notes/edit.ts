class NoteEdit {
    public note: INote;

    constructor(private $http, private $routeParams, private $location) {
        this.$http.get(`/notes/${$routeParams.id}.json`).then((result) => {
            console.log(result);
            this.note = result.data;
        });
    }

    public updateNote() {
        this.$http.put(`/notes/${this.note.id}`, this.note).then((result) => {
            console.log(result);
            this.$location.path(`/notes/${this.note.id}`);
        });
    }
}

angular.module("notes").controller("NoteEdit", NoteEdit);
