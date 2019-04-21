class SafeDelete
  def initialize(trash_object)
    @trash_object = trash_object
  end

  def call
    case fetch_class_name
      when "Post"
        trash_object.update(thrashed:true)
        trash_object.comments.update_all(thrashed:true)
      when "Comment"
        trash_object.update(thrashed:true)
    end
  end

  private
  attr_reader :trash_object

  def fetch_class_name
    trash_object.class.name
  end
end