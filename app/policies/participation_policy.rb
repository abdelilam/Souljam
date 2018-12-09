class ParticipationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    false
  end

  def destroy?
    if user.nil?
      false
    else
      is_user? && record.jamm.creator_id != user.id
    end
  end

  def status?
    if user.nil?
      false
    else
      record.jamm.creator_id == user.id && record.user != user
    end
  end

  def accept?
    if user.nil?
      false
    else
      record.jamm.creator_id == user.id && record.user != user && record.jamm.capacity != record.jamm.participations.where(status: 'Accepted').size
    end
  end

  private

  def is_user?
    record.user == user
  end
end
