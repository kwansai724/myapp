module Api
  class ApiController < ApplicationController
    skip_before_action :verify_authenticity_token

    def response_bad_request(messages = nil)
      body = { error: 'Bad Request' }
      body[:messages] = messages
      render status: :bad_request, json: body
    end
  end
end
