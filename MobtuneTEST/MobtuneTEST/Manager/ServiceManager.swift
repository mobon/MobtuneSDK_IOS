//
//  ServiceManager.swift
//  MobtuneTEST
//
//  Created by DoHyoung Kim on 2021/12/21.
//

import Foundation

class ServiceManager: NSObject {
    
    static let shared = ServiceManager()
    
    public var userInfo: [String: Any] = [:]
    public var cartInfo: [String: Any] = [:]
    
    
}
