# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SongDecorator do
  let(:decorator) { described_class.new(song) }

  describe 'title_and_songwriter' do
    subject(:title_and_songwriter) { decorator.title_and_songwriter }

    let(:song_title) { 'Warehouse' }
    let(:song) { create(:song, title: song_title, songwriter: songwriter) }

    describe 'without songwriter' do
      let(:songwriter) { nil }

      it { is_expected.to have_css('.text-truncate', text: song_title) }
      it { is_expected.to have_css('.text-truncate', count: 1) }
    end

    describe 'with songwriter' do
      let(:songwriter_name) { 'Dave Matthews' }
      let(:songwriter) { create(:songwriter, name: songwriter_name) }

      it { is_expected.to have_css('.text-truncate', text: song_title) }

      it do
        expect(title_and_songwriter).to have_css(
          '.text-black-50.text-truncate',
          text: " - #{songwriter_name}"
        )
      end

      it { is_expected.to have_css('.text-truncate', count: 2) }
    end

    describe '#formatted_tag_list' do
      subject(:formatted_tag_list) { decorator.formatted_tag_list }

      let(:song) { create(:song, tag_list: 'lorem, ipsum') }

      it do
        expect(formatted_tag_list).to have_css(
          'small.mr-2 span.badge.badge-light',
          count: 2
        )
      end

      it { is_expected.to have_css('.badge', text: 'lorem') }
      it { is_expected.to have_css('.badge', text: 'ipsum') }
    end
  end
end
