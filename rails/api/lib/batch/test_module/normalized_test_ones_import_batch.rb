module Batch
  module TestModule
    class NormalizedTestOnesImportBatch < NormalizedTableBatch
      RESOURCE_NAMES = %w[v2/test_ones].freeze

      @constructor = lambda do |work|
        Test.new(
          column1: work.work_column1,
          column2: work.work_column2,
          column3: work.work_column3
        )
      end

      def self.transport
        Rails.logger.info "(#{Time.zone.now}) start #{name} #{__method__}"
        import_to_normalized_table(
          'Test',
          map_to_normalized_model(@constructor, WorkTestOne.all),
          resource_registration: true,
          work: 'WorkTestOne'
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
