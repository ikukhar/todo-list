describe ProjectsController do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = User.create( email: 'test@test.com', password: 'password', password_confirmation: 'password')
    sign_in user
  end

  it "should have a current_user" do
    expect(subject.current_user).to_not be_nil
  end

  describe '#create' do
    it 'response new project with json' do
      post :create, project: { name: 'test' }
      expect(response.body).to eq(assigns(:project).to_json)
    end
  end

  describe '#update' do
    it 'response project with json' do
      project = Project.create( name: 'test' )
      put :update, id: project.id, project:{ name: '' }
      expect(response.body).to eq(assigns(:project).to_json)
    end

    # it 'response error json with 422' do
    #   put :update, id: 0, project:{ name: '' }
    #   expect(response).to have_http_status(:unprocessable_entity)
    # end
  end

end
