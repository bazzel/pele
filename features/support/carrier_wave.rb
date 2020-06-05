# frozen_string_literal: true

After do
  root = Pathname(CarrierWave::Uploader::Base.root.call)
  root.exist? && root.rmtree
end
