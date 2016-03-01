require "spec_helper"

describe Lita::Handlers::Greet, lita_handler: true do
  it { is_expected.to route("hello dog").to(:say_hello) }
  it { is_expected.to route("hi dog").to(:say_hello) }
  it { is_expected.to route("yo!").to(:say_hello) }
  it { is_expected.to route("good morning").to(:say_hello) }
  it { is_expected.to route("good afternoon").to(:say_hello) }
  it { is_expected.to route("good evening").to(:say_hello) }
  it { is_expected.to route("good night").to(:say_hello) }
  it { is_expected.to route("howdy").to(:say_hello) }
  it { is_expected.to route("sup").to(:say_hello) }
  it { is_expected.to route("ahoy").to(:say_hello) }

  it { is_expected.to route("welcome John Doe").to(:welcome) }

  it "sends hello back the user who said hello" do
    send_message("Hi")
    expect(replies.last).to match(/^(ahoy|good (morning|afternoon|evening|night|nite)|hello|hey|hi!?(| .*)$|howdy|sup|yo!?$).*/i)
  end

  it "does not send a message when the user object is empty" do
    user = Lita::User.create("1", name: "")
    send_message("Hi", as: user)
    expect(replies.last).not_to match(/Hello/)
  end
end
