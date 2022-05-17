# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#
class Product < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    has_one_attached :image, :dependent => :destroy

    has_many :comments, dependent: :delete_all
    has_many :product_categories, dependent: :delete_all
    has_many :categories, -> { where(visible: true) }, through: :product_categories

    accepts_nested_attributes_for :categories

    validates :title, presence: true
    validates :description, presence: true

end
