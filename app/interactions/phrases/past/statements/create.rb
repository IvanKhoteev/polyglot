module Phrases
  module Past
    module Statements
      class Create < Phrases::Present::Create
        def execute
          create_phrase_for_i
          create_phrase_for_you
          create_phrase_for_we
          create_phrase_for_they
          create_phrase_for_he
          create_phrase_for_she
        end

        private

        def create_phrase_for_i
          word.phrases.create ru: "Я #{ru['past_i']}", en: "I #{en['specific_past_statement']}"
        end

        def create_phrase_for_you
          word.phrases.create ru: "Ты #{ru['past_you']}", en: "You #{en['specific_past_statement']}"
        end

        def create_phrase_for_we
          word.phrases.create ru: "Мы #{ru['past_we']}", en: "We #{en['specific_past_statement']}"
        end

        def create_phrase_for_they
          word.phrases.create ru: "Они #{ru['past_they']}", en: "They #{en['specific_past_statement']}"
        end

        def create_phrase_for_he
          word.phrases.create ru: "Он #{ru['past_he']}", en: "He #{en['specific_past_statement']}"
        end

        def create_phrase_for_she
          word.phrases.create ru: "Она #{ru['past_she']}", en: "She #{en['specific_past_statement']}"
        end
      end
    end
  end
end
