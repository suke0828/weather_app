<!-- バッジ -->
[![codecov](https://codecov.io/gh/suke0828/weather_app/branch/main/graph/badge.svg)](https://codecov.io/gh/suke0828/weather_app)
[![CircleCI](https://circleci.com/gh/suke0828/weather_app.svg?style=shield&circle-token=4ec4b261b359eebaef7cd1d4941671ed8dd22a23)](https://app.circleci.com/pipelines/github/suke0828/weather_app)
[![GitHub issues](https://img.shields.io/github/issues/suke0828/weather_app)](https://github.com/suke0828/weather_app/issues)


<!-- アイキャッチ画像 -->
[<img width="300px" alt="お天気HISTORY_logo" src="https://user-images.githubusercontent.com/70358393/115185985-dda99700-a11b-11eb-9626-83d0b356fc58.png">](https://otenki-history.herokuapp.com/)</br>

-目次
-----------------
* [概要](お天気HISTORY)
* [App URL](appurl)
* [使用技術](#使用技術)
* [インフラ構成図](#インフラ構成図)
* [天気を取得する仕組み](#天気を取得する仕組み)
* [注意事項](#注意事項)
* [Authors](#authors)
* [使用API](#使用API)
</br></br>

# お天気HISTORY
### App URL
[https://otenki-history.herokuapp.com/](https://otenki-history.herokuapp.com/)</br></br>
今日の天気を自動で記録します</br>
都道府県別に過去の天気を見ることができます</br>
<!-- 簡単なデモ（使用例）などスクリーンショットやGIFアニメで表示 -->
<!-- index page -->
<img width="100%" alt="お天気HISTORY indexpage" src="https://user-images.githubusercontent.com/70358393/115184305-80f8ad00-a118-11eb-9cca-592aac0612dd.png"></br>
<!-- show page -->
<img width="100%" alt="神奈川県___お天気HISTORY showpage" src="https://user-images.githubusercontent.com/70358393/115185097-252f2380-a11a-11eb-839a-d8c0d96d2649.png"></br>

## 使用技術
・Ruby 3.0.0</br>
・Rails 6.1.3.1</br>
・MySQL 8.0.23</br>
・Docker / Docker-compose</br>
・RSpec </br>
・CircleCI CI/CD </br>
・OpenWeather(WeatherAPI) / One Call API</br>

## インフラ構成図
・Heroku</br>
・Heroku Scheduler</br>
・Heroku Postgres</br>

## 天気を取得する仕組み
[lib/tasks/import_csv.rake](lib/tasks/import_csv.rake)で都道府県(県庁所在地)のロケーションが書いてあるcsvファイルを読み込み、都道府県のデータをDBに保存</br>
[lib/api/open_weather_map/request.rb](lib/api/open_weather_map/request.rb)でHTTPリクエストを設定(gem httpclient使用)</br>
[lib/tasks/open_weather_api.rake](lib/tasks/open_weather_api.rake)のrake taskでapiを叩いて天気情報を取得し、DBに保存</br>

## 注意事項
・データは約7ヶ月でリセットされます</br>
・日本時間の正午12時に更新されます</br>
・各都道府県の県庁所在地のロケーションを参考に天気情報を取得しています

## Authors
suke0828

## 使用API
[・OpenWeather - WeatherAPI](https://openweathermap.org/api)
