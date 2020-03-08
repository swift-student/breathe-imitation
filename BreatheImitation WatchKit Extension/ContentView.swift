//
//  ContentView.swift
//  BreatheImitation WatchKit Extension
//
//  Created by Shawn Gee on 3/7/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            
            ExpandingFlower(viewModel: viewModel)
                .foregroundColor(Color(red: 0, green: 0.5, blue: 1.0))
                .blendMode(.hardLight)
                .shadow(color: .blue, radius: 3.0, x: 0, y: 0)
            
            ExpandingFlower(viewModel: viewModel)
                .foregroundColor(Color(red: 0, green: 0.7, blue: 1.0))
                .blendMode(.hardLight)
            
            ExpandingFlower(viewModel: viewModel)
                .foregroundColor(Color.white.opacity((1 - Double(viewModel.animationFactor)) * 0.5))
            
        }.animation(.easeOut(duration: 2.0))
        
    }
}

struct ExpandingFlower: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        
        ZStack {
            SlidingCircle(animationFactor: $viewModel.animationFactor, rotation: 0)
            SlidingCircle(animationFactor: $viewModel.animationFactor, rotation: 360 / 6 * 1)
            SlidingCircle(animationFactor: $viewModel.animationFactor, rotation: 360 / 6 * 2)
            SlidingCircle(animationFactor: $viewModel.animationFactor, rotation: 360 / 6 * 3)
            SlidingCircle(animationFactor: $viewModel.animationFactor, rotation: 360 / 6 * 4)
            SlidingCircle(animationFactor: $viewModel.animationFactor, rotation: 360 / 6 * 5)
        }.rotationEffect(Angle(degrees: Double(viewModel.animationFactor) * 90))
            
    }
}

struct SlidingCircle: View {
    @Binding var animationFactor: CGFloat
    @State var rotation: Double
    @State var size: CGFloat = 25
    
    var body: some View {
        VStack {
            Circle()
                .frame(width: size, height: size)
                .scaleEffect(1 + animationFactor * 1.5, anchor: .top)
                .offset(y: size / 2 * animationFactor)
        }
        .rotationEffect(Angle(degrees: rotation))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
