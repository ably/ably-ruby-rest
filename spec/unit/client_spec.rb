# encoding: utf-8
require 'spec_helper'

describe Ably::Rest::Client do
  subject do
    Ably::Rest::Client.new(client_options)
  end

  context 'initializer options' do
    context 'default agent' do
      let(:client_options) { { key: 'appid.keyuid:keysecret' } }

      it 'should return Ably::AGENT identifier' do
        expect(subject.agent).to eq(Ably::AGENT)
      end

      it 'should show ably-ruby ruby and ably-ruby-rest identifier' do
        expect(subject.agent).to match(/^ably-ruby\/\d.\d.\d ruby\/\d.\d.\d ably-ruby-rest$/)
      end
    end

    context 'custom agent' do
      let(:client_options) { { key: 'appid.keyuid:keysecret', agent: 'my-custom-agent/1.1' } }

      it 'should show my-custom-agent/1.1' do
        expect(subject.agent).to eq('my-custom-agent/1.1')
      end
    end
  end
end
