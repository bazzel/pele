# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ScoreDecorator do
  let(:decorator) { described_class.new(score) }

  describe '#attachment_badge' do
    subject(:attachment_badge) { decorator.attachment_badge }

    let(:score) do
      create(
        :score,
        tablature_notation: tablature_notation,
        standard_notation: standard_notation,
        chord_notation: chord_notation
      )
    end

    let(:tablature_notation) { false }
    let(:standard_notation) { false }
    let(:chord_notation) { false }

    it do
      expect(attachment_badge).to have_css(
        '.badge.badge-pill.badge-light.border.py-1.mr-2',
        text: 'score.pdf'
      )
    end

    describe 'with tablature_notation' do
      let(:tablature_notation) { true }

      it do
        expect(attachment_badge).to have_css(
          '.badge a span.pele-icons',
          text: 'tablature'
        )
      end

      it { is_expected.to have_css('.badge a', text: 'score.pdf') }
    end

    describe 'with standard_notation' do
      let(:standard_notation) { true }

      it do
        expect(attachment_badge).to have_css(
          '.badge a span.pele-icons',
          text: 'standard'
        )
      end

      it { is_expected.to have_css('.badge a', text: 'score.pdf') }
    end

    describe 'with chord_notation' do
      let(:chord_notation) { true }

      it do
        expect(attachment_badge).to have_css(
          '.badge a span.pele-icons',
          text: 'chords'
        )
      end

      it { is_expected.to have_css('.badge a', text: 'score.pdf') }
    end

    describe 'with multiple notations' do
      let(:tablature_notation) { true }
      let(:chord_notation) { true }

      it do
        expect(attachment_badge).to have_css(
          '.badge a span.pele-icons',
          text: 'tablature'
        )
      end

      it do
        expect(attachment_badge).to have_css(
          '.badge a span.pele-icons',
          text: 'chords'
        )
      end

      it { is_expected.to have_css('.badge a', text: 'score.pdf') }
    end

    describe 'without any notation' do
      it do
        expect(attachment_badge).to have_css(
          '.badge a .material-icons',
          text: 'attach_file'
        )
      end
    end
  end
end
