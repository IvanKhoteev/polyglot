module Words
  class Create < ActiveInteraction::Base
    hash :wordset do
      string :word
      hash :ru do
        string :present_i
        string :present_you
        string :present_we
        string :present_they
        string :present_he_she
        string :past_i
        string :past_you
        string :past_we
        string :past_they
        string :past_he
        string :past_she
        string :future_i
        string :future_you
        string :future_we
        string :future_they
        string :future_he_she
      end
      hash :en do
        string :common
        string :specific_present_statement
        string :specific_past_statement
      end
      hash :personal_pronouns do
        array :i_we, default: nil
        array :you, default: nil
        array :they, default: nil
        array :he_she, default: nil
      end
      hash :interrogatives do
        array :interrogatives, default: nil
      end
    end

    def execute
      return if Word.find_by(word: wordset['word']).present?
      word = Word.create(word: wordset['word'])
      Phrases::Create.run data.merge(word: word)
    end

    private

    def data
      divide_he_she
      @data = { ru: wordset['ru'],
                en: wordset['en'],
                personal_pronouns: wordset['personal_pronouns'].each { |_k, v| v.delete_at(0) if v.present? },
                interrogatives: wordset['interrogatives']['interrogatives'][1..-1] }
    end

    def divide_he_she
      %w(present future).each do |tense|
        wordset['ru']["#{tense}_he"] = wordset['ru']["#{tense}_he_she"]
        wordset['ru']["#{tense}_she"] = wordset['ru']["#{tense}_he_she"]
        wordset['ru'].delete("#{tense}_he_she")
      end
    end
  end
end
