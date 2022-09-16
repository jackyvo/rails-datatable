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

### Install RailsDatatable
	$ rails g rails::datatable::install

### Generate resources
#### Generate databtable resources
	
	$ rails g rails::datatable::resource [User]

#### Implement json method in your controller
```ruby
	respond_to do |format|
      format.html { }
      format.json {
        render json: UsersDatatable.new(view_context, @users)
      }
    end
```

#### Set json path for your table in view
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
