/// <reference path="../typings/index.d.ts" />
angular.module("notes", ["ngRoute", "templates"])
    .config(($routeProvider) => {
        $routeProvider
            .when("/", {
                templateUrl: "home.html"
            })
            .when("/notes/new", {
                templateUrl: "notes/new.html",
                controller: "NewNote",
                controllerAs: "ctrl"
            })
            .when("/notes/:id", {
                templateUrl: "notes/show.html",
                controller: "ShowNote",
                controllerAs: "ctrl"
            })
            .otherwise("/");
    });
