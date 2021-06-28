//
//  ProgressViewSampleView.swift
//  ProgressComponents
//
//  Created by Daniel Ayala on 27/6/21.
//

import SwiftUI

struct ProgressViewSampleView: View {
    @State private var progress = 0.2
    
    var body: some View {
        ScrollView {
            VStack() {
                Group {
                    RoundProgressView(fractionCompleted: $progress, strokeColor: .green, strokeBackgroundColor: .clear, strokeWidth: 10.0)
                        .frame(width: 100, height: 100)
                    
                    Spacer(minLength: 20.0)
                    
                    RoundProgressView(fractionCompleted: $progress, strokeColor: .orange, strokeBackgroundColor: .gray, strokeWidth: 5.0, animationEffect: .easeIn(duration: 1.5))
                        .frame(width: 100, height: 100)
                    
                    Spacer(minLength: 20.0)
                    
                    RoundProgressView(fractionCompleted: $progress, strokeColor: .red, strokeBackgroundColor: .clear, strokeWidth: 5.0)
                        .frame(width: 100, height: 100)
                        .overlay(RoundProgressView(fractionCompleted: $progress, strokeColor: .orange, strokeBackgroundColor: .clear, strokeWidth: 5.0).frame(width: 80, height: 80))
                        .overlay(RoundProgressView(fractionCompleted: $progress, strokeColor: .green, strokeBackgroundColor: .clear, strokeWidth: 5.0).frame(width: 60, height: 60))
                    Spacer(minLength: 20.0)
                    
                    RoundProgressView(fractionCompleted: $progress, strokeColor: .orange, strokeBackgroundColor: .gray, strokeWidth: 20.0, hasGradient: true)
                            .frame(width: 100, height: 100)
                    
                    Spacer(minLength: 20.0)
                    
                }
                
                Group {
                    Divider()
                    
                    Button(action: {
                        progress = 1.0
                    }, label: {
                        Text("Animate Progress")
                    })
                    Divider()
                    Button(action: {
                        progress = 0.2
                    }, label: {
                        Text("Reset Progress")
                    })
                    Divider()
                    
                }
            }
            .padding()
        }
    }
}

struct ProgressViewSampleView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViewSampleView()
    }
}
