module Phrases
  module Present
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
          word.phrases.create ru: "Я не #{ru['present_i']}", en: "I don`t #{en['common']}"
        end

        def create_phrase_for_you
          word.phrases.create ru: "Ты не #{ru['present_you']}", en: "You don`t #{en['common']}"
        end

        def create_phrase_for_we
          word.phrases.create ru: "Мы не #{ru['present_we']}", en: "We don`t #{en['common']}"
        end

        def create_phrase_for_they
          word.phrases.create ru: "Они не #{ru['present_they']}", en: "They don`t #{en['common']}"
        end

        def create_phrase_for_he
          word.phrases.create ru: "Он не #{ru['present_he']}", en: "He doesn`t #{en['common']}"
        end

        def create_phrase_for_she
          word.phrases.create ru: "Она не #{ru['present_she']}", en: "She doesn`t #{en['common']}"
        end
      end
    end
  end
end
