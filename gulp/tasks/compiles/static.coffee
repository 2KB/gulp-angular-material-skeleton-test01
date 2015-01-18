gulp        = require 'gulp'
config = require '../../config'

# public 以下をwebappに配置
gulp.task 'compile:static', ->
  gulp.src config.sources.static
    .pipe gulp.dest config.dist.dir