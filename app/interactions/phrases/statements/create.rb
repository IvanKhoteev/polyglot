module Phrases
  module Statements
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
        phrase = word.phrases.create ru: "#{data[:ru]} #{ru[input]}",
                                     en: "#{data[:en]} #{data[:en_verb]}",
                                     lesson_identifier: 'lesson_1'
        personal_pronouns = pronouns(input.split('_')[1])
        create_lesson_2_pronoun(phrase, personal_pronouns) if personal_pronouns.present?
        create_lesson_2_places(phrase, pretexts) if pretexts.present?
      end

      def pronouns(key)
        personal_pronouns[personal_pronouns.keys.select { |pronoun| pronoun.include?(key) }.first]
      end

      def create_lesson_2_pronoun(phrase, personal_pronouns)
        personal_pronouns.each do |personal_pronoun|
          en_whom = PersonalPronoun.find_by(ru_whom: personal_pronoun).try(:en_whom)
          word.phrases.create ru: "#{phrase.ru} #{personal_pronoun}",
                              en: "#{phrase.en} #{en_whom}",
                              lesson_identifier: 'lesson_2_pronoun'
        end
      end

      def create_lesson_2_places(phrase, pretexts)
        pretexts.each do |pretext|
          places = Place.where(pretext_ru: pretext)
          places.each do |place|
            word.phrases.create ru: "#{phrase.ru} #{place.name_ru}",
                                en: "#{phrase.en} #{place.pretext_en} #{place.name_en}",
                                lesson_identifier: 'lesson_2_places'
          end
        end
      end
    end
  end
end
