class ModifyShopPhoto < ActiveRecord::Migration[5.2]
  def up
    change_column_default :shops, :picture, from: nil, to: "https://i.pinimg.com/originals/c4/af/a0/c4afa0ab58a1343be2b944ec28a5fdae.jpg"
  end

  def down
    change_column_default :shops, :picture, from: "https://i.pinimg.com/originals/c4/af/a0/c4afa0ab58a1343be2b944ec28a5fdae.jpg", to: nil
  end
end
