class CreateUrls < ActiveRecord::Migration[7.2]
  def change
    create_table :urls do |t|
      t.text :body
      t.text :alias
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
