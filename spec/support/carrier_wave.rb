# frozen_string_literal: true

RSpec.configure do |config|
  config.after do
    root = Pathname(CarrierWave::Uploader::Base.root.call)
    root.exist? && root.rmtree
  end
end
