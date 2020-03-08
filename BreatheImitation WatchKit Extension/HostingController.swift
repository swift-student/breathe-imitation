//
//  HostingController.swift
//  BreatheImitation WatchKit Extension
//
//  Created by Shawn Gee on 3/7/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<ContentView> {
    
    override var body: ContentView {
        return ContentView(viewModel: ViewModel())
    }
}
