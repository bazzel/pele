# frozen_string_literal: true

#:nodoc:
class WelcomeController < ApplicationController
  skip_after_action :verify_authorized
  def index; end
end
