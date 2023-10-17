class Entity < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :entity_groups
    has_many :groups, through: :entity_groups
end
