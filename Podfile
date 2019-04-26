source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target 'PlantApp' do
    pod 'JTAppleCalendar', '~> 7.0'
    pod 'Firebase/Core'
    pod 'Firebase/Auth'
    pod 'Firebase/Storage'
    pod 'Firebase/Database'
    pod 'SwiftyJSON'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.0'
        end
    end
end
