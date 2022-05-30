class HumanNameSynesthesium < ApplicationRecord
  belongs_to :user

  mount_uploader :color, ColorUploader 

  VALID_NAME_REGEX =/\A[ぁ-んー－]+\z/

    with_options presence: true do
    validates :name, uniqueness: true, format: { with: VALID_NAME_REGEX, message: 'Full-width characters.' }
  end

end
