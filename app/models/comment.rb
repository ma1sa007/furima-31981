class Comment < ApplicationRecord
  belongs_to :user# usersテーブルとのアソシエーション
  belongs_to :prototype# prototypesテーブルとのアソシエーション

  validates :text, presence: true
end
