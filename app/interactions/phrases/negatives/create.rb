module Phrases
  module Negatives
    class Create < Phrases::Create
      def execute
        data.each do |tense_data|
          tense_data.values[0].each do |data|
            create_phrases("#{tense_data.keys[0]}_#{data[:en].split[0].downcase}", data)
          end
        end
      end

      private

      def data
        [{ present: present_data }, { past: past_data }, { future: future_data }]
      end

      def present_data
        [{ ru: 'Я не', en: 'I don`t', en_verb: en['common'] },
         { ru: 'Вы не', en: 'You don`t', en_verb: en['common'] },
         { ru: 'Мы не', en: 'We don`t', en_verb: en['common'] },
         { ru: 'Они не', en: 'They don`t', en_verb: en['common'] },
         { ru: 'Он не', en: 'He doesn`t', en_verb: en['common'] },
         { ru: 'Она не', en: 'She doesn`t', en_verb: en['common'] }]
      end

      def past_data
        [{ ru: 'Я не', en: 'I didn`t', en_verb: en['common'] },
         { ru: 'Вы не', en: 'You didn`t', en_verb: en['common'] },
         { ru: 'Мы не', en: 'We didn`t', en_verb: en['common'] },
         { ru: 'Они не', en: 'They didn`t', en_verb: en['common'] },
         { ru: 'Он не', en: 'He didn`t', en_verb: en['common'] },
         { ru: 'Она не', en: 'She didn`t', en_verb: en['common'] }]
      end

      def future_data
        [{ ru: 'Я не', en: 'I will not', en_verb: en['common'] },
         { ru: 'Вы не', en: 'You will not', en_verb: en['common'] },
         { ru: 'Мы не', en: 'We will not', en_verb: en['common'] },
         { ru: 'Они не', en: 'They will not', en_verb: en['common'] },
         { ru: 'Он не', en: 'He will not', en_verb: en['common'] },
         { ru: 'Она не', en: 'She will not', en_verb: en['common'] }]
      end

      def create_phrases(input, data)
        phrase = word.phrases.create ru: "#{data[:ru]} #{ru[input]}",
                                     en: "#{data[:en]} #{data[:en_verb]}",
                                     lesson_identifier: 'lesson_1'
        personal_pronouns = pronouns(input.split('_')[1])
        create_lesson_2_pronoun(phrase, personal_pronouns) if personal_pronouns.present?
      end

      def pronouns(key)
        personal_pronouns[personal_pronouns.keys.select { |pronoun| pronoun.include?(key) }.first]
      end

      def create_lesson_2_pronoun(phrase, personal_pronouns)
        personal_pronouns.each do |personal_pronoun|
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
