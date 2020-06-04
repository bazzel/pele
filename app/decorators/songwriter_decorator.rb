# frozen_string_literal: true

#:nodoc:
class SongwriterDecorator < ApplicationDecorator
  delegate_all

  def title
    name
  end
end
