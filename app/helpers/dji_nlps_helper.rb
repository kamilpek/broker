module DjiNlpsHelper

  def get_result(result)
    if result == 1
      "Pozytywny"
    elsif result == 2
      "Negatywny"
    else
      "b/d"
    end
  end

end
