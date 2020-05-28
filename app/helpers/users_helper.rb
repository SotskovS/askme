module UsersHelper
  def declension(num, form_1, form_2, form_3)
    num_declesion = num % 10
    if num_declesion == 0 || num_declesion.between?(5,9) || num % 100 >= 11 && num % 100 < 20
      form_3
    elsif num_declesion == 1
      form_1
    else
      form_2
    end
  end
end
