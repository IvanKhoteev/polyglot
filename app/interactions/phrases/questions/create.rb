module Phrases
  module Questions
    class Create < Phrases::Create
      def execute
        data.each do |tense_data|
          tense_data.values[0].each do |data|
            create_phrases("#{tense_data.keys[0]}_#{data[:en].split[1]}", data)
          end
        end
      end

      private

      def data
        [{ present: present_data }, { past: past_data }, { future: future_data }]
      end

      def present_data
        [{ ru: 'Я', en: 'Do i', en_verb: en['common'] },
         { ru: 'Вы', en: 'Do you', en_verb: en['common'] },
         { ru: 'Мы', en: 'Do we', en_verb: en['common'] },
         { ru: 'Они', en: 'Do they', en_verb: en['common'] },
         { ru: 'Он', en: 'Does he', en_verb: en['common'] },
         { ru: 'Она', en: 'Does she', en_verb: en['common'] }]
      end

      def past_data
        [{ ru: 'Я', en: 'Did i', en_verb: en['common'] },
         { ru: 'Вы', en: 'Did you', en_verb: en['common'] },
         { ru: 'Мы', en: 'Did we', en_verb: en['common'] },
         { ru: 'Они', en: 'Did they', en_verb: en['common'] },
         { ru: 'Он', en: 'Did he', en_verb: en['common'] },
         { ru: 'Она', en: 'Did she', en_verb: en['common'] }]
      end

      def future_data
        [{ ru: 'Я', en: 'Will i', en_verb: en['common'] },
         { ru: 'Вы', en: 'Will you', en_verb: en['common'] },
         { ru: 'Мы', en: 'Will we', en_verb: en['common'] },
         { ru: 'Они', en: 'Will they', en_verb: en['common'] },
         { ru: 'Он', en: 'Will he', en_verb: en['common'] },
         { ru: 'Она', en: 'Will she', en_verb: en['common'] }]
      end

      def create_phrases(input, data)
        phrase = word.phrases.create ru: "#{data[:ru]} #{ru[input]}?",
                                     en: "#{data[:en]} #{data[:en_verb]}?",
                                     lesson_identifier: 'lesson_1'
        create_lesson_2_phrases(phrase, interrogatives, input)
      end

      def pronouns(key)
        personal_pronouns[personal_pronouns.keys.select { |pronoun| pronoun.include?(key) }.first]
      end

      def create_lesson_2_phrases(phrase, interrogatives, input)
        create_lesson_2_interrogative(phrase, interrogatives) if interrogatives.present?
        personal_pronouns = pronouns(input.split('_')[1])
        create_lesson_2_pronoun(phrase, personal_pronouns) if personal_pronouns.present?
      end

      def create_lesson_2_interrogative(phrase, interrogatives)
        interrogatives.each do |interrogative|
          en_interrogative = Interrogative.find_by(ru: interrogative).try(:en)
          next if en_interrogative.blank?
          word.phrases.create ru: "#{interrogative + ' '}#{phrase.ru}",
                              en: "#{en_interrogative + ' '}#{phrase.en}",
                              lesson_identifier: 'lesson_2_interrogative'
        end
      end

      def create_lesson_2_pronoun(phrase, personal_pronouns)
        personal_pronouns.each do |personal_pronoun|
          en_whom = PersonalPronoun.find_by(ru_whom: personal_pronoun).try(:en_whom)
          word.phrases.create ru: "#{phrase.ru[0..-2]} #{personal_pronoun}?",
                              en: "#{phrase.en[0..-2]} #{en_whom}?",
                              lesson_identifier: 'lesson_2_pronoun'
        end
      end
    end
  end
end
