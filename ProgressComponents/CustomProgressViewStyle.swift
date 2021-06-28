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
    var strokeWidth: CGFloat = 5.0
    var startPoint: RoundProgressStartPoint = .top
    var hasGradient = false
    var strokeAngularGradient = AngularGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple]), center: .center)
    var animationEffect: Animation = .easeOut(duration: 1.5)
    
    
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        
        return ZStack {
            Circle()
                .stroke(strokeBackgroundColor, style: StrokeStyle(lineWidth: CGFloat(strokeWidth)))
            
            if hasGradient {
                Circle()
                    .trim(from: 0, to: CGFloat(fractionCompleted))
                    .stroke(strokeAngularGradient, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
                    .rotationEffect(.degrees(startPoint.rawValue))
                    .animation(animationEffect)
            } else {
                Circle()
                    .trim(from: 0, to: CGFloat(fractionCompleted))
                    .stroke(strokeColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
                    .rotationEffect(.degrees(startPoint.rawValue))
                    .animation(animationEffect)
            }
        }
    }
}

internal enum RoundProgressStartPoint: Double {
    case top = -90
    case leading = 180
    case trailing = 0
    case bottom = 90
    
}

extension View {
    
    func custom(strokeColor: Color = .blue, strokeBackgroundColor: Color = .clear, strokeWidth: CGFloat = 5.0, startPoint: RoundProgressStartPoint = .top,  strokeAngularGradient: AngularGradient = AngularGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple]), center: .center), hasGradient: Bool = false, animationEffect: Animation = .easeIn(duration: 1.5)) -> some View {
        
        self.progressViewStyle(RoundProgressStyle(strokeColor: strokeColor, strokeBackgroundColor: strokeBackgroundColor, strokeWidth: strokeWidth, startPoint: startPoint, hasGradient: hasGradient, strokeAngularGradient: strokeAngularGradient, animationEffect: animationEffect))
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
