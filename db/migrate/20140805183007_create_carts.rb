class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :title
      t.string :status
    end
  end
end
