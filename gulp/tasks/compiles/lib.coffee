
gulp        = require 'gulp'
bower       = require 'bower'
concat      = require 'gulp-concat'

config = require '../../config'
  
# bowerでインストールしたソースをまとめる
gulp.task 'compile:lib', ->
  bower.commands.install().on 'end', ->
    # jsを一つにまとめる
    gulp.src config.libs.js.map (e) -> "bower_components/#{e}"
      .pipe concat config.dist.libJs
      .pipe gulp.dest config.dist.dir
      
    # cssを一つにまとめる
    gulp.src config.libs.css.map (e) -> "bower_components/#{e}"
      .pipe concat config.dist.libCss
      .pipe gulp.dest config.dist.dir
      
    # そのまま配置
    gulp.src config.libs.static.map (e) -> "bower_components/#{e}"
      .pipe gulp.dest config.dist.dir