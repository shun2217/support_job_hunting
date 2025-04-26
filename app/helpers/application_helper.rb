module ApplicationHelper
  # ページごとの完全なタイトルを返す
  def full_title(page_title = '')
    base_title = "就活情報管理"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def sidebar_link_item(name, path)
    class_name = 'channel'
    class_name << ' active' if current_page?(path)

    content_tag :li, class:class_name do
      link_to name, path, class: 'channel_name'
    end
  end

  def human_column_name(model_class, column)
    if column == "operation"
      I18n.t("activerecord.attributes.#{model_class.model_name.i18n_key}.#{column}")
    else
      model_class.human_attribute_name(column)
    end
  end
end