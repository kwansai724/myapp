module Batch
  module TestModule
    class NormalizedTestTwosImportBatch < NormalizedTableBatch
      RESOURCE_NAMES = %w[test_twos].freeze

      @constructor = lambda do |work|
        Test.new(
          column1: work.work_column4,
          column2: work.work_column5,
          column3: work.work_column6
        )
      end

      def self.transport
        Rails.logger.info "(#{Time.zone.now}) start #{name} #{__method__}"
        import_to_normalized_table(
          'Test',
          map_to_normalized_model(@constructor, WorkTestTwo.all),
          resource_registration: true,
          work: 'WorkTestTwo'
        )
        Rails.logger.info "(#{Time.zone.now}) complete #{name} #{__method__}"
      rescue StandardError => e
        Rails.logger.error e.to_s
        Rails.logger.error "abort #{name} #{__method__}"
        raise e
      end
    end
  end
end
