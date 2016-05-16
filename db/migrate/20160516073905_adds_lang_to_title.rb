class AddsLangToTitle < ActiveRecord::Migration
  def change
    add_column :titles, :lang, :string
  end
end
