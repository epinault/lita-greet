module Lita
  module Handlers
    class Greet < Handler

      route(/^(hello|hi|good morning|howdy|yo!?$|hey).*/i, :say_hello)
      route(/^welcome (.+)/i, :welcome)
    
      def say_hello(response)
        reply_to_name = response.user.metadata['mention_name'].nil? ?
                         "#{response.user.name}" :
                        "#{response.user.metadata['mention_name']}"
        response.reply "Hello #{reply_to_name}!"
      end

      def welcome(response)
        response.reply "Hello and Welcome #{response.matches[0][0]}!"
      end


    end

    Lita.register_handler(Greet)
  end
end
