class Restaurant < ApplicationRecord
  has_many :working_hours, inverse_of: :restaurant, dependent: :destroy
  has_many :ratings, inverse_of: :restaurant, dependent: :destroy

  mount_uploader :logo, LogoUploader

  validates :name, :description, :cousine, :is_open, presence: true
  validates :logo, presence: true, if: proc { |r| r.is_open? }
  validates :name, uniqueness: { case_sensitive: false }
  validates :logo, file_size: { less_than: 1.megabytes }
  validates :logo, file_content_type: { allow: ['image/jpeg', 'image/jpg', 'image/png'] }

  accepts_nested_attributes_for :working_hours
end
