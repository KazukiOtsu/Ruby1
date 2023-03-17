class Post < ApplicationRecord
    validates :title,
        presence: true, length: { maximum: 20}

    validates :start_at,
        presence: true

    validates :end_at,
        presence: true

    validates :memo,
        length: { maximum: 500}
    
    validate :start_and_end

    def start_and_end
        unless end_at == nil || start_at == nil
            errors.add(:end_at, "は開始日より後の日付にしてください") if self.start_at > self.end_at
        end
    end
end
