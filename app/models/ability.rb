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
      cannot :manage, [Company, Employee, User, Role]
      return
    end
    if user.role? :normal
      cannot :manage, [Company, Employee, ItemCode, ProductColor, ContactType, CustomerType, EstimateType, JobStatus, LeadSource, ProductType, Role, User, RoofType, SalesTax, ServiceType, TaskType, UnitOfMeasurement, Vendor]
    end
  end
end
