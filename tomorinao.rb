# -*- coding: utf-8 -*-

Plugin.create(:tomorinao) do
end

module Plugin::TomoriNao
  def self.友利奈緒
    Tomorizable
  end

  module Tomorizable
    def [](key)
      case key
      when :name
        '友利奈緒'.freeze
      else
        super(key) end end
  end
end

class Message::MessageUser
  class << self
    alias 友利奈緒_new new
    def new(user, raw)
      tomorized = raw.dup
      tomorized.delete(:name)
      友利奈緒_new(user, tomorized) end
  end
end

class User
  prepend Plugin::TomoriNao::友利奈緒
end
