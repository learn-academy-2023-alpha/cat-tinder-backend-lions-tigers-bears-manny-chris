class Beast < ApplicationRecord
    validates :name, presence: true
    validates :age, presence: true
    validates :description, presence: true, length: {minimum: 10}
    validates :image, presence: true
end
