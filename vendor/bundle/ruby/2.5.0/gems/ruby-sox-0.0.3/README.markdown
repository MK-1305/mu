# Ruby SoX

[![Build Status](https://travis-ci.org/TMXCredit/ruby-sox.png?branch=master)](https://travis-ci.org/TMXCredit/ruby-sox)

A Ruby wrapper for the `sox` command line tool to process sound.


## Dependencies

* SoX
* Bash (for process substitution combiner strategy)
* Chromaprint (only to run tests)

### Debian / Ubuntu

```bash
apt-get install libsox-fmt-all sox libchromaprint-dev
```

### Mac

```bash
# One of the following
# Notes:
# * chromaprint is not available in MacPorts as of this writing
# * flac must be installed before sox so it will link during compilation
sudo port install flac sox && brew install chromaprint
brew install flac sox chromaprint
```

# Usage

Remember that it's a wrapper for `sox` to provide Ruby API.
It's assumed that you know the basics of sound computing theory and how
the `sox` tool works. Otherwise, `man sox` is your good friend.

## Sox::Cmd

Allows you to do everything that the `sox` command does.

Mix 3 files into one (ruby-sox assumes that input files have same rate and number of channels):

```ruby
# Build command
sox = Sox::Cmd.new(:combine => :mix)
        .add_input("guitar1.flac")
        .add_input("guitar2.flac")
        .add_input("drums.flac")
        .set_output("hell_rock-n-roll.mp3")
        .set_effects(:rate => 44100, :channels => 2)

# Execute command
sox.run
```

## Sox::Combiner

Sox::Combiner combines files even if they have different rates or numbers
of channels. Under the hood, it converts the input files into temporary files
to have the same rate and number of channels, and then combines them.

Concatenate:

```ruby
combiner = Sox::Combiner.new(['in1.mp3', 'in2.ogg', 'in3.wav'], :combine => :concatenate)
combiner.write('out.mp3')
```

Mix 3 files into an MP3 with 2 channels and a rate of 1600:

```ruby
combiner = Sox::Combiner.new(['in1.mp3', 'in2.ogg', 'in3.wav'], :combine => :mix, :rate => 1600, :channels => 2)
combiner.write('out.mp3')
```

## Run specs

```bash
rake spec
```

## Credits

* [Sergey Potapov](https://github.com/greyblake)

## License

Copyright (c) 2013 TMX Credit, author Potapov Sergey

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

The audio files are distributed under [Creative Commons Attribution 3.0
Unported License](http://creativecommons.org/licenses/by/3.0/legalcode).

## Copyright

Copyright (c) 2013 TMX Credit.
