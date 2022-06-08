class Contact < ApplicationRecord
    validates :name, presence: true, length: { maximum: 255 }
    validates :email, presence: true, length: { maximum: 255 }
    validates :message, presence: true, length: { maximum: 65535 }
end
