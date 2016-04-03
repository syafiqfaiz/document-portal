require "administrate/fields/base"

class CarrierwaveImageField < Administrate::Field::Base
  def to_s
    data
  end

  def url
    data.url
  end

  def file_name
    data.file.filename
  end
end
