//
//  Configuration.swift
//  dolap
//
//  Created by Alper Şenyurt on 2.07.2020.
//  Copyright © 2020 Dolap. All rights reserved.
//

import Foundation

protocol Configuration {
    
    func getAPIEndpointURL() -> String
    func clickStreamUrl() -> String
    func clickStreamApiKey() -> String
    func clickStreamSecret() -> String
    func leanplumAppId() -> String
    func leanplumApiKey() -> String
    func paymentGatewayUrl() -> String
    func apiGatewayUrl() -> String
    func facebookAppId() -> String
    func adjustKey() -> String
    func intercomApiKey() -> String
    func intercomAppId() -> String
    func branchKey() -> String
    func clickStreamSessionStartTime() -> Int
    func getBranchBaseLink() -> String
    func getBranchFullUrl() -> String
    func getAdmobBannerAdUnitIdFor() -> String 
    func getSignInWithTrendyolAppId() -> String
}

// Environment'e göre değişmeyen sabitlerimiz.
extension Configuration {
  
    func getBaseUrlForDeeplink() -> String {
        return "Constant here"
    }
    
    func getAdjustBaseUrl() -> String {
        return "Constant here"
    }
    
    func getBaseUrlForShortener() -> String {
        return "Constant here"
    }
    
    func webUrl() -> String {
        return "https://dolap.com"
    }
    
    func getEnvironmentType(for identifier: String) -> EnvironmentConfiguration.EnvironmentType {
        return ConfigurationBuilder.getEnvironmentType(identifier: identifier)

    }
    
    func getSignInWithTrendyolAppId() -> String {
        return "Constant here"
    }
}
