module Lita
  module Handlers
    class Greet < Handler

      route(/^(((ahoy|he+l{2,}+o+|he+y+|hi+)+( there)*)|go{2,}d (morning|afternoon|evening|night|nite)|greetings|howdy|sup|yo)+[!1?]*((\s)+Regexp.new(robot.config.robot.name))*[!1?]*$/i, :say_hello)
      route(/^welcome (.+)/i, :welcome)

      def say_hello(response)
        return if response.user.name.empty?
        bot_response = response.message.body.gsub(/[1?!]+/, "").gsub(/(\s)*#{robot.config.robot.name}(\s)*/i, "")
        response.reply "#{bot_response} #{(response.user.mention_name || response.user.name)}"
      end

      def welcome(response)
        response.reply "Hello and Welcome #{response.matches[0][0]}!"
      end

    end

    Lita.register_handler(Greet)
  end
end
