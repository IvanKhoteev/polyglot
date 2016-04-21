module Phrases
  module Present
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
          word.phrases.create ru: "Я #{ru['present_i']}", en: "I #{en['common']}"
        end

        def create_phrase_for_you
          word.phrases.create ru: "Вы #{ru['present_you']}", en: "You #{en['common']}"
        end

        def create_phrase_for_we
          word.phrases.create ru: "Мы #{ru['present_we']}", en: "We #{en['common']}"
        end

        def create_phrase_for_they
          word.phrases.create ru: "Они #{ru['present_they']}", en: "They #{en['common']}"
        end

        def create_phrase_for_he
          word.phrases.create ru: "Он #{ru['present_he']}", en: "He #{en['specific_present_statement']}"
        end

        def create_phrase_for_she
          word.phrases.create ru: "Она #{ru['present_she']}", en: "She #{en['specific_present_statement']}"
        end
      end
    end
  end
end
