class CafeSerializer < ActiveModel::Serializer
  attributes(*Cafe.attribute_names.map(&:to_sym))
  attributes :cafe_address
  attributes :cafe_media

  def cafe_address
    object.cafe_address
  end

  def cafe_media
    object.cafe_media
  end
end
