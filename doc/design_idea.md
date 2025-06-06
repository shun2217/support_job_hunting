* ファイル構造
    * コントローラ
        * Baseコントローラに基本機能を全て入れ、それを各コントローラが継承する
        * 足りない機能があったらそのコントローラに追記していく感じ
    * ビュー
        * headerはパーシャルを作り統一
        * sidebarも同様
        * 基本的には全て同様のデータテーブルで表示
        * 編集と新規作成はどちらもformパーシャルを使って表示する

* ページ
    * ホーム
    * 会社一覧
    * 業界一覧
    * イベント一覧
    * エントリーシート一覧

* モデル
    * 会社(company)
        * 関連
            * 業界(が親)
            * イベント(が子)
        * カラム
            * 名前(name) 必須 
            * 業界ID(industry_id)
            * 基本情報(infomation)
            * 強み (strength)
            * 弱み (weakness)
            * 状態(status) ENUM型 必須　初期 0
                * 0 検討中(consideration)
                * 1 エントリー中(entry)
                * 2 インターン参加予定(intern)
                * 3 選考参加予定(scheduled_of_selection)
                * 4 選考中(ongoing_of_selection)
                * 5 内定済(done_of_selection)
                * 6 辞退・落選済（failed_of_selection）
            * 志望度 (desire) ENUM型 必須　初期 0
                * 0 未 (undecided)
                * 1 低 (low)
                * 2 中 (middle)
                * 3 高 (high)
            * マイページ(my_page)
            * メモ (memo)
    * 業界(industry)
        * 関連
            * 会社 (が子)
        * カラム
            * 名前(name)　必須
            * 興味(interest) ENUM型 必須 初期 0
                * 0 未 (undecided)
                * 1 低 (low)
                * 2 中 (middle)
                * 3 高 (high)
            * メモ(memo)
    * イベント(event)
        * 関連
            * 会社(が親)
            * エントリーシート(が子)
        * カラム
            * 名前(name) 必須
            * 開始日時(started_at)
            * 終了日時(ended_at)
            * 会社ID (company_id)
            * メモ(memo)
    * エントリーシート (es)
        * 関連
            * イベント(が親)
        * カラム
            * タイトル(title) 
            * 問 (question) 
            * 回答 (answer)
            * イベントID(event_id)
            * 文字数(words)
            * メモ(memo)

* その他
    * 良く使うコマンド
        * bundle exec annotate
        * rails db:migrate:reset 
        * rails generate model モデル名
        * rails db:rollback
        * rails db:migrate
        * rails db:seed # これ使う前にresetやる
        * RAILS_ENV=production rs 本番環境用のサーバー
    * 環境の切り替え
        * 開発➡本番
            * rails assets:precompile
            * RAILS_ENV=production rs
        * 本番➡開発
            * rails assets:clobber(jsやcssを更新する場合)
            * rs


