//
//  ContentView.swift
//  Drawing
//
//  Created by Lance Kent Briones on 5/8/20.
//  Copyright © 2020 Lance Kent Briones. All rights reserved.
//

import SwiftUI

struct Flower: Shape {
    // How much to move this petal away from the center
    var petalOffset: Double = -20
    
    // How wide to make each petal
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        // The path that will hold all petals
        var path = Path()
        
        // Count from 0 up to 2*pi, moving up by pi/8 each time
        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi/8){
            // Rotate the petal by the current value of our loop
            let rotation = CGAffineTransform(rotationAngle: number)
            
            // Move the petal to be at the center of our view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width/2, y: rect.height/2))
            
            // Create a path for this petal using our properties plus a fixed Y and height
            let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y: 0, width: CGFloat(petalWidth), height: rect.width/2))
            
            // Apply our rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)
            
            // Add it to our path
            path.addPath(rotatedPetal)
            
        }
        
        // Now send the main path back
        return path
    }
}

struct ContentView: View {
    @State private var petalOffset: Double = -20.0
    @State private var petalWidth: Double = 100.0
    
    var body: some View {
        VStack{
            Flower(petalOffset: self.petalOffset, petalWidth: self.petalWidth)
                .fill(Color.red, style: FillStyle(eoFill: true))
            
            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
            
            Text("Width")
            Slider(value: $petalWidth, in:0...100)
                .padding(.horizontal)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
