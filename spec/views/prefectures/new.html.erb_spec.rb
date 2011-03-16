require 'spec_helper'

describe "prefectures/new.html.erb" do
  before(:each) do
    assign(:prefecture, stub_model(Prefecture,
      :province_id => 1,
      :website => "MyString"
    ).as_new_record)
  end

  it "renders new prefecture form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => prefectures_path, :method => "post" do
      assert_select "input#prefecture_province_id", :name => "prefecture[province_id]"
      assert_select "input#prefecture_website", :name => "prefecture[website]"
    end
  end
end
