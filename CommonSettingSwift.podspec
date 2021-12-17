#
# Be sure to run `pod lib lint CommonSettingSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CommonSettingSwift'
  s.version          = '0.1.0'
  s.summary          = '通用的设置页面封装'

  s.description      = <<-DESC
 支持配置文件和代码两种方式配置，拥有多种常见设置功能
                       DESC

  s.homepage         = 'https://github.com/InsectQY/CommonSettingSwift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'insect' => '704861917@qq.com' }
  s.source           = { :git => 'https://github.com/InsectQY/CommonSettingSwift', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'

  s.source_files = 'CommonSettingSwift/Classes/**/*'
  s.resources = 'CommonSettingSwift/Classes/**/.{xib,png}'
  
  s.subspec 'Core' do |ss|
      ss.source_files = 'CommonSettingSwift/Classes/Core/*'
    end
  
  s.subspec 'About' do |ss|
      ss.source_files = 'CommonSettingSwift/Classes/About/*'
      ss.resources = 'CommonSettingSwift/Classes/About/.{xib,png}'
      ss.dependency 'CommonSettingSwift/Core'
    end
  
  s.subspec 'Introduce' do |ss|
      ss.source_files = 'CommonSettingSwift/Classes/Introduce/*'
      ss.resources = 'CommonSettingSwift/Classes/Introduce/.{xib,png}'
      ss.dependency 'CommonSettingSwift/Core'
    end
  
end
