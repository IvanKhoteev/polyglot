module Phrases
  module Past
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
          word.phrases.create ru: "Я #{ru['past_i']}?", en: "Did i #{en['common']}?"
        end

        def create_phrase_for_you
          word.phrases.create ru: "Ты #{ru['past_you']}?", en: "Did you #{en['common']}?"
        end

        def create_phrase_for_we
          word.phrases.create ru: "Мы #{ru['past_we']}?", en: "Did we #{en['common']}?"
        end

        def create_phrase_for_they
          word.phrases.create ru: "Они #{ru['past_they']}?", en: "Did they #{en['common']}?"
        end

        def create_phrase_for_he
          word.phrases.create ru: "Он #{ru['past_he']}?", en: "Did he #{en['common']}?"
        end

        def create_phrase_for_she
          word.phrases.create ru: "Она #{ru['past_she']}?", en: "Did she #{en['common']}?"
        end
      end
    end
  end
end
