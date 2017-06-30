require 'httparty'
class Brain
    include HTTParty
    base_uri 'jarvis-brain.herokuapp.com'

    def initialize(token)
        @token = token
        @company = Company.find_by(token: token)
    end

    def create_user(payload)
        request('post', "/users", payload)
    end

    def destroy_user(token)
        request("delete", "/users/#{token}")
    end

    def update_user(token, payload)
        request("put", "/users/#{token}", payload)
    end

    def get_company(token)
      request('get', "/company/#{token}")
    end

    def get_division(token)
      request('get', "/division/#{token}")
    end

    def get_department(token)
      request('get', "/department/#{token}")
    end

    def get_user(token)
      request('get', "/user/#{token}")
    end

    def company_by_token(token)
    end

    private
        def request(method, path, payload=nil)
            self.class.public_send(method, path,
                body: {}.merge!(payload),
                headers: {
                    'x-brain-token' => @token
                }
            )
        end
end
