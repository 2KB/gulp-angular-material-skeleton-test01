
# TODO 

# main.jsをbrowserify
gulp.task 'browserify', ->
  browserify
      entries: ['./app/js/main.js']
    .bundle()
    .pipe vinyl 'bundle.js'
    .pipe gulp.dest 'target/webapp/'

