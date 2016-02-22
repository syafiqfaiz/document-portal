require "administrate/base_dashboard"

class SubscriptionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.

  ATTRIBUTE_TYPES = {
    id: Field::Number,
    user: Field::BelongsTo,
    plan: Field::BelongsTo,
    payment_method: Field::String,
    payment_id: Field::String,
    paid_at: Field::DateTime,
    status: Field::String,
    end_at: Field::DateTime,

  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :user,
    :plan,
    :status,
    :end_at,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :user,
    :plan,
    :paid_at,
    :payment_id,
    :payment_method,
    :status,
    :end_at,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :plan,
    :paid_at,
    :payment_id,
    :payment_method,
    :status,
    :end_at,
  ]

end
