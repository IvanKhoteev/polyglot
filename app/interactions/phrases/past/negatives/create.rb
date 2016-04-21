module Phrases
  module Past
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
          word.phrases.create ru: "Я не #{ru['past_i']}", en: "I didn`t #{en['common']}"
        end

        def create_phrase_for_you
          word.phrases.create ru: "Вы не #{ru['past_you']}", en: "You didn`t #{en['common']}"
        end

        def create_phrase_for_we
          word.phrases.create ru: "Мы не #{ru['past_we']}", en: "We didn`t #{en['common']}"
        end

        def create_phrase_for_they
          word.phrases.create ru: "Они не #{ru['past_they']}", en: "They didn`t #{en['common']}"
        end

        def create_phrase_for_he
          word.phrases.create ru: "Он не #{ru['past_he']}", en: "He didn`t #{en['common']}"
        end

        def create_phrase_for_she
          word.phrases.create ru: "Она не #{ru['past_she']}", en: "She didn`t #{en['common']}"
        end
      end
    end
  end
end
