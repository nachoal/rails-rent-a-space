class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :spaces
  has_many :rentals

  mount_uploader :photo, PhotoUploader

  before_create :photo_or_default

  def photo_or_default
    @photo = photo.file.nil? ? "https://res.cloudinary.com/oulrij/image/upload/v1540927173/auczgzyhap7oluqylboo.jpg" : photo
  end
end
