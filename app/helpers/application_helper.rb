module ApplicationHelper
  def textilize(str)
    raw(RedCloth.new(str).to_html)
  end

  def default_title
    I18n.t('default_title')
  end
end
