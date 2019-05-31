class PokerController < ApplicationController

  def home
    @input_content = params[:input_card]
    @result_content = params[:content]
    if params[:error_message] == nil
      params[:error_message] = []
    end
    @error_content = params[:error_message]
  end

  def check
    content = params[:card]
    result = PokerRepository.request_check_poker(content)
    if result[:success]
      redirect_to controller: 'poker', action: 'home', content: result[:message], input_card: content, error_message: nil
    else
      redirect_to controller: 'poker', action: 'home', content: nil, input_card: content, error_message: result[:message]
    end

  end
end
