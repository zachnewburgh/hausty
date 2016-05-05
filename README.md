Apartment Review Website
- Home: login, signup
- Apt (model, has_many :reviews, has_many :users, through: :reviews)
- Review (model, belongs_to :user, belongs_to :apt): index, create, show (edit/delete), edit (delete)
- Users (model, has_many :reviews, has_many :apts, through: reviews): create, show ()