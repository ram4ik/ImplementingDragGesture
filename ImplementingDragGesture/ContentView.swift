//
//  ContentView.swift
//  ImplementingDragGesture
//
//  Created by ramil on 28.08.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var score: Int = 0
    @State private var draggedOffset = CGSize.zero
    
    @GestureState var dragAmount = CGSize.zero
    
    var body: some View {
        Circle()
            .foregroundColor(.green)
            .frame(width: 200, height: 200)
            .animation(.spring())
            //.offset(y: self.draggedOffset.height)
            .offset(dragAmount)
            
            .gesture(DragGesture()
                        .updating($dragAmount) { value, state, transaction in
                                    state = value.translation
                                print(value)
                                print(state)
                                print(transaction)
                            
                                }
//                        .onChanged({ value in
//                            draggedOffset = value.translation
//                            print(value)
//                        })
//                        .onEnded({ value in
//                            draggedOffset = CGSize.zero
//                        })
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
