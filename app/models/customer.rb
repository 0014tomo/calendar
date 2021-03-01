class Customer < ApplicationRecord
  validates :room_id, presence: true
  belongs_to :user
  belongs_to :room

# ユーザー登録と同時に専用の色を振り分け
    def customer_color
        if self.user_id == 1
            _color = "#bcffff"
        elsif self.user_id == 2
            _color = "#ffbcdd"
        elsif self.user_id == 3
            _color ="#bcffbc"
        elsif self.user_id == 4
            _color ="#ffffbc"
        elsif self.user_id == 5
            _color ="#ddbcff"
        elsif self.user_id == 6
            _color ="#ffddbc"
        elsif self.user_id == 7
            _color ="#ddffbc"
        elsif self.user_id == 8
            _color ="#bcddff"
        elsif self.user_id == 9
            _color = "#bcffff"
        elsif self.user_id == 10
            _color = "#ffbcdd"
        elsif self.user_id == 11
            _color ="#bcffbc"
        elsif self.user_id == 12
            _color ="#ffffbc"
        elsif self.user_id == 13
            _color ="#ddbcff"
        elsif self.user_id == 14
            _color ="#ffddbc"
        elsif self.user_id == 15
            _color ="#ddffbc"
        elsif self.user_id == 16
            _color ="#bcddff"
        end
    end
    
    
end
