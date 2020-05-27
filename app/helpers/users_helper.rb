module UsersHelper
	def declension(num)
    num_declesion = num % 10
  	if num_declesion == 0 || num_declesion.between?(5,9) || num % 100 >= 11 && num % 100 < 20
      'вопросов'
    elsif num_declesion == 1
      'вопрос'
    else
      'вопроса'
    end
  end
end
