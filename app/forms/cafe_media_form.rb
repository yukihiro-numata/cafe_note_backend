class CafeMediaForm
  include Virtus.model
  include ActiveModel::Model

  attribute :media_type, String
  attribute :url, String

  validates :media_type, presence: true, inclusion: { in: CafeMedium.media_types.keys }
  validates :url, presence: true, format: /\A#{URI::regexp(%w(http https))}\z/
end
