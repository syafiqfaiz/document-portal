require "administrate/base_dashboard"

class DocumentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    category_name: Field::String,
    category: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    description: Field::Text,
    count: Field::Number,
    file: Field::CarrierwaveField,
    images: Field::String.with_options(searchable: false),
    slug: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :category,
    :category_name,
    :id,
    :name,
    :description,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :category,
    :category_name,
    :id,
    :name,
    :description,
    :count,
    :file,
    :images,
    :slug,
    :created_at,
    :updated_at,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :category,
    :name,
    :description,
    :file,
    :images,
  ]

  # Overwrite this method to customize how documents are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(document)
  #   "Document ##{document.id}"
  # end
end
