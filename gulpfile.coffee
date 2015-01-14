# gulpfile.coffee: build script for front assets
#
# gulp        - build assets
# gulp watch  - build assets continuously
# gulp server - start a server with assets and mocked APIs

sources =
  bower:  'bower.json'
  coffee: 'app/**/*.coffee'
  js: 'app/**/*.js'
  less:   'app/**/*.less'
  static: 'public/**/*'

libs =
  js: [
    'angular/angular.min.js'
    'angular-route/angular-route.min.js'
  ]
  css:    ['bootstrap/dist/**/*.min.css']
  static: ['bootstrap/dist/**/*']


bower       = require 'bower'
del         = require 'del'
gulp        = require 'gulp'
coffee      = require 'gulp-coffee'
concat      = require 'gulp-concat'
less        = require 'gulp-less'
ngAnnotate  = require 'gulp-ng-annotate'
nodemon     = require 'gulp-nodemon'
uglify      = require 'gulp-uglify'

browserSync = require 'browser-sync'

gulp.task 'default', ['clean'], ->
  gulp.start 'compile:lib', 'compile:coffee', 'compile:less', 'compile:static'

gulp.task 'clean', (cb) ->
  del 'target/webapp/', cb

gulp.task 'watch', ->
  gulp.watch sources.bower,  ['compile:lib']
  gulp.watch sources.js, ['compile:js']
  # gulp.watch sources.coffee, ['compile:coffee']
  gulp.watch sources.less,   ['compile:less']
  gulp.watch sources.static, ['compile:static']

# bowerソースをlib.js lib.css にまとめる
gulp.task 'compile:lib', ->
  bower.commands.install().on 'end', ->
    gulp.src libs.js.map (e) -> "bower_components/#{e}"
      .pipe concat 'lib.js'
      .pipe gulp.dest 'target/webapp/'
    gulp.src libs.css.map (e) -> "bower_components/#{e}"
      .pipe concat 'lib.css'
      .pipe gulp.dest 'target/webapp/'
    gulp.src libs.static.map (e) -> "bower_components/#{e}"
      .pipe gulp.dest 'target/webapp/'

# coffeeをコンパイルして app.js にまとめる
gulp.task 'compile:coffee', ->
  gulp.src sources.coffee
    .pipe coffee()
    .pipe ngAnnotate()
    .pipe uglify()
    .pipe concat 'app.js'
    .pipe gulp.dest 'target/webapp/'

# jsをコンパイルして app.js にまとめる
gulp.task 'compile:js', ->
  gulp.src sources.js
    .pipe ngAnnotate()
    .pipe uglify()
    .pipe concat 'app.js'
    .pipe gulp.dest 'target/webapp/'

# lessをコンパイルして app.css にまとめる
gulp.task 'compile:less', ->
  gulp.src sources.less
    .pipe less()
    .pipe concat 'app.css'
    .pipe gulp.dest 'target/webapp/'

# public 以下をwebappに配置
gulp.task 'compile:static', ->
  gulp.src sources.static
    .pipe gulp.dest 'target/webapp/'


# browser-syncでサーバー起動。ファイル監視も行う
gulp.task 'server2', ->
  gulp.start 'watch', 'watch-reload'
  browserSync(
    port: 8888
    server: {
      baseDir: 'target/webapp/'
    }
  )

# browser-syncに更新の指令を出す
gulp.task 'reload', ->
  browserSync.reload()

# ビルドされたファイルを監視してリロード
gulp.task 'watch-reload', ->
  gulp.watch 'target/**/*',  ['reload']




# server起動。apimockも一緒に起動
gulp.task 'server', ['compile:apimock'], ->
  gulp.start 'watch', 'watch:apimock'
  nodemon
    script: 'target/apimock.js'
    watch: ['target/apimock.js', 'target/webapp/']
    env:
      port: 8888
      webapp: "#{__dirname}/target/webapp/"

gulp.task 'watch:apimock', ->
  gulp.watch 'apimock.coffee', ['compile:apimock']

gulp.task 'compile:apimock', ->
  gulp.src 'apimock.coffee'
    .pipe coffee()
    .pipe gulp.dest 'target/'
