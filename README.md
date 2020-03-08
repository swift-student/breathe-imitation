# breathe-imitation
This is my entry for the first Swift Over Coffee challenge to imitate the animation from the Breathe app in 1 hour. I did take a bit of time to figure out how a watch app worked before I started my 1 hour timer, since I hadn't done anything for watch before. I used SwiftUI, since I had a little bit of experince with it before and it's implicit animations would make things easier. The animation could be a lot closer to the original, but I'm happy with what I came up with in the time given. Most of my time was spent messing around with the various blend modes trying to come up with something I liked, lol.

![](https://raw.githubusercontent.com/swift-student/breathe-imitation/master/BreatheImitationDemo.gif)

And here is the SwiftUI code:

```swift
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
```

