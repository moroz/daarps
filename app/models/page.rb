class Page < ActiveRecord::Base
  validate :check_html_syntax
  include HamlTools

  private

  def check_html_syntax
    unless validate_haml(self.content)
      errors.add(:content, "has syntax errors")
    end
  end
end
