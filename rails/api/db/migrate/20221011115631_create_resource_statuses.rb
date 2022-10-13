class CreateResourceStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :resource_statuses do |t|
      t.string :type, null: false, comment: 'リソースタイプ'
      t.string :name, null: false, comment: 'リソース名'
      t.bigint :version, default: 0, comment: 'バージョン'
      t.string :target_date, limmit: 8, comment: 'ターゲット日付'
      t.column :last_updated_at, 'DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)', comment: 'ファイル更新日時'
      t.column :created_at, 'DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)', comment: '作成日時'
      t.column :updated_at, 'DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6)', comment: '更新日時'

      t.index %w[type name], unique: true
    end
  end
end
