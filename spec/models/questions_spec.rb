require "rails_helper"

RSpec.describe Question, type: :model do
  it "titleとcontentが入っていれば有効であること" do
    question = Question.new(
      title: "hoge",
      content: "hogehoge",
    )
    expect(question).to be_valid
  end
end
