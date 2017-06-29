class Brain
    include HTTParty
    base_uri 'whateverthebrain.com'

    def initialize(token)
        @token = token
    end

    def create_user(payload)
        request('post', "/users", payload)
    end

    def destroy_user(id)
        request("delete", "/users/#{id}", {})
    end

    def update_user(id, payload)
        request("put", "/users/#{id}", payload)
    end

    private
        def request(method, path, payload)
            self.class.public_send(method, path,
                body: {}.merge!(payload),
                headers: {
                    'x-brain-token' => @token
                }
            )
        end
end

