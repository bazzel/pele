# frozen_string_literal: true

# #:nodoc:
class SongsController < ApplicationController
  def index
    @songs = Song.all
  end
end
