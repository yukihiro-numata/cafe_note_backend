shared_context 'user_authorized!' do
  let!(:user) { create(:user) }
  before do
    Grape::Endpoint.before_each do |endpoint|
      allow(endpoint).to receive(:current_user).and_return(user)
    end
  end
  after do
    Grape::Endpoint.before_each nil
  end
end
