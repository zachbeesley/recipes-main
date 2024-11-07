class Recipe < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    
    has_many :ingredients, dependent: :destroy, inverse_of: :recipe
    accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: :all_blank

    has_many :steps, dependent: :destroy
    accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true

    has_many :tags, dependent: :destroy
    accepts_nested_attributes_for :tags, reject_if: :all_blank, allow_destroy: true



    def self.ransackable_attributes(auth_object = nil)
        ["dish_name", "dish_type"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["image_attachment", "image_blob", "user"]
    end

end
