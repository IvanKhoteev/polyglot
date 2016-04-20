module Phrases
  module Future
    module Questions
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
          word.phrases.create ru: "Я #{ru['future_i']}?", en: "Will i #{en['common']}?"
        end

        def create_phrase_for_you
          word.phrases.create ru: "Ты #{ru['future_you']}?", en: "Will you #{en['common']}?"
        end

        def create_phrase_for_we
          word.phrases.create ru: "Мы #{ru['future_we']}?", en: "Will we #{en['common']}?"
        end

        def create_phrase_for_they
          word.phrases.create ru: "Они #{ru['future_they']}?", en: "Will they #{en['common']}?"
        end

        def create_phrase_for_he
          word.phrases.create ru: "Он #{ru['future_he']}?", en: "Will he #{en['common']}?"
        end

        def create_phrase_for_she
          word.phrases.create ru: "Она #{ru['future_she']}?", en: "Will she #{en['common']}?"
        end
      end
    end
  end
end
