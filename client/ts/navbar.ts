class NavbarCtrl {
    constructor(private $http, private $location) { }
    public signOut() {
        // This does sign out, but causes an error rather than redirecting.
        // Will I continue using devise? Maybe.
        this.$http.delete("/users/sign_out").then(() => {
            this.$location.path("/");
        });
    }
}

angular.module("notes")
.component("navbar", {
    templateUrl: "navbar.html",
    controller: NavbarCtrl
});
