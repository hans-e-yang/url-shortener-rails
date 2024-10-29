class ChangeAliasToNotNullInUrls < ActiveRecord::Migration[7.2]
  def change
    change_column_null :urls, :alias, false
    change_column_null :urls, :body, false

    add_index :urls, :alias, unique: true
  end
end
