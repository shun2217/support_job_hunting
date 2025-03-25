* ファイル構造
    * コントローラ
        * ページ毎にディレクトリを作る
        * {ディレクトリ名}::{名前} < ApplicationController としてクラスを作る

* ページ
    * ホーム
        * ここだけはディレクトリは作らない
    * 会社一覧
    * 業界一覧
    * 自己分析
    * エントリーシート一覧
    * Todoリスト

* モデル
    * 会社(company)
        * 名前(name)
        * 業界id(industry_id)
        * 基本情報(infomation)
        * 強み
        * 弱み
        * イベント(event)
        * 状態(status)
    * 業界(industry)
        * 名前(name)
        * 