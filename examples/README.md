# Instructions

Run `bin/console`

setup the gem this way;

```ruby
Code::Gen.setup do |settings|
  settings.target_folder_path     =  'examples/'
  settings.target_filename        =  'result.txt'
  settings.dataset_path           =  'examples/dataset.json'
  settings.template_path          =  'examples/template.txt'
  settings.section_join_character = ';'
end
```

Then run the generator this way

```ruby
Code::Gen::Run.call
```

This will generate a `result.txt` in the examples folder that looks like this below;

```txt
A T&C Document
This document is made of plaintext.
Is made of And dies.
Is made of The white horse is white.
Is made of The quick brown fox;jumps over the lazy dog.
Your legals.
```
