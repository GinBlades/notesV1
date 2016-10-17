/// <reference path="../typings/index.d.ts" />
/// <reference path="./interfaces.ts" />
angular.module("notes", ["ngRoute", "templates"])
    .config(($routeProvider) => {
        $routeProvider
            .when("/", {
                templateUrl: "home.html",
                controller: "HomeCtrl",
                controllerAs: "ctrl"
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
            .when("/notebooks", {
                templateUrl: "notebooks/index.html",
                controller: "NotebookIndex",
                controllerAs: "ctrl"
            })
            .when("/notebooks/new", {
                templateUrl: "notebooks/new.html",
                controller: "NotebookNew",
                controllerAs: "ctrl"
            })
            .when("/notebooks/:id", {
                templateUrl: "notebooks/show.html",
                controller: "NotebookShow",
                controllerAs: "ctrl"
            })
            .when("/notebooks/:id/edit", {
                templateUrl: "notebooks/edit.html",
                controller: "NotebookEdit",
                controllerAs: "ctrl"
            })
            .otherwise("/");
    });
