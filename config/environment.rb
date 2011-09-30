# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
JobBoard::Application.initialize!

ENV['RECAPTCHA_PUBLIC_KEY']  = '6LcebsgSAAAAAE-4kJsGAXnyywcKXyfPzHm0gj0n'
ENV['RECAPTCHA_PRIVATE_KEY'] = '6LcebsgSAAAAAKbk_ChZezo6I7QJxdA8gk-KCJeg'

