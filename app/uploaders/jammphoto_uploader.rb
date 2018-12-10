class JammphotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
