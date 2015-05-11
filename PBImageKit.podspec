Pod::Spec.new do |spec|
  spec.name         = 'PBImageKit'
  spec.version      = '0.9'
  spec.license      =  { :type => 'MIT' }
  spec.homepage     = 'https://github.com/andyqee/PBImageKit'
  spec.authors      = { 'Ethon Qee' => 'vitasone@gmail.com' }
  spec.summary      = 'Async Image Asset fetcher for iOS.'
  spec.source       = { :git => 'https://github.com/andyqee/PBImageKit.git', }
  spec.source_files = 'PBImageKit/**/*'
  spec.requires_arc = true
  spec.social_media_url = 'https://twitter.com/vitasone'
  spec.library = 'objective-c'
  spec.xcconfig = {
       'CLANG_CXX_LANGUAGE_STANDARD' => 'c++11',
       'CLANG_CXX_LIBRARY' => 'libc++'
  }
    
  spec.ios.deployment_target = '6.0'
end
