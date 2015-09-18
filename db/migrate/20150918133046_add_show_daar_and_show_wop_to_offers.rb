class AddShowDaarAndShowWopToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :show_daar, :boolean, :default => true
    add_column :offers, :show_wop, :boolean, :default => true
  end
end
