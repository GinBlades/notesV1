var gulp = require("gulp"),
    plumber = require("gulp-plumber"),
    sourceMaps = require("gulp-sourcemaps"),
    ts = require("gulp-typescript"),
    tsLint = require("gulp-tslint"),
    concat = require("gulp-concat"),
    sass = require("gulp-sass"),
    uglify = require("gulp-uglify"),
    ngAnnotate = require("gulp-ng-annotate"),
    templateCache = require("gulp-angular-templatecache"),
    jade = require("gulp-jade"),
    config = require("./assets.json");

gulp.task("tsc", () => {
    return gulp.src(config.js.app)
        .pipe(plumber())
        .pipe(sourceMaps.init())
        .pipe(ts())
        .pipe(ngAnnotate())
        .pipe(uglify())
        .pipe(concat("app.js"))
        .pipe(sourceMaps.write("."))
        .pipe(gulp.dest("../public"));
});

gulp.task("vendorJs", () => {
    return gulp.src(config.js.vendor)
        .pipe(concat("vendor.js"))
        .pipe(gulp.dest("../public"));
});

gulp.task("copyFonts", () => {
    return gulp.src(config.fonts)
        .pipe(gulp.dest("../public/fonts"));
});

gulp.task("copyMaps", () => {
    return gulp.src(config.js.maps)
        .pipe(gulp.dest("../public"));
});

gulp.task("sass", () => {
    return gulp.src("./sass/**/*.scss")
        .pipe(plumber())
        .pipe(sourceMaps.init())
        .pipe(sass({style: "compressed"}))
        .pipe(sourceMaps.write("."))
        .pipe(gulp.dest("../public"));
});

gulp.task("jade", () => {
    return gulp.src("./jade/**/*.jade")
        .pipe(plumber())
        .pipe(jade())
        .pipe(templateCache({standalone: true}))
        .pipe(gulp.dest("../public"));
});

gulp.task("watch", () => {
    gulp.watch("./ts/**/*.ts", ["tsc"]);
    gulp.watch("./sass/**/*.scss", ["sass"]);
    gulp.watch("./jade/**/*.jade", ["jade"]);
});

gulp.task("init", ["vendorJs", "copyFonts", "copyMaps"]);
gulp.task("default", ["watch", "tsc", "sass", "jade"]);
