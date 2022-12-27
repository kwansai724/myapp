module Api
  class TestsController < Api::ApiController
    def index
      return response_bad_request 'パラメータを入力してください' if params[:column1].blank?

      tests = Test.where(column1: params[:column1])
      tests = tests.map { |test| test&.attributes }
      json = JSON.generate(tests)

      render status: :ok, plain: json, content_type: 'application/json'
    end
  end
end
