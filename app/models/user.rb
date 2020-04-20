class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable
  has_many :books,dependent: :destroy
  attachment :profile_image, destroy: false
  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, presence: true
  validates :name, {length: {in: 2..20}}
  validates :introduction, {length: {maximum: 50 }}
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
