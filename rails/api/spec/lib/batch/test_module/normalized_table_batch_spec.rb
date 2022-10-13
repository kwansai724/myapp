require 'rails_helper'

RSpec.describe Test, type: :model do
  describe '正規化Testテーブル取り込みバッチ' do
    context 'データ検証' do
      before do
        create_list(:work_test_one, 5)
        create_list(:work_test_two, 5)

        Batch::TestModule::NormalizedTestOnesImportBatch.transport
        Batch::TestModule::NormalizedTestTwosImportBatch.transport

        @test = Test.all
      end

      it '件数が正しい' do
        expect(@test.size).to eq(10)
      end

      it '各カラムの値が正しい' do
        model = @test.take
        work_test_ones = WorkTestOne.all

        expect(model.column1).to eq('00001')
        expect(model.column2).to eq(work_test_ones[0].work_column2)
        expect(model.column3).to eq(work_test_ones[0].work_column3)
      end
    end

    context 'workテーブルにレコードがない場合' do
      example '例外が発生する' do
        expect { Batch::TestModule::NormalizedTestOnesImportBatch.transport }.to raise_error(ActiveRecord::RecordNotFound, 'work_test_onesにレコードがありません。')
        expect { Batch::TestModule::NormalizedTestTwosImportBatch.transport }.to raise_error(ActiveRecord::RecordNotFound, 'work_test_twosにレコードがありません。')
      end
    end
  end
end