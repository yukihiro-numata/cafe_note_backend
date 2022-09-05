require 'rails_helper'

RSpec.describe CafeMediaForm do
  describe 'validates' do
    describe 'media_type' do
      subject { CafeMediaForm.new(media_type: media_type, url: 'https://example.com').valid? }

      context 'normal' do
        let!(:media_type) { :google_map }
        it 'should return true' do
          expect(subject).to be_truthy
        end
      end

      context 'abnormal' do
        let!(:media_type) { 'test' }
        it 'should return false' do
          expect(subject).to be_falsey
        end
      end
    end
  end
end
