class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Vadim',
        username: 'installero',
        avatar_url: 'https://secure.gravatar.com/avatar/' \
          '71269686e0f757ddb4f73614f43ae445?s=100'
      ),
      User.new(id: 2, name: 'Misha', username: 'aristofun')
    ]
  end

  def new
  end

  def edit
  end

  def show
  	@user = User.new(
  		name: 'Vasya',
  	  username: 'insd',
      avatar_url: nil
  	)

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('24.05.2020')),
      Question.new(text: 'Где мой броневичок?', created_at: Date.parse('27.05.2020'))
    ]

    @new_question = Question.new
  end
end
