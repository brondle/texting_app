class Contact<ActiveRecord::Base
  has_many :messages

    def self.search(search)
    if search
      where('name iLIKE ?', "%#{search}%")
    else
      where(nil)
    end
  end
  
end
