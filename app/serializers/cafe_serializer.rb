class CafeSerializer < ActiveModel::Serializer
  attributes(*Cafe.attribute_names.map(&:to_sym))
  attributes :cafe_address

  def cafe_address
    object.cafe_address
  end
end
