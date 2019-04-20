class Restore
  def initialize(restore_object)
    @restore_object =  restore_object
  end

  def call
    case fetch_class
    when "Post"
      restore_object.update(thrashed:false)
      restore_object.comments.update_all(thrashed:false)
    when "Comment"
      restore_object.update(thrashed:false)
    end
  end

  private

  attr_reader :restore_object
  def fetch_class
    restore_object.class.name
  end
end