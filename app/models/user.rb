class User < ApplicationRecord

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true,format: {with: /[\w\-\._]+@[\w\-\._]+\.[A-Za-z]+/ }
  validates :password_digest, presence: true
  has_many :rooms 
  has_many :profiles, dependent: :destroy
  has_many :active_relationships ,foreign_key: 'follower_id',class_name: 'Relationship', dependent: :destroy
  has_many :follows, through: :active_relationships
  has_many :passive_relationships, foreign_key: 'follow_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :passive_relationships
  has_many :messages
  has_one_attached :eyecatch
  attr_accessor :image

  def follow(user)
    active_relationships.create(follow_id: user.id)
  end

  def matchers
    User.where(id: passive_relationships.select(:follower_id))
    .where(id: active_relationships.select(:follow_id))
  end

  def decode64(image)
    if image.present?
      prefix = image[/(image)(\/.*)(?=\;)/]
      type = prefix.sub(/(image)(\/)/, '')
      data = Base64.decode64(image.sub(/data:#{prefix};base64,/, ''))
      filename = "#{Time.zone.now.strftime('%Y%m%d%H%M%S%L')}.#{type}"
      File.open("#{Rails.root}/tmp/#{filename}", 'wb') do |f|
        f.write(data)
      end
      self.eyecatch.attach(io: File.open("#{Rails.root}/tmp/#{filename}"), filename: filename)
      FileUtils.rm("#{Rails.root}/tmp/#{filename}")
    end
  end
end
