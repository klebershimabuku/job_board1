require 'spec_helper'

describe "prefectures/index.html.erb" do
  before(:each) do
    assign(:prefectures, [
      stub_model(Prefecture,
        :province_id => 1,
        :website => "Website"
      ),
      stub_model(Prefecture,
        :province_id => 1,
        :website => "Website"
      )
    ])
  end

  it "renders a list of prefectures" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Website".to_s, :count => 2
  end
end
