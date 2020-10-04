# -*- encoding: utf-8 -*-
# stub: carrierwave-audio 1.0.9 ruby lib

Gem::Specification.new do |s|
  s.name = "carrierwave-audio".freeze
  s.version = "1.0.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Trevor Hinesley".freeze]
  s.date = "2018-08-28"
  s.description = "CarrierWave Audio".freeze
  s.email = ["trevor@trevorhinesley.com".freeze]
  s.homepage = "https://github.com/TrevorHinesley/carrierwave-audio".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.6.2".freeze
  s.summary = "Simple SoX wrapper for CarrierWave uploader that allows audio file conversion and watermarking".freeze

  s.installed_by_version = "2.7.6.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<carrierwave>.freeze, [">= 0.10.0"])
      s.add_runtime_dependency(%q<ruby-sox>.freeze, [">= 0.0.3"])
      s.add_runtime_dependency(%q<soxi-wrapper>.freeze, [">= 0.0.1"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<carrierwave>.freeze, [">= 0.10.0"])
      s.add_dependency(%q<ruby-sox>.freeze, [">= 0.0.3"])
      s.add_dependency(%q<soxi-wrapper>.freeze, [">= 0.0.1"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<carrierwave>.freeze, [">= 0.10.0"])
    s.add_dependency(%q<ruby-sox>.freeze, [">= 0.0.3"])
    s.add_dependency(%q<soxi-wrapper>.freeze, [">= 0.0.1"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end