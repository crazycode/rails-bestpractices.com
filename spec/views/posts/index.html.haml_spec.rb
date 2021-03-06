require 'spec_helper'

describe "posts/index.html.haml" do
  before(:each) do
    assign(:posts, [
      stub_model(Post,
        :title => "Title",
        :body => "MyText"
      ),
      stub_model(Post,
        :title => "Title",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of posts" do
    render
    rendered.should have_selector("div.post a", :content => "Title".to_s, :count => 2)
  end
end
