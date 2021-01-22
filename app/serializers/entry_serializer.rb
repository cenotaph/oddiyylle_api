class EntrySerializer
  include JSONAPI::Serializer
  attributes :cookie, :name, :email, :contact_details, :submitted
  attribute :ysound do |object|
    object.try(:ysound).service_url
  end
  attribute :yword do |object|
    object.try(:yword).try(:service_url)
  end
  # attribute :doorbell do |object|
  #   object.try(:doorbell).service_url
  # end
  attribute :homestory do |object|
    object.try(:homestory).service_url
  end
end
