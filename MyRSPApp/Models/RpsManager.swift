//
//  RpsManager.swift
//  MyRSPApp
//
//  Created by 김서연 on 2023/08/30.
//

import Foundation

protocol RPSManagerProtocol {
    func getRpsResult(comChoice: Rps, myChoice: Rps) -> String
}

struct RPSManager: RPSManagerProtocol {
    
    func getRpsResult(comChoice: Rps, myChoice: Rps) -> String {
        if comChoice == myChoice {
            return "비겼다"
        } else if comChoice == .rock && myChoice == .paper {
            return "이겼다"
        } else if comChoice == .paper && myChoice == .scissors {
            return "이겼다"
        } else if comChoice == .scissors && myChoice == .rock {
            return "이겼다"
        } else {
            return "졌다"
        }
    }
}
