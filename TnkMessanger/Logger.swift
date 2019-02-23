//
//  Logger.swift
//  TnkMessanger
//
//  Created by Никита on 10/02/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Foundation
class Logger{
    static func printDebugInfo(_ info: String){
        #if DEBUG
        print(info)
        #endif
    }
    
    static func printGeneral<T>(_ info: T){
        #if DEBUG
        print(info)
        #endif
    }
}
