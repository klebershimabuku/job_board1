require 'spec_helper'

describe "agencies/index.html.erb" do
  before(:each) do
    assign(:agencies, [
      stub_model(Agency,
        :content => "MyText"
      ),
      stub_model(Agency,
        :content => "MyText"
      )
    ])
  end

  it "renders a list of agencies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
