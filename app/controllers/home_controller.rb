class HomeController < ApplicationController
  def dashboard
    @last_recent_boards = Board.order(created_at: :desc).limit(10)
  end
end
