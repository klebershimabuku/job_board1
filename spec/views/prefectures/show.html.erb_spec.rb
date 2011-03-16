require 'spec_helper'

describe "prefectures/show.html.erb" do
  before(:each) do
    @prefecture = assign(:prefecture, stub_model(Prefecture,
      :province_id => 1,
      :website => "Website"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Website/)
  end
end
