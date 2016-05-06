Apartment Review Website
- Home: login, signup
- Apt (model, has_many :reviews, has_many :users, through: :reviews)


- Review (model, belongs_to :user, belongs_to :apt): index, create, show (edit/delete), edit (delete)
- Users (model, has_many :reviews, has_many :apts, through: reviews): create, show (edit/delete), edit (delete)

MODELS
1) Review (belongs_to :users)
  > :title, :content, :user_id  ### WORK ON THIS LATER :apartment_id

2) User (has_many :reviews)
  > :first_name, :last_name, :email, :username, :email, :password_digest