# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?  # additional permissions for logged in users (they can read their own posts)
      can :read, Article, user_id: user.id
    end
  end
end
