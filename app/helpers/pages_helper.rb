module PagesHelper

  def get_nlp(nlp)
    if nlp == 1
      "Większość artykułów wyrażała pozytywne opinie."
    elsif nlp == 2
      "Większość artykułów wyrażała negatywne opinie."
    else
      "b/d"
    end
  end

end
