module UsersHelper
  def declension(num, form_1, form_2, form_3)
    num_declesion = num % 10

    return form_3 if num % 100 >= 11 && num % 100 < 20

    case num_declesion
    when 0, 5..9
      form_3
    when 1
      form_1
    else
      form_2
    end
  end
end
