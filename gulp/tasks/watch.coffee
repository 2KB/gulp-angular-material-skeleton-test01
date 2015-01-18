gulp = require 'gulp'

config = require '../config'

require './compile'
require './server'

gulp.task 'watch', ->
	gulp.start 'watch:compile', 'watch:reload'

# ソースを監視してコンパイル
gulp.task 'watch:compile', ->
	gulp.watch config.sources.bower, ['compile:lib']
	gulp.watch config.sources.js, ['compile:browserify']
	gulp.watch config.sources.view, ['compile:view']
	gulp.watch config.sources.css, ['compile:style']
	gulp.watch config.sources.static, ['compile:static']

# ビルドされたファイルを監視してリロード
gulp.task 'watch:reload', ->
	gulp.watch "#{config.dist.dir}/**/*", ['reload']