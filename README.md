# TISRuby
*Test Online Shop project using Ruby Stack*

**Installation**

Use `git clone https://github.com/snegas/TISRuby.git` to work on it on your local. Forks and pull requests are acceptable.

To create database with all of tables run in the project's root: `rake db:create && rake db:migrate`.

Then, use only `rake db:migrate`.

**Tests**

Run `rake spec` in the project's root to run all tests in `/spec/`.

**GIT Flow**

To develop some feature create a new branch with the next pattern `feature_*`. * is a issue number or the feature name.

Each feature should have RSpec tests what cover as much as possible cases :)

To create a release from several features before `develop` use merge the list of feature to `release_*` branch, where * is release code name.

Then, merge feature branch to develop and then to the master branch.

**Release**

1. Initial 0.1
    1. Product model
    2. CRUD for products
    3. Upload up to 3 photos for each product
    4. Search by product title and description
    5. Card with multiple products
    6. Order with invoices
    7. Products/Orders export to CSV