# Code::Gen

Ruby files generator gem.

The file generator is a software which given:

    i). A template
    ii). A dataset

transforms the template into a Document expanding the
template tags into their representation using the dataset.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add code-gen

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install code-gen

## Usage

To generate a file we first initialize the template and the dataset. Lastly we call
the generator to output the document on the target path.

### Initialisation of template and dataset

Initialize the generator;

```ruby
Code::Gen.setup do |settings|
  settings.target_folder_path     =  'path/to/target/folder'
  settings.target_filename        =  'filename'
  settings.dataset_path           =  'path/to/json/dataset'
  settings.template_path          =  'path/to/erb/template'
  settings.section_join_character = ';'
end
```

### Run the generator

```ruby
Code::Gen::Run.call
```

After doing the steps above. One should have a document generated on the target path.

Check the `examples` folder readme to see the steps for this in action.

### Dataset format

The gem expects dataset in a json file in this format below;

```json
{
  "module_name": [
    { "id": 1, "text": "Lib" },
    { "id": 2, "text": "Generator" },
  ],
  "class_name": [
    { "id": 1, "text": "name" },
  ],
  "params": [
    { "id": 1, "text": "name" },
    { "id": 2, "text": "email" },
    { "id": 3, "text": "bio" },
    { "id": 4, "text": "address" }
  ],
  "sections":
  [
    { "id": 1, "params_ids": [1, 2] }
  ],
  "code":
  [
    { "id": 1, "text": "Lib" },
    { "id": 2, "text": "Modulator" },
    { "id": 3, "text": "bio" },
    { "id": 4, "text": "address" }
  ],
  "blocks":
  [
    { "id": 1, "code_ids": [1, 2] }
  ]
}
```

### Template 

The gem expects template in a plain file in this format below;

```txt
# frozen_string_literal: true

module [MODULE-NAME-1]
  module [MODULE-NAME-2]
    class [CLASS-NAME-1]
      attr_accessor [ACCESSOR-KV-1]

      def self.call([ACCESSOR-2])
        new([ACCESSOR-3]).call
      end

      def initialize([ACCESSOR-3])
        [WRITER-1]
      end

      def call
        [BLOCK-1].call([ACCESSOR-4])
      end
    end
  end
end
```

## Development & Testing

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Common issues

If `bin/setup` or `bundle install` fails to work because of the machine you are running it on try these below.

For your platform do;

```sh
bundle lock --add-platform [PLATFORM]
```

Then run `bundle install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Sylvance/code-gen.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
