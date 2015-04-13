var gulp   = require('gulp');
var uncss  = require('gulp-uncss');
var csso   = require('gulp-csso');
var gzip   = require('gulp-gzip');

gulp.task('uncss', function() {
  return gulp.src('build/assets/css/**/*.css')
    .pipe(uncss({
        html: ['build/**/*.html']
    }))
    .pipe(csso())
    .pipe(gulp.dest('./build/assets/css'));
});

gulp.task('gzip', function() {
  return gulp.src('build/assets/css/**/*.css')
    .pipe(uncss({
        html: ['build/**/*.html']
    }))
    .pipe(csso())
    .pipe(gzip())
    .pipe(gulp.dest('./build/assets/css'));
});

// Default task
gulp.task('default', ['uncss', 'gzip']);
