
gulp        = require 'gulp'
coffee      = require 'gulp-coffee'
concat      = require 'gulp-concat'
ngAnnotate  = require 'gulp-ng-annotate'
uglify      = require 'gulp-uglify'

browserify  = require 'browserify'
vinyl      = require 'vinyl-source-stream'

templateCache = require 'gulp-angular-templatecache'

config = require '../../config'

# script系をまとめたタスク
gulp.task 'compile:script', ->
  gulp.start 'compile:view', 'compile:browserify'


# main.jsをbrowserify
gulp.task 'compile:browserify', ->
  browserify
      entries: [ config.sources.appJs ]
    .bundle()
    .pipe vinyl config.dist.appJs
    .pipe gulp.dest config.dist.dir
    
# view以下のものをコンパイルして、angular用のテンプレートキャッシュにする
gulp.task 'compile:view', ->
  gulp.src config.sources.view
    .pipe templateCache {standalone: true} 
    .pipe concat 'templates.js'
    .pipe gulp.dest 'app/js'





    
    
    

# coffeeをコンパイルして app.coffee.js にまとめる
gulp.task 'compile:coffee', ->
  gulp.src sources.coffee
    .pipe coffee()
    .pipe ngAnnotate()
    .pipe uglify()
    .pipe concat 'app.coffee.js'
    .pipe gulp.dest 'target/webapp/'

# jsをコンパイルして app.js にまとめる
gulp.task 'compile:js', ->
  gulp.src sources.js
    .pipe ngAnnotate()
    # .pipe uglify()
    .pipe concat 'app.js'
    .pipe gulp.dest 'target/webapp/'

    