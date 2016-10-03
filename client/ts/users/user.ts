class User {
    public username: string;

    constructor(private $http) {
        $http.get("/users/current").then((results) => {
            console.log(results);
        });
    }
}

angular.module("notes")
.service("User", User);
