class HumanNameSynesthesium < ApplicationRecord
  belongs_to :user

  VALID_NAME_REGEX =/\A[ぁ-んー－]+\z/

    with_options presence: true do
    validates :name, format: { with: VALID_NAME_REGEX, message: 'Full-width characters.' }
  end

  validates :color, uniqueness: true
end
