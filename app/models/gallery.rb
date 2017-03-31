class Gallery < ApplicationRecord
  
  has_attached_file :image, styles: { large: "600x600>", thumb: "150x150#" }, s3_protocol: :https, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
end
