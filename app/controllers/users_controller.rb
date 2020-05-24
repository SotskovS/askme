class UsersController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
  	@user = User.new(
  		name: 'Vasya',
  	  username: 'inst',
      avatar_url: nil
  	)

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('24.05.2020')),
      Question.new(text: 'В чем смысл?', created_at: Date.parse('24.05.2020'))
    ]
  end
end
