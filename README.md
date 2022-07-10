# Smart Pension Ruby Test

## Running Code

Please go into the respective repo folder
```
$ cd #{path_where_your_repo_is_downloaded}/smart_pension_ruby_test
```

Run the code by passing the name of log file (with particular path if you file is not in repo folder) . I have already added webserver.log file to check the functionality .

```
$ ruby ./parser.rb webserver.log
```

## Running RSpec Test Cases
Please go into the respective repo folder
```
$ cd #{path_where_your_repo_is_downloaded}/smart_pension_ruby_test
```

Ensure rspec gem is installed 
```
$ bundle install
```

Run rspec tests by running below command
```
$ bundle exec rspec
```