class Schedule < ApplicationRecord
    validates :title, presence: true
    validates :contents, length: {maximum: 100}
end
