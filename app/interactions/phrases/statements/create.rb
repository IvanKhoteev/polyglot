module Phrases
  module Statements
    class Create < Phrases::Create
      def execute
        data.each do |tense_data|
          tense_data.values[0].each do |data|
            create_phrases(input("#{tense_data.keys[0]}_#{data[:en].split[0].downcase}"), data)
          end
        end
      end

      private

      def input(tag)
        ru[tag].split('-')
      end

      def data
        [{ present: present_data }, { past: past_data }, { future: future_data }]
      end

      def present_data
        [{ ru: 'Я', en: 'I', en_verb: en['common'] },
         { ru: 'Вы', en: 'You', en_verb: en['common'] },
         { ru: 'Мы', en: 'We', en_verb: en['common'] },
         { ru: 'Они', en: 'They', en_verb: en['common'] },
         { ru: 'Он', en: 'He', en_verb: en['specific_present_statement'] },
         { ru: 'Она', en: 'She', en_verb: en['specific_present_statement'] }]
      end

      def past_data
        [{ ru: 'Я', en: 'I', en_verb: en['specific_past_statement'] },
         { ru: 'Вы', en: 'You', en_verb: en['specific_past_statement'] },
         { ru: 'Мы', en: 'We', en_verb: en['specific_past_statement'] },
         { ru: 'Они', en: 'They', en_verb: en['specific_past_statement'] },
         { ru: 'Он', en: 'He', en_verb: en['specific_past_statement'] },
         { ru: 'Она', en: 'She', en_verb: en['specific_past_statement'] }]
      end

      def future_data
        [{ ru: 'Я', en: 'I will', en_verb: en['common'] },
         { ru: 'Вы', en: 'You will', en_verb: en['common'] },
         { ru: 'Мы', en: 'We will', en_verb: en['common'] },
         { ru: 'Они', en: 'They will', en_verb: en['common'] },
         { ru: 'Он', en: 'He will', en_verb: en['common'] },
         { ru: 'Она', en: 'She will', en_verb: en['common'] }]
      end

      def create_phrases(input, data)
        phrase = word.phrases.create ru: "#{data[:ru]} #{input[0]}",
                                     en: "#{data[:en]} #{data[:en_verb]}",
                                     lesson_identifier: 'lesson_1'
        create_lesson_2_pronoun(phrase, input[1]) if input[1].present?
      end

      def create_lesson_2_pronoun(phrase, personal_pronouns)
        personal_pronouns.split(',').each do |personal_pronoun|
          en_whom = PersonalPronoun.find_by(ru_whom: personal_pronoun).try(:en_whom)
          next if en_whom.blank?
          word.phrases.create ru: "#{phrase.ru} #{personal_pronoun}",
                              en: "#{phrase.en} #{en_whom}",
                              lesson_identifier: 'lesson_2_pronoun'
        end
      end
    end
  end
end
