class Api::V1::BookingSerializer < Api::V1::BaseSerializer
  attributes :id, :email, :name,  :created_at, :updated_at

  # has_many :booking_items
end