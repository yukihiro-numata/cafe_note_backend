require 'rails_helper'

RSpec.describe CafeMediaForm do
  describe 'validates' do
    describe 'media_type' do
      subject { CafeMediaForm.new(media_type: media_type, url: 'https://example.com').valid? }

      context 'normal' do
        let!(:media_type) { :google_map }
        it 'valid? should return true' do
          expect(subject).to be_truthy
        end
      end

      context 'abnormal' do
        it 'valid? should return false without argument' do
          expect(CafeMediaForm.new(url: 'https://example.com').valid?).to be_falsey
        end

        where(:media_type) { %w[test] }
        with_them do
          it 'valid? should return false with invalid argument' do
            expect(subject).to be_falsey
          end
        end
      end
    end

    describe 'url' do
      subject { CafeMediaForm.new(media_type: :google_map, url: url).valid? }

      context 'normal' do
        where(:url) { %w[https://example.com http://example.com https://example.com/test https://example.com?foo=bar] }
        with_them do
          it 'valid? should return true' do
            expect(subject).to be_truthy
          end
        end
      end

      context 'abnormal' do
        it 'valid? should return false without argument' do
          expect(CafeMediaForm.new(media_type: :google_map).valid?).to be_falsey
        end

        where(:url) { %w[example.com http//example.com htt://example.com] }
        with_them do
          it 'valid? should return false with invalid argument' do
            expect(subject).to be_falsey
          end
        end
      end
    end
  end
end
