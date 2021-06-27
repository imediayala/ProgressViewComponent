//
//  CustomProgressViewStyle.swift
//  ProgressComponents
//
//  Created by Daniel Ayala on 25/6/21.
//

import SwiftUI

struct CustomProgressViewStyle: View {
    @State private var progress = 0.2
    
    var body: some View {
        ProgressView(value: progress, total: 1.0)
            .progressViewStyle(RoundProgressStyle())
            .frame(width: 200, height: 200)
            .contentShape(Rectangle())
            .onTapGesture {
                if progress < 1.0 { progress += 0.8 }
            }
    }
}

struct RoundProgressStyle: ProgressViewStyle {
    var strokeColor = Color.blue
    var strokeBackgroundColor = Color.gray
    var strokeAngularGradient = AngularGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple]), center: .center)
    var strokeWidth = 5.0
    var hasGradient = false
    var animationEffect: Animation = .easeOut(duration: 1.5)
    
    
    
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        
        return ZStack {
            Circle()
                .stroke(strokeBackgroundColor, style: StrokeStyle(lineWidth: CGFloat(strokeWidth)))
            
            if hasGradient {
                Circle()
                    .trim(from: 0, to: CGFloat(fractionCompleted))
                    .stroke(strokeAngularGradient, style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(animationEffect)
            } else {
                Circle()
                    .trim(from: 0, to: CGFloat(fractionCompleted))
                    .stroke(strokeColor, style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(animationEffect)
            }
        }
    }
}


extension View {
    
    func custom(strokeColor: Color = .blue, strokeBackgroundColor: Color = .clear, strokeWidth: CGFloat = 5.0, strokeAngularGradient: AngularGradient = AngularGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple]), center: .center), hasGradient: Bool = false, animationEffect: Animation = .easeIn(duration: 1.5)) -> some View {
        
        self.progressViewStyle(RoundProgressStyle(strokeColor: strokeColor, strokeBackgroundColor: strokeBackgroundColor, strokeAngularGradient: strokeAngularGradient, strokeWidth: 5.0, hasGradient: hasGradient))
        
    }
}

struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .shadow(color: Color(red: 0, green: 0, blue: 0.6),
                    radius: 4.0, x: 1.0, y: 2.0)
    }
}

struct CustomProgressViewStyle_Previews: PreviewProvider {
    static var previews: some View {
        CustomProgressViewStyle()
    }
}
