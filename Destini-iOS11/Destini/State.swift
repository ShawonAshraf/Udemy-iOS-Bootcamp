//
//  State.swift
//  Destini
//
//  Created by Shawon Ashraf on 7/15/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class State {
    public var flow: [Int: String]
    public var currentIndex: Int
    public var completed: Bool
    
    init() {
        flow = [:]
        // since story starts from 1
        currentIndex = 1
        // to mark story completion
        completed = false
    }
    
    public func isComplete() -> Bool {
        completed =  currentIndex == 4 || currentIndex == 5 || currentIndex == 6
        return completed
    }
}
