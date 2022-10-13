module Batch
  module TestModule
    class TestImportBatch
      def self.import
        Rails.logger.info 'import test start!'
        ApplicationRecord.transaction do
          Rails.logger.info 'delete all Test table'
          Test.delete_all
          NormalizedTestOnesImportBatch.transport
          NormalizedTestTwosImportBatch.transport
        end
        Rails.logger.info 'completed importing test!'
      end
    end
  end
end
