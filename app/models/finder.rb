class Finder < ActiveRecord::Base
  
  def self.lastrun
    Finder.where(success: true).order(:started).last
  end
  
  def self.fresh
    run = Finder.new
    run.started = Time.now
    run.added = 0
    run.removed = 0
    return run
  end
end
