class Place < ApplicationRecord
  has_many :addresses, dependent: :destroy, inverse_of: :place
  accepts_nested_attributes_for :addresses, allow_destroy: true,
    reject_if: ->(attrs) { attrs['city'].blank? || attrs['street'].blank? }

  private

  def place_params
    params.require(:place).permit(:title, addresses_attributes: [:id, :city, :street])
  end
end
