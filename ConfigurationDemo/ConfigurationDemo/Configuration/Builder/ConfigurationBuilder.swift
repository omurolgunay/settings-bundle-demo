//
//  ConfigurationBuilder.swift
//  dolap
//
//  Created by Alper Şenyurt on 2.07.2020.
//  Copyright © 2020 Dolap. All rights reserved.
//

import Foundation


struct ConfigurationBuilder {
    
    static func getEnvironmentType(identifier: String) -> EnvironmentConfiguration.EnvironmentType {

        #if TEST
        if let env = UserDefaults.standard.string(forKey: identifier), env.isEmpty == false {
            return EnvironmentConfiguration.EnvironmentType(rawValue: env)!
        }
        return .development
        
        #elseif DEBUG
        return .development
        
        #else
        return .production
        
        #endif
    }
   
    static func buildConfiguration(for configKey: String) -> Configuration {
        
        let environmentType = getEnvironmentType(identifier: configKey)
        
        switch environmentType {
            case .development:
                return QAConfiguration()
            case .production :
                return ProductionConfiguration()
        }
    }
    
    static func getSwitchValueOf(key: String) -> Bool {
        #if TEST
        return UserDefaults.standard.bool(forKey: key)
        #else
        return false
        #endif
    }
}
