class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :column1, comment: 'カラム１'
      t.string :column2, comment: 'カラム２'
      t.string :column3, comment: 'カラム３'

      t.timestamps
    end
  end
end
