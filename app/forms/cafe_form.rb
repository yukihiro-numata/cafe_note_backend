class CafeForm
  include Virtus.model
  include ActiveModel::Model

  attribute :name, String
  attribute :nearest_station, String
  attribute :transportation, String
  attribute :business_hours, String
  attribute :regular_holiday, String
  attribute :can_takeout, Boolean
  attribute :has_parking, Boolean
  attribute :has_wifi, Boolean
  attribute :has_power_supply, Boolean
  attribute :can_smoking, Boolean
  attribute :img_path, String
  attribute :post_code, String
  attribute :prefecture, String
  attribute :city, String
  attribute :address, String
  attribute :building, String
  attribute :medium, [CafeMediaForm]

  validates :name, presence: true
  validates :nearest_station, presence: true
  validates :transportation, presence: true
  validates :business_hours, presence: true
  validates :regular_holiday, presence: true
  validates :img_path, presence: true
  validates :post_code, presence: true, length: { is: 7 }
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :address, presence: true

  def save!
    ActiveRecord::Base.transaction do
      cafe = Cafe.create!(
        name: name,
        nearest_station: nearest_station,
        transportation: transportation,
        business_hours: business_hours,
        regular_holiday: regular_holiday,
        can_takeout: can_takeout,
        has_parking: has_parking,
        has_wifi: has_wifi,
        has_power_supply: has_power_supply,
        can_smoking: can_smoking,
        img_path: img_path,
      )

      medium_args = []
      medium.each do |media|
        medium_args << CafeMedium.new(cafe: cafe, media_type: media.media_type, url: media.url)
      end
      CafeMedium.import!(medium_args)

      cafe
    end
  end
end
