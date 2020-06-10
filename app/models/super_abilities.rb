class SuperAbilities
  include CanCan::Ability

  def initialize user

    user_datagentibus ||= user_sanbiagio  ||= User.new
    if user.has_spree_role?(:store_manager)
        cannot [:create], Spree::Store
        cannot [:edit], Spree::Store
    end
  	#user ||= User.new
    #if user.has_role? 'landlord'
    #    can :manage, :all
    #elsif user.has_role? 'tenant'
    #  can :read, Product
    #  can :admin, Order
    #end
  end
end
