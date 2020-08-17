class Article < ApplicationRecord
    validates :title, presence: true, length: { minimum: 6, maximum: 100 }
    validates :created_on, presence: true
    validate :date_after_current

    private
        def date_after_current
            if (!created_on.nil?)
                
                if (created_on > Time.new)
                    errors.add(:created_on,"date is not come yet")
            end
        end
    end
end