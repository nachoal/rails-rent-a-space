class Space < ApplicationRecord
  belongs_to :user

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :country, presence: true

  include PgSearch
    pg_search_scope :search_by_name_description_city_and_country,
      against: [ :name, :description, :city, :country, :capacity ],
      using: {
        tsearch: { prefix: true }
      }

  geocoded_by :address_geo
  after_validation :geocode, if: :will_save_change_to_address?

  def address_geo
    [address, city, country].compact.join(', ')
  end
end
