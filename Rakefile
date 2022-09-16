desc "Run all tests"

task :test do
    sh "bundle exec rspec"
end

namespace :test do
    desc "Cart tests"
    task :cart do
        sh "bundle exec rspec --tag cart"
    end

    desc "Checkout Flow tests"
    task :checkout_flow do
        sh "bundle exec rspec --tag checkout_flow"
    end

    desc "Login tests"
    task :login do
        sh "bundle exec rspec --tag login"
    end

    desc "Products tests"
    task :products do
        sh "bundle exec rspec --tag products"
    end
end