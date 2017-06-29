module Jarvis
  class SyncsController < ApplicationController
    # I was backwards.  This is the brain posting to us
    # This is where we manipuate the user model
    def create
<<<<<<< HEAD
      # This is where we'll create users from the Brain
    end

    def update
      # This is where we'll update users from the Brain
    end

    def destroy
      # This is where we'll destroy users from the Brain
=======
      # This is where we'll create users from the @brain
    end

    def update
      # This is where we'll update users from the @brain
    end

    def destroy
      # This is where we'll destroy users from the @brain
>>>>>>> e5d4eed9eba26b73733d51f7a6ca64369a29bcef
    end
  end
end
