/// <reference path="../typings/index.d.ts" />
angular.module("notes", ["ngRoute", "templates"])
    .config(($routeProvider) => {
        $routeProvider
            .when("/", {
                templateUrl: "home.html"
            })
            .otherwise("/");
    });
