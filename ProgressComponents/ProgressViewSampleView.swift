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
                    ProgressView(value: progress)
                        .frame(width: 100, height: 100)
                        .custom(strokeColor: .green, strokeBackgroundColor: .clear, strokeWidth: 10.0)
                    Spacer(minLength: 20.0)
                    
                    
                    ProgressView(value: progress)
                        .frame(width: 100, height: 100)
                        .custom(strokeColor: .orange, strokeBackgroundColor: .gray, strokeWidth: 5.0, animationEffect: .easeIn(duration: 1.5))
                    
                    Spacer(minLength: 20.0)
                    
                    ProgressView(value: progress)
                        .frame(width: 100, height: 100)
                        .custom(strokeColor: .red, strokeBackgroundColor: .clear, strokeWidth: 5.0)
                        .overlay(ProgressView(value: progress)
                                    .frame(width: 80, height: 80).custom(strokeColor: .orange, strokeBackgroundColor: .clear, strokeWidth: 5.0))
                        .overlay(ProgressView(value: progress)
                                    .frame(width: 60, height: 60).custom(strokeColor: .green, strokeBackgroundColor: .clear, strokeWidth: 5.0))
                    Spacer(minLength: 20.0)
                    
                    ProgressView(value: progress)
                        .frame(width: 100, height: 100)
                        .custom(strokeColor: .orange, strokeBackgroundColor: .gray, strokeWidth: 20.0, hasGradient: true)
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
