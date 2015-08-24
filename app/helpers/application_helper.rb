module ApplicationHelper
  LIST_CLASS = %w(list-primary list-success list-danger list-warning list-info list-inverse)

  def list_class_random
    LIST_CLASS.sample
  end
end
