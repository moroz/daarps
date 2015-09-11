module OffersHelper
  def textilize(str)
    raw(RedCloth.new(str).to_html)
  end
end
