class Ability
  include CanCan::Ability

  #def initialize(user)
  #  user.roles.each { |role|
  #    role.permissions.each { |permission|
  #      can permission.conduct.to_sym, permission.regulator.constantize
  #    }
  #  }
  #
  #end
  def initialize(user)
    user ||= User.new #guest user
    if user.role? :superadmin
      can :manage, :all
      return
    end
    if user.role? :admin
      cannot :manage, [Company, Role]
      can :edit, User, :id =>user.id
      can :update, User, :id =>user.id
      can :read, User, :id =>user.id
      return
    end
    if user.role? :normal
      cannot :manage, [Company, ItemCode, ProductColor, ContactType, CustomerType, EstimateType, JobStatus, LeadSource, ProductType, Role, RoofType, SalesTax, ServiceType, TaskType, UnitOfMeasurement, Vendor]

      can :edit, User, :id =>user.id
      can :update, User, :id =>user.id
      can :read, User, :id =>user.id
    end
  end
end
