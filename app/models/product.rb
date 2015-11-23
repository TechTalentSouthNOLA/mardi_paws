class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :brand
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_items

  validates :name, :description, :category_id, :brand_id, presence: true
  validates :name, uniqueness: true
  validates :current_price, numericality: {greater_than_or_equal_to: 0.01}

  has_attached_file :avatar, styles: { large: "500x500#", medium: "300x300#", thumb: "70x70#" }, default_url: ":style_missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  private

  def ensure_not_referenced_by_any_line_items
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end
