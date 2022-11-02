class ShopShowSerializer < ActiveModel::Serializer
  attributes(:id, :name, :address, :city, :state, :zip, :telephone, :website, :picture)
end