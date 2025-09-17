# 表示するカラムを順番に代入
columns = %w[name industry_id status desire login_id my_page operation]

# カラム名を日本語に変換しjson化
json.columns columns.map { |col| human_column_name(Company, col) }

json.data @companies.map { |company|
  columns.map{ |col|
    value = case col
    when "my_page" # リンクにしたいカラム
      link = company.send(col) rescue nil
      link.present? ? link_to(human_column_name(Company, col), link, target: "_blank", rel: "noopener") : nil
    when "login_id" # コピーできるようにしたいカラム
      copy_btn = button_tag "📋", type: "button", class: "btn copy-btn", data: { value: company.send(col) }
      text = content_tag(:div, company.send(col), class: "text-part")
      content_tag(:div, copy_btn + text, class: "split-cell")
    when "operation" # 編集ボタン
      edit_btn = link_to("編集", edit_company_path(company), class: "btn btn-primary btn-sm")
      delete_btn = link_to("削除", company_path(company),
                            data: { turbo_method: :delete, turbo_confirm: "本当に削除しますか？" },
                            class: "btn btn-danger btn-sm")
      edit_btn + delete_btn
    when "status", "desire" # ENUM型の場合
      I18n.t("activerecord.enums.company.#{col}.#{company.send(col)}")
    when "industry_id" # 別のモデルから引っ張る
      company.industry.name rescue nil
    else
      company.send(col) rescue nil # その他普通のカラム
    end
  }
} 
