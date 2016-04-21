module Phrases
  module Future
    module Negatives
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
          word.phrases.create ru: "Я не #{ru['future_i']}", en: "I will not #{en['common']}"
        end

        def create_phrase_for_you
          word.phrases.create ru: "Вы не #{ru['future_you']}", en: "You will not #{en['common']}"
        end

        def create_phrase_for_we
          word.phrases.create ru: "Мы не #{ru['future_we']}", en: "We will not #{en['common']}"
        end

        def create_phrase_for_they
          word.phrases.create ru: "Они не #{ru['future_they']}", en: "They will not #{en['common']}"
        end

        def create_phrase_for_he
          word.phrases.create ru: "Он не #{ru['future_he']}", en: "He will not #{en['common']}"
        end

        def create_phrase_for_she
          word.phrases.create ru: "Она не #{ru['future_she']}", en: "She will not #{en['common']}"
        end
      end
    end
  end
end
