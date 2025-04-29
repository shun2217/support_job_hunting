class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.human_model_name
    I18n.t("activerecord.models.#{model_name.i18n_key}")
  end
end
