class Playboy
  # TODO: implement necessary getters or setters to run meeting_casanova.rb

  INITIAL_HAIR_LENGTH = 20 # beautiful long playboy hair

  def initialize(name, nationality)
    @conquests   = []
    @name        = name
    @nationality = nationality
    @hair_length = INITIAL_HAIR_LENGTH
    @married = false
  end

  def meets(lady)
    @conquests << lady unless @married
  end
end
