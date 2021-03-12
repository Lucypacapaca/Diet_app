class Cook < ApplicationRecord
    before_validation :set_nameless_name
    validates :start_time, presence: true

    with_options numericality: true do
        validates :protein
        validates :fat
        validates :carbon_hydrate
        validates :amount
    end

    def kcal
        4*protein + 9*fat + 4*carbon_hydrate
    end

    belongs_to :user

    scope :recent, -> { order(start_time: :desc) }

    has_many :foods


    private
    
    def set_nameless_name
        self.name = '食べ物' if name.blank? 
    end    
end
