require_relative 'frame'

class Game
  attr_reader :frames, :rolls, :score
  MAX_FRAMES = 10

  def initialize
    @max_frames = MAX_FRAMES
    @frames = []
    @score =[]
  end

  def play
    until @frames.length == @max_frames
      frame = Frame.new
      until frame.completed?
        puts 'Number of pins knocked down'
        pins = gets.chomp.to_i
        frame.roll(pins)
      end
      @frames << frame
    end
  end

  def add_bonus 
    if @frames.last.strike?
      strike_bonus
    elsif @frames.last.spare?
      spare_bonus
    end
  end

  def frame_scoring
    @frames.each_index do | index |
      if index < 10
        scoring_logic(index)
      end
    end
  end

  def final_score
    @score.sum
  end 

  private

  def standard_score(frame)
    frame.score
  end

  def double_strike_score(frame, next_frame, after_next_frame)
    frame.score + next_frame.score + after_next_frame.score
  end

  def strike_score(frame, next_frame)
    frame.score + next_frame.score
  end

  def spare_score(frame, next_frame)
    frame.score + next_frame.spare_score
  end

  def strike_bonus
    2.times { 
    bonus_frame = Frame.new  
    bonus_rolls(bonus_frame) 
    @frames << bonus_frame
  }
  end

  def spare_bonus
    bonus_frame = Frame.new
    bonus_rolls(bonus_frame)
    @frames << bonus_frame
  end

  def bonus_rolls(bonus_frame)
    puts 'Number of pins knocked down'
    pins = gets.chomp.to_i
    bonus_frame.roll(pins)
    bonus_frame
  end

  def scoring_logic(index)
    if @frames[index].strike? && @frames[index + 1].strike?
      @score << double_strike_score(@frames[index], @frames[index + 1], @frames[index + 2])

    elsif @frames[index].strike? && (@frames[index + 1].strike? !=  false)
      @score << strike_score(@frames[index], @frames[index + 1])
    
    elsif @frames[index].spare? 
      @score << spare_score(@frames[index], @frames[index + 1])
    
    else
      @score << standard_score(@frames[index])
    end
  end

end