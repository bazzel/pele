# frozen_string_literal: true

json.array! @songwriters, partial: 'songwriters/songwriter', as: :songwriter
