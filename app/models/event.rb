class Event < ApplicationRecord

  has_many :registrations, dependent: :destroy
  validates :name, :location, presence: true
  validates :description, length: { minimum: 25 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :capacity, numericality:
                          { only_integer: true, greater_than: 0 }
  validates :image_file_name, format: {
                        with: %r{\.(gif|jpg|png)\Z}i,
                        message: 'must be GIF, JPG or PNG image.'}

  scope :upcoming, -> { where("starts_at >= ?", Time.now).order("starts_at") }

  def free?
    price.blank? || price.zero?
  end

  def sold_out?
    (capacity - registrations.size) <= 0
  end

end
