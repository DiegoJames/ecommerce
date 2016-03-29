require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :name => "MyString",
      :pricing => "9.99",
      :description => "MyText",
      :user => nil
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", products_path, "post" do
      assert_select "input#product_name[name=?]", "product[name]"
      assert_select "input#product_pricing[name=?]", "product[pricing]"
      assert_select "textarea#product_description[name=?]", "product[description]"
      assert_select "input#product_user[name=?]", "product[user]"
    end
  end
end
