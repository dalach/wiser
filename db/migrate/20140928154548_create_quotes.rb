class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :content
      t.string :source
      t.integer :author_id

      t.timestamps
    end
  end
end
