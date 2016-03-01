module Lita
  module Handlers
    class Greet < Handler

      route(/^(ahoy|greetings|good (morning|afternoon|evening|night|nite)|hello|hey|hi!?(| .*)$|howdy|sup|yo!?$).*/i, :say_hello)
      route(/^welcome (.+)/i, :welcome)

      def say_hello(response)
        return if response.user.name.empty?
        reply_to_name = response.user.metadata['mention_name'].nil? ?
                        "#{response.user.name}" :
                        "#{response.user.metadata['mention_name']}"
        bot_greeting = ["Ahoy", "Greetings", "Hello", "Hey", "Hi", "Howdy", "Sup"].sample
        response.reply "#{bot_greeting} #{reply_to_name}!"
      end

      def welcome(response)
        response.reply "Hello and Welcome #{response.matches[0][0]}!"
      end


    end

    Lita.register_handler(Greet)
  end
end
