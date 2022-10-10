class CreateWorkTestTwos < ActiveRecord::Migration[7.0]
  def change
    create_table :work_test_twos do |t|
      t.string :work_column4, comment: 'workカラム４'
      t.string :work_column5, comment: 'workカラム５'
      t.string :work_column6, comment: 'workカラム６'

      t.timestamps
    end
  end
end
