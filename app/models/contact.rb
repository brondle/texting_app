class Contact<ActiveRecord::Base
  has_many :messages
  belongs_to :user

    def self.search(search)
    if search
      where('name iLIKE ?', "%#{search}%")
    else
      where(nil)
    end
  end

end
