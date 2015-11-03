module HamlTools
  extend ActiveSupport::Concern

  def render_as_haml(string,context)
    raw(Haml::Engine.new(string).render(context))
  end

  def validate_haml(string,path = nil)
    path ||= ["#{::Rails.root}/app/views","#{::Rails.root}/app/views/pages"]
    contr = PagesController.new
    #contr.response = ActionController::Response.new()
    scope = ActionView::Base.new(path, {}, PagesController)
    #scope.template_format = 'html'
    engine = Haml::Engine.new(string, :format => :html5).render(scope)
    true
  rescue Haml::SyntaxError, Haml::Error
    return false
  rescue NameError
  end
end
