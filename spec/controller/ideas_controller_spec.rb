require "rails_helper"

RSpec.describe IdeasController, type: :controller do 
    def current_user 
        @current_user ||= FactoryBot.create(:user)
    end
    describe "#new" do
        context "without signed in user" do 
            it "redirects the user to session new" do 
                get :new 
                expect(response).to redirect_to(new_session_path)
            end
        end
        context "with signed in user" do 
            before do 
                session[:user_id] = current_user.id 
            end
    
            it "renders the new template" do 
                
                get(:new)

                expect(response).to(render_template(:new))
            end
        end  
    end 
    
    describe "#create" do 
        
        context "with valid parameters" do 
            def valid_request 
               
                post(:create, params: { idea: FactoryBot.attributes_for(:idea) })
            end
            context "without singed in user" do 
                it "redirects the user to session new" do 
                    valid_request 
                    
                    expect(response).to redirect_to(new_session_path)
                end
                it "sets a flash danger message" do 
                    valid_request
                    expect(flash[:danger]).to be 
                end
            end
    
            context "with signed in user" do 
                before do 
                    session[:user_id] = current_user.id 
                end
    
                context "with valid parameters" do 
                    it "creates an idea in the db" do 
                        count_before = Idea.count
                        valid_request
                        count_after = Idea.count 
                        expect(count_after).to(eq(count_before + 1))
                    end
    
                    it "associates the current_user to the created idea" do 
                        valid_request
                        idea = Idea.last 
                        expect(idea.user).to eq(current_user)
                    end
                end
            end
        end
    end    
end