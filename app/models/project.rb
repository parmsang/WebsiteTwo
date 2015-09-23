class Project < ActiveRecord::Base

  validates :title, presence: true
  validates :description, presence: true

  has_attached_file :image, #:styles => {  :large =>"750x750>",
                                        #  :medium => "300x300>" },
                                          :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
