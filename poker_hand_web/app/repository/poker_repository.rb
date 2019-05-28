require 'rest-client'
require 'json'

module PokerRepository
  BASE_URL = 'https://datht-poker-api.herokuapp.com/api/v1/'
  POKER_CHECK = 'poker'

  # APIを呼び出す
  # @param input_data: "H1 H13 H12 H11 H10"
  # @return hash { success: true, message: "message here" }
  def self.request_check_poker(input_data)
    response = RestClient.post BASE_URL + POKER_CHECK, {'cards' => [input_data]}.to_json, {content_type: :json, accept: :json}
    return analysis_response(JSON.parse(response.body))
  end

  # APIの結果の分節
  # @param response_body: APIの返却結果
  # @return hash { success: true, message: "message here" }
  private
  def self.analysis_response(response_body)
    result_hash = { success: true }
    if response_body.key?('success')
      result_hash[:success] = false
      result_hash[:message] = response_body['result']
    else
      result_hash[:message] = response_body['result'][0]['hand']
    end
    result_hash
  end
end