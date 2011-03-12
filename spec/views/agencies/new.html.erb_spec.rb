require 'spec_helper'

describe "agencies/new.html.erb" do
  before(:each) do
    assign(:agency, stub_model(Agency,
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new agency form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => agencies_path, :method => "post" do
      assert_select "textarea#agency_content", :name => "agency[content]"
    end
  end
end
