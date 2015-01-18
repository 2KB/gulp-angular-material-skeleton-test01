# gulp-angular-material-skeleton-test01

angular-materialをgulpとbowerで動かすためのスケルトン。

## 特徴

* angular-materialを使っている
* gulpでJavaScriptとCSSをまとめてる
* browserifyを使っている
* "gulp-angular-templatecache"でview用のファイルも一つにまとめている
* bowerでフロントのソースを管理している
* angular-ui-routerを使っている
* "Controller as xxx" の記法を使っている
* browserSyncでライブリロードつけている(うまく動かない時もあるが)

## 動かし方

node.jsを入れた後、bowerをグローバルに入れる必要あり。

npm install bower -g

ローカルに必要なライブラリをインストール

bower install  
npm install

その後、下記などで実行。ただ、なぜか最初が真っ白になるので、最初は手動でリロード(笑)

gulp clean-dev

主に参考にしたのは下記  
https://github.com/jakemmarsh/angularjs-gulp-browserify-boilerplate  
http://int128.hatenablog.com/entry/2014/07/02/004543  
