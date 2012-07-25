require 'spec_helper'

describe OmniAuth::Strategies::Instapaper do
  before :each do
    @request = double('Request')
    @request.stub(:params) { {} }
  end

  subject do
    OmniAuth::Strategies::Instapaper.new(nil, @options || {}).tap do |strategy|
      strategy.stub(:request) { @request }
    end
  end

  describe '#client_options' do
    it 'has correct Instapaper site' do
      subject.options.client_options.site.should eq('https://www.instapaper.com')
    end

    it 'has correct access token url' do
      subject.options.client_options.access_token_path.should eq('/api/1/oauth/access_token')
    end
  end

  describe '#uid' do
    it 'returns the uid from raw_info' do
      subject.stub(:raw_info) { { "type" => "user", "user_id" => 54321, "username" => "TestUserOMGLOL" } }
      subject.uid.should eq(54321)
    end
  end

  describe '#info' do
    context 'when data is present in raw info' do
      it 'returns the name' do
        subject.stub(:raw_info) { { "type" => "user", "user_id" => 54321, "username" => "TestUserOMGLOL" } }
        subject.info['name'].should eq('TestUserOMGLOL')
      end
    end
  end

  describe '#extra' do
    before :each do
      @raw_info_hash = { "misc" => [:something => "else in the hash"] }
      subject.stub(:raw_info) { @raw_info_hash }
    end

    it 'returns a Hash' do
      subject.extra.should be_a(Hash)
    end
  end
end