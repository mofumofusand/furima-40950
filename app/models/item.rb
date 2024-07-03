class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user



  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :area
  belongs_to :bear
  belongs_to :number_of_day


  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :bear_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :number_of_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :name, presence: true
  validates :content, presence: true
  validates :image, presence: true

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }

  
end
