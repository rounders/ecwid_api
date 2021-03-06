require "spec_helper"

describe EcwidApi::Client do
  subject { client }

  describe "#store_url" do
    its(:store_url) { "http://app.ecwid.com/api/v3/12345" }
  end

  describe "#get", faraday: true do
    it "delegates to the Faraday connection" do
      expect(subject.send(:connection)).to receive(:get).with("categories", parent: 1)

      subject.get "categories", parent: 1
    end

    it "returns a Faraday::Response" do
      subject.get("categories", parent: 1).is_a?(Faraday::Response).should be_true
    end
  end
end