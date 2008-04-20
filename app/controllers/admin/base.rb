module Admin
class Base < Application
  before :require_login
  layout 'admin'
end
end
