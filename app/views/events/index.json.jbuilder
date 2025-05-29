# 表示するカラムを順番に代入
columns = %w[name company_id started_at ended_at operation]

# カラム名を日本語に変換しjson化
json.columns columns.map { |col| human_column_name(Event, col) }

json.data @events.map { |event|
  columns.map{ |col|
    value = case col
    when "operation" # 編集ボタン
      edit_btn = link_to("編集", edit_event_path(event), class: "btn btn-primary btn-sm")
      delete_btn = link_to("削除", event_path(event),
                            data: { turbo_method: :delete, turbo_confirm: "本当に削除しますか？" },
                            class: "btn btn-danger btn-sm")
      edit_btn + delete_btn
    when "company_id" # 別のモデルから引っ張る
      event.company.name rescue nil
    when "started_at", "ended_at" # 日付の場合
      event.send(col).strftime("%Y年%m月%d日 %H:%M") rescue nil
    else
      event.send(col) rescue nil # その他普通のカラム
    end
  }
} 
