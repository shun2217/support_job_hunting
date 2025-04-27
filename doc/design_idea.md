* ファイル構造
    * コントローラ
        * Baseコントローラに基本機能を全て入れ、それを各コントローラが継承する
        * 足りない機能があったらそのコントローラに追記していく感じ
        * {名前} < BaseController としてクラスを作る
    * ビュー
        * headerはパーシャルを作り統一
        * sidebarも同様
        * 基本的には全て同様のデータテーブルで表示
        * 編集と新規作成はどちらもformパーシャルを使って表示する

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
            * 興味(interest) (高　中　低　未)　必須　初期は未
    * イベント(event)
        * 関連
            * 会社(が親)
            * エントリーシート(が子)
        * カラム
            * 名前(name) 必須
            * 開始日(started_at)
            * 終了日(ended_at)
            * 会社ID (company_id)
    * エントリーシート (es)
        * 関連
            * イベント(が親)
        * 問 (question)
        * 回答 (answer)
        * イベントID(event_id)

* ルール
    * コメントについて
        * #は使用についてコメントする際に使う（なんの変数なのか、何の処理をしているのか）
        * """はコードの意味についてコメントする際に使う（メソッドの使い方など）
        * ただしhtml内は全て<%#  %>で良い
* その他
    * 良く使うコマンド
        * bundle exec annotate
        * rails db:migrate:reset