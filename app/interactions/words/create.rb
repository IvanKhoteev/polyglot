module Words
  class Create < ActiveInteraction::Base
    hash :wordset do
      string :word
      hash :ru do
        hash :present_i do
          string :word
          array :pronouns
        end
        hash :present_you do
          string :word
          array :pronouns
        end
        hash :present_we do
          string :word
          array :pronouns
        end
        hash :present_they do
          string :word
          array :pronouns
        end
        hash :present_he do
          string :word
          array :pronouns
        end
        hash :present_she do
          string :word
          array :pronouns
        end
        hash :past_i do
          string :word
          array :pronouns
        end
        hash :past_you do
          string :word
          array :pronouns
        end
        hash :past_we do
          string :word
          array :pronouns
        end
        hash :past_they do
          string :word
          array :pronouns
        end
        hash :past_he do
          string :word
          array :pronouns
        end
        hash :past_she do
          string :word
          array :pronouns
        end
        hash :future_i do
          string :word
          array :pronouns
        end
        hash :future_you do
          string :word
          array :pronouns
        end
        hash :future_we do
          string :word
          array :pronouns
        end
        hash :future_they do
          string :word
          array :pronouns
        end
        hash :future_he do
          string :word
          array :pronouns
        end
        hash :future_she do
          string :word
          array :pronouns
        end
      end
      hash :en do
        string :common
        string :specific_present_statement
        string :specific_past_statement
      end
      hash :interrogatives do
        array :interrogatives, default: nil
      end
    end

    def execute
      word = Word.create(word: wordset['word'])
      Phrases::Create.run data.merge(word: word)
    end

    private

    def data
      { ru: wordset['ru'],
        en: wordset['en'],
        interrogatives: wordset['interrogatives']['interrogatives'][1..-1] }
    end
  end
end
