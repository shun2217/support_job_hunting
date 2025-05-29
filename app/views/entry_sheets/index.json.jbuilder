# 表示するカラムを順番に代入
columns = %w[title event_id company words operation]

# カラム名を日本語に変換しjson化
json.columns columns.map { |col| human_column_name(EntrySheet, col) }

json.data @entry_sheets.map { |entry_sheet|
  columns.map{ |col|
    value = case col
    when "operation" # 編集ボタン
      edit_btn = link_to("編集", edit_entry_sheet_path(entry_sheet), class: "btn btn-primary btn-sm")
      delete_btn = link_to("削除", entry_sheet_path(entry_sheet),
                            data: { turbo_method: :delete, turbo_confirm: "本当に削除しますか？" },
                            class: "btn btn-danger btn-sm")
      edit_btn + delete_btn
    when "event_id" # 別のモデルから引っ張る
      entry_sheet.event.name rescue nil
    when "company" # 別のモデルから引っ張る
      entry_sheet.event.company.name rescue nil
    else
      entry_sheet.send(col) rescue nil # その他普通のカラム
    end
  }
} 
