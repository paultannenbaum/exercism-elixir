class HighScores
  attr_reader :scores, :latest, :personal_top_three, :personal_best

  def initialize(scores)
    @scores = scores
    @latest = scores.last
    @personal_best = scores.max
    @personal_top_three = scores.sort.reverse.take(3)
  end

  def latest_is_personal_best?
    latest == personal_best
  end
end
