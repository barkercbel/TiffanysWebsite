class Gallery < ApplicationRecord
  
  has_attached_file :image, styles: { large: "600x600>", thumb: "150x150#" }, s3_protocol: :https, s3_host_name: 's3-us-west-2.amazonaws.com', default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
end
