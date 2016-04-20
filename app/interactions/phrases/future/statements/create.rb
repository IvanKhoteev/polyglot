module Phrases
  module Future
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
          word.phrases.create ru: "Я #{ru['future_i']}", en: "I will #{en['common']}"
        end

        def create_phrase_for_you
          word.phrases.create ru: "Ты #{ru['future_you']}", en: "You will #{en['common']}"
        end

        def create_phrase_for_we
          word.phrases.create ru: "Мы #{ru['future_we']}", en: "We will #{en['common']}"
        end

        def create_phrase_for_they
          word.phrases.create ru: "Они #{ru['future_they']}", en: "They will #{en['common']}"
        end

        def create_phrase_for_he
          word.phrases.create ru: "Он #{ru['future_he']}", en: "He will #{en['common']}"
        end

        def create_phrase_for_she
          word.phrases.create ru: "Она #{ru['future_she']}", en: "She will #{en['common']}"
        end
      end
    end
  end
end
