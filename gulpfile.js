var gulp   = require('gulp');
var uncss  = require('gulp-uncss');
var sass   = require('gulp-sass');
var concat = require('gulp-concat');
var csso   = require('gulp-csso');

gulp.task('default', function() {
  return gulp.src('build/assets/css/**/*.css')
    .pipe(sass())
    .pipe(concat('main.css'))
    .pipe(uncss({
        html: ['build/**/*.html']
    }))
    .pipe(csso())
    .pipe(gulp.dest('./out'));
});
