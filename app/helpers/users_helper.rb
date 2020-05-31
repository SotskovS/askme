module UsersHelper
  def declension(num, form1, form2, form3)
    num_declesion = num % 10

    return form3 if (num % 100).between?(11,20)

    case num_declesion
    when 0, 5..9
      form3
    when 1
      form1
    else
      form2
    end
  end
end
