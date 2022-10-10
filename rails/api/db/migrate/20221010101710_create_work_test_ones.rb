class CreateWorkTestOnes < ActiveRecord::Migration[7.0]
  def change
    create_table :work_test_ones do |t|
      t.string :work_column1, comment: 'workカラム１'
      t.string :work_column2, comment: 'workカラム２'
      t.string :work_column3, comment: 'workカラム３'

      t.timestamps
    end
  end
end
