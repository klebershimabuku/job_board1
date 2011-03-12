require 'spec_helper'

describe "agencies/edit.html.erb" do
  before(:each) do
    @agency = assign(:agency, stub_model(Agency,
      :content => "MyText"
    ))
  end

  it "renders the edit agency form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => agency_path(@agency), :method => "post" do
      assert_select "textarea#agency_content", :name => "agency[content]"
    end
  end
end
