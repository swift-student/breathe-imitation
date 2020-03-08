//
//  ViewModel.swift
//  BreatheImitation WatchKit Extension
//
//  Created by Shawn Gee on 3/8/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var animationFactor: CGFloat = 0
    
    var timer = Timer()
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) {_ in
            print("hello world")
            self.animationFactor = self.animationFactor == 0 ? 1 : 0
        }
    }
    
}
