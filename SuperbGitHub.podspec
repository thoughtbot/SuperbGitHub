Pod::Spec.new do |s|
  s.name = "SuperbGitHub"
  s.version = %x(git describe --tags --abbrev=0).chomp
  s.summary = "GitHub authentication provider for Superb."
  s.homepage = "https://github.com/thoughtbot/SuperbGitHub"
  s.license = { type: "MIT", file: "LICENSE" }
  s.author = {
    "Adam Sharp" => "adam@thoughtbot.com",
    "thoughtbot" => nil,
  }
  s.social_media_url = "https://twitter.com/thoughtbot"
  s.platform = :ios, "9.0"
  s.source = { git: "https://github.com/thoughtbot/#{s.name}.git", tag: "#{s.version}" }
  s.source_files = "Sources/#{s.name}/**/*.{swift,h}"
  s.module_map = "Sources/#{s.name}/module.modulemap"
  s.public_header_files = "Sources/#{s.name}/#{s.name}.h"
  s.dependency "Superb", "~> 0.1.0"
end
