require 'spec_helper'

describe "prefectures/edit.html.erb" do
  before(:each) do
    @prefecture = assign(:prefecture, stub_model(Prefecture,
      :province_id => 1,
      :website => "MyString"
    ))
  end

  it "renders the edit prefecture form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => prefecture_path(@prefecture), :method => "post" do
      assert_select "input#prefecture_province_id", :name => "prefecture[province_id]"
      assert_select "input#prefecture_website", :name => "prefecture[website]"
    end
  end
end
