module Lita
  module Handlers
    class Greet < Handler

      route(/^(ahoy|good (morning|afternoon|evening|night|nite)|greetings|hello|hey|hi!?(| .*)$|howdy|sup|yo!?$).*/i, :say_hello)
      route(/^welcome (.+)/i, :welcome)

      def say_hello(response)
        return if response.user.name.empty?
        bot_response = response.message.body.gsub(/[?!]+/, "").gsub(/ #{robot.name}/i, "")
        response.reply "#{bot_response} #{(response.user.mention_name || response.user.name)}"
      end

      def welcome(response)
        response.reply "Hello and Welcome #{response.matches[0][0]}!"
      end

    end

    Lita.register_handler(Greet)
  end
end
