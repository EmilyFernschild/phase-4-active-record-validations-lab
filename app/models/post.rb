class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validate :not_true_facts

    # def not_true_facts
    #     if title == "True Facts"
    #         errors.add(:title, "Error cant't be true facts")
    #     end
    # end

#     CLICKBAIT_PATTERNS = [
#     /Won't Believe/i,
#     /Secret/i,
#     /Top \d/i,
#     /Guess/i
#   ]
#     def not_true_facts
#       if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
#         errors.add(:title, "must be clickbait")
#       end
#     end


    # def not_true_facts
    #     clickbaitPatterns = ["Won't Believe", "Secret", "Top", "Guess"]
    #     if title == nil 
    #         return
    #     end
    #     if clickbaitPatterns.none? { |p| title.include?(p)}
    #       errors.add(:title, "must be clickbait")
    #     end
    # end

    def not_true_facts
        if !title
            return
        end
        unless self.title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
            errors.add(:title, "must be clickbait")
        end
    end
    
end
