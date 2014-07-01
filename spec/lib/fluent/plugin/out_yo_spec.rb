describe 'Fluent::YoOutput' do
  before do
    Fluent::Test.setup
  end

  let(:config) do
    <<-EOC
api_key foobar
    EOC
  end

  let(:tag) { 'testing.yo' }

  let(:driver) { Fluent::Test::OutputTestDriver.new(Fluent::YoOutput, tag).configure(config) }

  context 'configuration' do
    it 'should be configured' do
      expect(driver.instance.api_key).to eq 'foobar'
    end

    context 'when empty api key' do
      let(:config) { 'api_key ' }
      it {
        expect { driver }.to raise_error(Fluent::ConfigError)
      }
    end
  end

  context 'send yo' do
    it 'should send you yo' do
      expected_request = stub_request(:post, "http://api.justyo.co/yoall/").
                            with(:body => {"api_token" => "foobar"})
      driver.run do
        driver.emit({'yo' => 'yo'})
      end

      expect(expected_request).to have_been_made.once
    end
  end
end
