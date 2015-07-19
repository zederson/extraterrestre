require 'rails_helper'

RSpec.describe Home::Lamp::Philips do

  let(:activity) { create(:activity) }
  let(:instance) { Home::Lamp::Philips.new(activity) }

  describe '#initialize' do
    subject { instance }
    it { expect(subject.activity).to eql activity }
  end

  describe '#execute' do
    let(:content) { '{ "lamps": [ { "name": "Quarto 1", "on": true }, { "name": "Lateral", "on": true } ] }' }

    before do
      expect(instance).to receive(:content).and_return(content)
      allow(instance).to receive(:send_signal).with(anything)
    end

    subject { instance.execute }
    it { is_expected.to be_truthy }
  end
end
