require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe BudgetsController, type: :controller do
  let(:user) { FactoryGirl.create :user }
  let(:admin) { FactoryGirl.create :admin }
  # This should return the minimal set of attributes required to create a valid
  # Budget. As you add validations to Budget, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {value: 13}
  end

  let(:invalid_attributes) do
    {value: nil}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BudgetsController. Be sure to keep this updated too.
  let(:admin_session) { sign_in admin }
  let(:user_session) { sign_in user}
  let(:guest_session) {{}}

  context 'when logged as admin' do

    describe "GET #index" do
      it "returns a success response" do

        get :index, params: {}, session: admin_session
        expect(response).to be_successful
      end
    end

    describe "GET #show" do
      it "does not return a success response" do
budget = Budget.first
        get :show, params: {id: budget.to_param}, session: admin_session
        expect(response).not_to be_successful
      end
    end

    describe "GET #new" do
      it "does not return a success response" do
        get :new, params: {}, session: admin_session
        expect(response).not_to be_successful
      end
    end

    describe "GET #edit" do
      it "does not return a success response" do
budget = Budget.first
        get :edit, params: {id: budget.to_param}, session: admin_session
        expect(response).not_to be_successful
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "does not create a new Budget" do
          expect {
            post :create, params: {budget: valid_attributes}, session: admin_session
          }.to change(Budget, :count).by(0)
        end

        it "redirects to the index" do
          post :create, params: {budget: valid_attributes}, session: admin_session
          expect(response).to redirect_to(budgets_path)
        end
      end

      context "with invalid params" do
        it "does not return a success response (i.e. to display the 'new' template)" do
          post :create, params: {budget: invalid_attributes}, session: admin_session
          expect(response).not_to be_successful
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          {value: 20}
        }

        it "does not update the requested budget" do
  budget = Budget.first
          put :update, params: {id: budget.to_param, budget: new_attributes}, session: admin_session
          budget.reload
          expect(budget.value).to eq(Budget.first.value)
        end

        it "redirects to the index" do
  budget = Budget.first
          put :update, params: {id: budget.to_param, budget: valid_attributes}, session: admin_session
          expect(response).to redirect_to(budgets_path)
        end
      end

      context "with invalid params" do
        it "does not return a success response (i.e. to display the 'edit' template)" do
  budget = Budget.first
          put :update, params: {id: budget.to_param, budget: invalid_attributes}, session: admin_session
          expect(response).not_to be_successful
        end
      end
    end

    describe "DELETE #destroy" do
      it "does not destroy the requested budget" do
budget = Budget.first
        expect {
          delete :destroy, params: {id: budget.to_param}, session: admin_session
        }.to change(Budget, :count).by(0)
      end

      it "redirects to the budgets list" do
budget = Budget.first
        delete :destroy, params: {id: budget.to_param}, session: admin_session
        expect(response).to redirect_to(budgets_url)
      end
    end
  end

  context 'when user is logged in' do
    describe "GET #index" do
      it "does not return a success response" do

        get :index, params: {}, session: user_session
        expect(response).not_to be_successful
      end
    end

    describe "GET #show" do
      it "does not return a success response" do
budget = Budget.first
        get :show, params: {id: budget.to_param}, session: user_session
        expect(response).not_to be_successful
      end
    end

    describe "GET #new" do
      it "does not return a success response" do
        get :new, params: {}, session: user_session
        expect(response).not_to be_successful
      end
    end

    describe "GET #edit" do
      it "does not return a success response" do
budget = Budget.first
        get :edit, params: {id: budget.to_param}, session: user_session
        expect(response).not_to be_successful
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "does not create a new Budget" do
          expect {
            post :create, params: {budget: valid_attributes}, session: user_session
          }.to change(Budget, :count).by(0)
        end

        it "redirects to the index" do
          post :create, params: {budget: valid_attributes}, session: user_session
          expect(response).to redirect_to(root_path)
        end
      end

      context "with invalid params" do
        it "does not return a success response (i.e. to display the 'new' template)" do
          post :create, params: {budget: invalid_attributes}, session: user_session
          expect(response).not_to be_successful
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          {value: 20}
        }

        it "does not update the requested budget" do
  budget = Budget.first
          put :update, params: {id: budget.to_param, budget: new_attributes}, session: user_session
          budget.reload
          expect(budget.value).to eq(Budget.first.value)
        end

        it "redirects to the index" do
  budget = Budget.first
          put :update, params: {id: budget.to_param, budget: valid_attributes}, session: user_session
          expect(response).to redirect_to(root_path)
        end
      end

      context "with invalid params" do
        it "does not return a success response (i.e. to display the 'edit' template)" do
  budget = Budget.first
          put :update, params: {id: budget.to_param, budget: invalid_attributes}, session: user_session
          expect(response).not_to be_successful
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested budget" do
budget = Budget.first
        expect {
          delete :destroy, params: {id: budget.to_param}, session: user_session
        }.to change(Budget, :count).by(0)
      end

      it "redirects to the budgets list" do
budget = Budget.first
        delete :destroy, params: {id: budget.to_param}, session: user_session
        expect(response).to redirect_to(root_path)
      end
    end

  end

  context 'when user is a guest' do
    describe "GET #index" do
      it "does not return a success response" do

        get :index, params: {}, session: guest_session
        expect(response).not_to be_successful
      end
    end

    describe "GET #show" do
      it "does not return a success response" do
budget = Budget.first
        get :show, params: {id: budget.to_param}, session: guest_session
        expect(response).not_to be_successful
      end
    end

    describe "GET #new" do
      it "does not return a success response" do
        get :new, params: {}, session: guest_session
        expect(response).not_to be_successful
      end
    end

    describe "GET #edit" do
      it "does not return a success response" do
budget = Budget.first
        get :edit, params: {id: budget.to_param}, session: guest_session
        expect(response).not_to be_successful
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "does not create a new Budget" do
          expect {
            post :create, params: {budget: valid_attributes}, session: guest_session
          }.to change(Budget, :count).by(0)
        end

        it "redirects to the index" do
          post :create, params: {budget: valid_attributes}, session: guest_session
          expect(response).to redirect_to(root_path)
        end
      end

      context "with invalid params" do
        it "does not return a success response (i.e. to display the 'new' template)" do
          post :create, params: {budget: invalid_attributes}, session: guest_session
          expect(response).not_to be_successful
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          {value: 20}
        }

        it "does not update the requested budget" do
  budget = Budget.first
          put :update, params: {id: budget.to_param, budget: new_attributes}, session: guest_session
          budget.reload
          expect(budget.value).to eq(Budget.first.value)
        end

        it "redirects to the index" do
  budget = Budget.first
          put :update, params: {id: budget.to_param, budget: valid_attributes}, session: guest_session
          expect(response).to redirect_to(root_path)
        end
      end

      context "with invalid params" do
        it "does not return a success response (i.e. to display the 'edit' template)" do
  budget = Budget.first
          put :update, params: {id: budget.to_param, budget: invalid_attributes}, session: guest_session
          expect(response).not_to be_successful
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested budget" do
budget = Budget.first
        expect {
          delete :destroy, params: {id: budget.to_param}, session: guest_session
        }.to change(Budget, :count).by(0)
      end

      it "redirects to the budgets list" do
budget = Budget.first
        delete :destroy, params: {id: budget.to_param}, session: guest_session
        expect(response).to redirect_to(root_path)
      end
    end
  end
end