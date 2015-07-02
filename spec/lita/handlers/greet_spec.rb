require "spec_helper"

describe Lita::Handlers::Greet, lita_handler: true do
  it { is_expected.to route("hello dog").to(:say_hello) }
  it { is_expected.to route("hi dog").to(:say_hello) }
  it { is_expected.to route("yo!").to(:say_hello) }
  it { is_expected.to route("good morning").to(:say_hello) }
  it { is_expected.to route("howdy").to(:say_hello) }

  it { is_expected.to route("welcome John Doe").to(:welcome) }

  it "sends hello back the user who said hello" do
    send_message("Hi")
    expect(replies.last).to match(/Hello/)
  end
end
