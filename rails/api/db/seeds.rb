require "csv"

IMPORT_CSVS = %w[
  work_test_one
  work_test_two
]

@logger = ActiveSupport::Logger.new STDOUT
@logger.formatter = ActiveSupport::Logger::Formatter.new

def regist_csv(filename)
  @logger.debug filename + 'のレコードをデータベースに登録'

  columns = []
  model = filename.match(/db\/csv\/.+\/(.*)\.csv$/)[1].classify.constantize
  models = []
  CSV.foreach(filename).with_index(0) do |row, row_index|
    if row_index == 0
      columns = row
      next
    end

    data = {}
    columns.each_with_index do |column, column_index|
      data[column] = row[column_index]
    end

    models << data.update({ 'created_at' => Time.zone.now, 'updated_at' => Time.zone.now })
  end

  models.each_slice(1_000) do |inserts|
    model.insert_all inserts
  end
end

environment = ENV['RAILS_ENV'].present? ? ENV['RAILS_ENV'] : 'development'

ApplicationRecord.transaction do
  IMPORT_CSVS.reverse.each do |import_csv|
    model = import_csv.classify.constantize
    model.delete_all
  end

  IMPORT_CSVS.each do |import_csv|
    regist_csv('db/csv/' + environment + '/' + import_csv + '.csv')
  end
end
