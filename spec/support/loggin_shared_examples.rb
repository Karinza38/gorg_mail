RSpec.shared_examples "a logged users only endpoint" do |method, action, action_params|
  # Same behavior is triggered also with either `def something; 'some value'; end`
  # or `define_method(:something) { 'some value' }`
  before(:each) do
    self.public_send(method, action, params: action_params)
  end

  it { is_expected.to respond_with :redirect }
end
