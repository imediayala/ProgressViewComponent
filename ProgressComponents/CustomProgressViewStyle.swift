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
        RoundProgressView(fractionCompleted: $progress)
            .frame(width: 200, height: 200)
            .contentShape(Rectangle())
            .onTapGesture {
                if progress < 1.0 { progress += 0.8 }
            }
    }
}

struct RoundProgressView: View {
    @Binding var fractionCompleted: Double
    var strokeColor = Color.blue
    var strokeBackgroundColor = Color.gray
    var strokeWidth: CGFloat = 5.0
    var startPoint: RoundProgressStartPoint = .top
    var hasGradient = false
    var strokeAngularGradient = AngularGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple]), center: .center)
    var animationEffect: Animation = .easeOut(duration: 1.5)
    
    var body: some View {
        GeometryReader { geometry in
            let height = geometry.size.height
            let width = geometry.size.width
            ZStack {
                Circle()
                    .stroke(strokeBackgroundColor, style: StrokeStyle(lineWidth: CGFloat(strokeWidth)))
                    .frame(width: width - strokeWidth, alignment: .center)
                    .position(x: width/2, y: height/2)
                
                if hasGradient {
                    Circle()
                        .trim(from: 0, to: CGFloat(fractionCompleted))
                        .stroke(strokeAngularGradient, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
                        .frame(width: width - strokeWidth, alignment: .center)
                        .position(x: width/2, y: height/2)
                        .rotationEffect(.degrees(startPoint.rawValue))
                        .animation(animationEffect)
                } else {
                    Circle()
                        .trim(from: 0, to: CGFloat(fractionCompleted))
                        .stroke(strokeColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
                        .frame(width: width - strokeWidth, alignment: .center)
                        .position(x: width/2, y: height/2)
                        .rotationEffect(.degrees(startPoint.rawValue))
                        .animation(animationEffect)
                }
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

struct CustomProgressViewStyle_Previews: PreviewProvider {
    static var previews: some View {
        CustomProgressViewStyle()
    }
}
