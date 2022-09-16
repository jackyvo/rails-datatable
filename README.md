# Rails::Datatable

Rails Datatable is the packed gem for integrating datatable into the Rails app.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails-datatable'
```

And then execute:
  $ bundle

Or install it yourself as:
  $ gem install rails-datatable

## Usage

### 1. Install RailsDatatable
	$ rails g rails::datatable::install

### 2. Generate resources
#### 2.1 Generate databtable resources
	
	$ rails g rails::datatable::resource [User]

#### 2.2 Implement json method in your controller
```ruby
respond_to do |format|
  format.html { }
  format.json {
    render json: UsersDatatable.new(view_context, @users)
  }
end
```

#### 2.3 Set json path for your table in view
```html
%table.table{data: { url: users_path(format: :json) }}
  %thead
    %tr
      %th #
      %th ID
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jackyvo/rails-datatable. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
