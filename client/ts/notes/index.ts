class NoteIndex {
    public notes: INote[];

    constructor(private $http) {
        this.$http.get(`/notes.json`).then((result) => {
            console.log(result);
            this.notes = result.data;
        });
    }
}

angular.module("notes").controller("NoteIndex", NoteIndex);
