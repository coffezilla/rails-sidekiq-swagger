require 'swagger_helper'

RSpec.describe 'Users API', type: :request do
  path '/users' do
    get 'List users' do
      tags 'Users'
      produces 'application/json'

      response '200', 'users listed' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   email: { type: :string }
                 },
                 required: %w[id name email]
               }

        run_test!
      end
    end

    post 'Create user' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, example: 'Renato', description: 'The name of the user' },
          email: { type: :string, example: 'renato@example.com', description: 'The email of the user' }
        },
        required: %w[email]
      }

      response '201', 'user created' do
        let(:user) { { name: 'Renato', email: "renato_#{Time.now.to_i}@mail.com" } }

        schema type: :object,
               properties: {
                 id: { type: :integer, example: 1, description: 'The ID of the user' },
                 name: { type: :string, example: 'Renato', description: 'The name of the user' },
                 email: { type: :string, example: 'renato@example.com', description: 'The email of the user' }
               },
               required: %w[id name email]

        run_test!
      end
    end
  end

  path '/users/{id}' do
    delete 'Delete user' do
      tags 'Users'
      parameter name: :id, in: :path, type: :integer

      response '204', 'user deleted' do
        let(:id) { User.create!(name: 'Delete Me', email: "delete_#{Time.now.to_i}@mail.com").id }

        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 99_999_999 }

        run_test!
      end
    end
  end
end
