class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :brand

  has_attached_file :avatar, styles: { large: "500x500#", medium: "300x300#", thumb: "70x70#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
