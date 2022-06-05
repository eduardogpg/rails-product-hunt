class AddUrlToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :url, :string, url:nil
  end
end
