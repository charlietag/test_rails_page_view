class AddImpressionsCountToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :impressions_count, :int
  end
end
