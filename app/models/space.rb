class Space < ApplicationRecord
  belongs_to :user

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :country, presence: true
end
