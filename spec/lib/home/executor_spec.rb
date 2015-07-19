require 'rails_helper'

RSpec.describe Home::Executor do
  let(:activity) { create(:activity) }
  let(:instance) { Home::Executor.new(activity) }

  describe '#modules' do
    subject { instance.modules }
    it { is_expected.to eql app_config.modules }
  end

  describe '#module_name' do
    subject { instance.module_name }

    let(:name) { activity.device_configuration.device.module_name }
    it { is_expected.to eql name }
  end

  describe '#exists_module?' do
    subject { instance.exists_module? }
    let(:modules) { ['ze', 'ederson'] }
    let(:name) { 'ederson' }

    before do
      expect(instance).to receive(:modules).and_return(modules)
      expect(instance).to receive(:module_name).and_return(name)
    end

    it { is_expected.to be_truthy }

    context 'when module not exists' do
      let(:name) { 'outra coisa' }
      it { is_expected.to be_falsey }
    end
  end
end
