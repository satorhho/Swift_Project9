//
//  ContentView.swift
//  Drawing
//
//  Created by Lance Kent Briones on 5/8/20.
//  Copyright © 2020 Lance Kent Briones. All rights reserved.
//

import SwiftUI
struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // For the arrow head
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        
        // For the body
        path.move(to: CGPoint(x: rect.midX, y: rect.midY + (rect.midY/2)))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY/2))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY/2))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY + (rect.midY/2)))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY + (rect.midY/2)))
        
        return path
    }
}

struct ContentView: View {
    @State private var line_width: CGFloat = 1.0
    var body: some View {
        VStack{
            Spacer()
            Arrow()
                .stroke(Color.red, style: StrokeStyle(lineWidth: self.line_width, lineCap: .round, lineJoin: .round))
                .frame(width: 300, height: 300)
                .animation(.easeInOut(duration: 0.2))
            
            Spacer()
            
            Text("Arrow Line Width")
            Slider(value: $line_width, in: 1...15)
            
            Spacer()
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
