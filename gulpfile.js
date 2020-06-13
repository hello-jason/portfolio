// Variables
var gulp = require('gulp');
var postcss = require('gulp-postcss');
var uncss = require('postcss-uncss'); // remove unused css
var csso = require('gulp-csso'); // minify css
var gzip = require('gulp-gzip'); // gzip compression

// Tasks
gulp.task('stylesheets', function () {
  var plugins = [
    uncss({
      html: ['./build/**/*.html'],
      ignore: []
    }),
  ];
  return gulp.src('./build/assets/stylesheets/**/*.css')
    // uncss
    // .pipe(postcss(plugins))
    // minify
    .pipe(csso())
    .pipe(gulp.dest('./build/assets/stylesheets'))
    // gzip
    .pipe(gzip())
    .pipe(gulp.dest('./build/assets/stylesheets'));
});

// // Scan site, remove unused css, minifiy css, gzip css
gulp.task('buildcss', gulp.series('stylesheets'));
