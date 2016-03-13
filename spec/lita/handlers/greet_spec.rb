require "spec_helper"

describe Lita::Handlers::Greet, lita_handler: true do
  it { is_expected.to route("hello").to(:say_hello) }
  it { is_expected.to route("hi there").to(:say_hello) }
  it { is_expected.to route("yo!").to(:say_hello) }
  it { is_expected.to route("heeeyyyy").to(:say_hello) }
  it { is_expected.to route("greetings").to(:say_hello) }
  it { is_expected.to route("gooooooooood morning").to(:say_hello) }
  it { is_expected.to route("good afternoon").to(:say_hello) }
  it { is_expected.to route("Good evening").to(:say_hello) }
  it { is_expected.to route("good night!").to(:say_hello) }
  it { is_expected.to route("Good Nite").to(:say_hello) }
  it { is_expected.to route("howdy").to(:say_hello) }
  it { is_expected.to route("sup!").to(:say_hello) }
  it { is_expected.to route("ahoy there").to(:say_hello) }

  it { is_expected.to route("welcome John Doe").to(:welcome) }

  it "sends hello back to the user who said hello" do
    send_message("Hello")
    expect(replies.last).to match(/Hello/)
  end

  it "sends good morning back to the user name (since no mention_name is supplied) who greeted it" do
    user = Lita::User.create("1", name: "Stephen")
    send_message("Good morning!", as: user)
    expect(replies.last).to match(/Good morning Stephen/)
  end

  it "sends howdy back to the mention_name of the user who greeted it" do
    user = Lita::User.create("2", name: "Robert", mention_name: "Bob")
    send_message("Howdy", as: user)
    expect(replies.last).to match(/Howdy Bob/)
  end

  it "does not send a message when the user object is empty" do
    user = Lita::User.create("1", name: "")
    send_message("Hi", as: user)
    expect(replies.last).not_to match(/Hello/)
  end
end
