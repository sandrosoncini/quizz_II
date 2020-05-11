require "rails_helper"

RSpec.describe IdeasController, type: :controller do 
    describe "#new" do
        context "render new page" do 
            it "redirects the user to new page" do 
                get :new 
                expect(response).to(render_template(:new))
            end

            it "sets an instance variable with a new job post" do 
                get(:new)
               
                expect(assigns(:idea)).to(be_a_new(Idea))
                
            end
        end
    end

    describe "#create" do 
        # 'context' is funcationally the same as 'describe', but
        # we use context to group branching code paths. 
        context "with valid parameters" do 
            def valid_request 
                # The post method below simulates an HTTP request to the 
                # create action of JobPostsController using the POST verb 
                # This has the effect of a user filling out our new form 
                # in a browser and submitting
                post(:create, params: { job_post: FactoryBot.attributes_for(:job_post) })
            end
    
            context "without sidned in user" do 
                it "redirects the user to session new" do 
                    valid_request 
                    expect(response).to redirect_to(new_session_path)
                end
                it "sets a flash danger message" do 
                    valid_request
                    expect(flash[:danger]).to be 
                end
            end
end