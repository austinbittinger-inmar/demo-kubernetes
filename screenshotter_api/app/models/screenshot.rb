class Screenshot
  include Mongoid::Document

  field :url, type: String
  field :base64, type: String
  field :time, type: Time
end