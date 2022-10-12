class ResourceStatus < ApplicationRecord
  # ActiveRecordのカラム名にtypeを使用できない仕様（Single table Inherritance[STI]）を回避するための設定
  self.inheritance_column = :_type_disabled
end
