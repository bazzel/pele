# frozen_string_literal: true

module Search
  module Filter
    #:nodoc:
    class TagsComponent < ViewComponent::Base
      def initialize(q:, builder:)
        @q = q
        @builder = builder
      end

      private

      attr_reader :q, :builder

      alias f builder

      def title
        I18n.t('activerecord.attributes.song.tag_list')
      end

      # Stimulus
      def data_controller
        'tags'
      end
    end
  end
end
