//
//  Environment.swift
//  dolap
//
//  Created by Alper Şenyurt on 21.06.2020.
//  Copyright © 2020 Dolap. All rights reserved.
//

import Foundation

class EnvironmentConfiguration: Configuration {

    enum EnvironmentType: String {
        case development = "Debug"
        case production = "Prod"
    }
    
    struct EnvironmentSettingsKey {
        static let clickStreamEnvKey = "clickStreamEnvironment"
        static let apiEnvKey = "apiEnvironment"
        static let leanplumEnvKey = "leanplumEnvironment"
        static let branchEnvKey = "branchEnvironment"
        static let adjustEnvKey = "adjustEnvironment"
        static let paymentEnvKey = "paymentEnvironment"
        static let intercomEnvKey = "intercomEnvironment"
        static let facebookEnvKey = "facebookEnvironment"
        static let googleAnalyticsEnvKey = "googleAnalyticsEnvironment"
        static let notificationRedesignEnvKey = "notificationRedesignEnvironment"
        static let notificationRedesignMockUrlKey = "notificationCustomUrlEnvironment"
        static let admobEnvKey = "admobEnviroment"
    }

    
    ///API için ortam değişirse ilgili kullanıcıyı logout ediyoruz
    func prepareEnvironment() {
        let newEnvironment = ConfigurationBuilder.getEnvironmentType(identifier: EnvironmentSettingsKey.apiEnvKey)
        if let oldEnvironment = UserDefaults.standard.string(forKey: EnvironmentConfiguration.Constants.lastSelectedEnvironment), oldEnvironment.isEmpty == false {
            
            if oldEnvironment != newEnvironment.rawValue {
                //Logout member here
            }
        }
        UserDefaults.standard.set(newEnvironment.rawValue, forKey: EnvironmentConfiguration.Constants.lastSelectedEnvironment)

    }
    
 
    func createConfiguration(key: String) -> Configuration {
       return ConfigurationBuilder.buildConfiguration(for: key)
    }

    func getAPIEndpointURL() -> String {
        return createConfiguration(key: EnvironmentSettingsKey.apiEnvKey)
            .getAPIEndpointURL()
    }
    
    func clickStreamUrl() -> String {
        return createConfiguration(key: EnvironmentSettingsKey.clickStreamEnvKey).clickStreamUrl()
    }
    func clickStreamApiKey() -> String {
        return createConfiguration(key: EnvironmentSettingsKey.clickStreamEnvKey).clickStreamApiKey()
    }
    
    func clickStreamSecret() -> String {
        return createConfiguration(key: EnvironmentSettingsKey.clickStreamEnvKey).clickStreamSecret()
    }
    
    func clickStreamSessionStartTime() -> Int {
        return createConfiguration(key: EnvironmentSettingsKey.clickStreamEnvKey).clickStreamSessionStartTime()
    }
    
    func leanplumAppId() -> String {
        return createConfiguration(key: EnvironmentSettingsKey.leanplumEnvKey).leanplumAppId()
    }
    
    func leanplumApiKey() -> String {
        return createConfiguration(key: EnvironmentSettingsKey.leanplumEnvKey).leanplumApiKey()
    }
    
    func paymentGatewayUrl() -> String {
        return createConfiguration(key: EnvironmentSettingsKey.paymentEnvKey).paymentGatewayUrl()
    }
    
    func apiGatewayUrl() -> String {
        return createConfiguration(key: EnvironmentSettingsKey.apiEnvKey).apiGatewayUrl()
    }

    func facebookAppId() -> String {
        return createConfiguration(key: EnvironmentSettingsKey.facebookEnvKey).facebookAppId()
    }
    
    func adjustKey() -> String {
        return createConfiguration(key: EnvironmentSettingsKey.adjustEnvKey).adjustKey()
    }
    
    func intercomApiKey() -> String {
        return createConfiguration(key: EnvironmentSettingsKey.intercomEnvKey).intercomApiKey()
    }
    
    func intercomAppId() -> String {
        return createConfiguration(key: EnvironmentSettingsKey.intercomEnvKey).intercomAppId()
    }
    
    func branchKey() -> String {
        return createConfiguration(key: EnvironmentSettingsKey.branchEnvKey).branchKey()
    }
    
    func getBranchBaseLink() -> String {
        return createConfiguration(key: EnvironmentSettingsKey.branchEnvKey).getBranchBaseLink()
    }
    
    func getBranchFullUrl() -> String {
        return createConfiguration(key: EnvironmentSettingsKey.branchEnvKey).getBranchBaseLink()
    }
    
    func getAdmobBannerAdUnitIdFor() -> String {
        return createConfiguration(key: EnvironmentSettingsKey.admobEnvKey).getAdmobBannerAdUnitIdFor()
    }
    
    //MARK: NOTIFICATION REDESIG
    func notificationNewDesignFeatureFlagIsEnable() -> Bool {
        return ConfigurationBuilder.getSwitchValueOf(key: EnvironmentSettingsKey.notificationRedesignEnvKey)
    }
    
    func customUrlForNotificationRedesign() -> String {
        if let value = UserDefaults.standard.string(forKey: EnvironmentSettingsKey.notificationRedesignMockUrlKey) {
            return value
        } else {
            //Default value for textfield should be write programatically
            return "https://mock.pstmn.io/notifications"
        }
    }

}

extension EnvironmentConfiguration {
    struct Constants {
        static let lastSelectedEnvironment = "lastSelectedEnvironment"
    }
}
