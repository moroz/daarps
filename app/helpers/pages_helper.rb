module PagesHelper
  def render_as_haml(string,context)
    raw(Haml::Engine.new(string).render(context))
  end
end
