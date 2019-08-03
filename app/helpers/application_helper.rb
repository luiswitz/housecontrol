# frozen_string_literal: true

module ApplicationHelper
  def active?(path)
    'active' if current_controller?(path)
  end

  def current_controller?(names)
    names.include?(controller_name)
  end
end
