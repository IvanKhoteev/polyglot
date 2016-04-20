module Phrases
  module Present
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
          word.phrases.create ru: "Я #{ru['present_i']}?", en: "Do i #{en['common']}?"
        end

        def create_phrase_for_you
          word.phrases.create ru: "Ты #{ru['present_you']}?", en: "Do you #{en['common']}?"
        end

        def create_phrase_for_we
          word.phrases.create ru: "Мы #{ru['present_we']}?", en: "Do we #{en['common']}?"
        end

        def create_phrase_for_they
          word.phrases.create ru: "Они #{ru['present_they']}?", en: "Do they #{en['common']}?"
        end

        def create_phrase_for_he
          word.phrases.create ru: "Он #{ru['present_he']}?", en: "Does he #{en['common']}?"
        end

        def create_phrase_for_she
          word.phrases.create ru: "Она #{ru['present_she']}?", en: "Does she #{en['common']}?"
        end
      end
    end
  end
end
