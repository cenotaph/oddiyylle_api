class EntrySerializer
  include JSONAPI::Serializer
  attributes :cookie, :name, :email, :municipality, :contact_details, :submitted, :anonymous, :comments
  attribute :ysound do |object|
    object.ysound.blank? ? nil :  object.ysound.url
  end
  attribute :yword do |object|
    object.yword.blank? ? nil :  object.yword.url
  end
  # attribute :doorbell do |object|
  #   object.try(:doorbell).service_url
  # end
  attribute :homestory do |object|
    object.homestory.blank? ? nil :  object.homestory.url
  end
end
