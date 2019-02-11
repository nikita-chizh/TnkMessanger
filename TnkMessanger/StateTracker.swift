//
//  StateTracker.swift
//  TnkMessanger
//
//  Created by Никита on 10/02/2019.
//  Copyright © 2019 Никита. All rights reserved.
//
import UIKit
import Foundation

class StateTracker{
    static var state: UIApplication.State?
    
    //Вернет старый state, если он поменялся
    static func checkAndReturn(newState: UIApplication.State)->UIApplication.State?{
        if state == nil{
            StateTracker.state = newState
            return nil
        }
        
        if newState != StateTracker.state!{
            let _state = StateTracker.state
            StateTracker.state = newState
            return _state!
        }
        return newState
    }
    
    static func stateToString(_ state: UIApplication.State)->String{
        switch state {
        case .active:
            return "active"
        case .inactive:
            return "inactive"
        case .background:
            return "background"
        default:
            break
        }
        return "something strange"
    }
    
    static func printState(funcName: String){
        #if DEBUG
        let curstate = UIApplication.shared.applicationState
        let oldstate = StateTracker.checkAndReturn(newState: curstate)
        if oldstate == nil{
            print("Application in sate=")
            print(stateToString(curstate))
            print("in function=" + funcName + "\n")
            return
        }
        if oldstate! != curstate{
            print("Application moved from ")
            print(stateToString(oldstate!))
            print("to")
            print(stateToString(curstate))
            print("in function=" + funcName + "\n")
        }
        #endif
    }
    
}
