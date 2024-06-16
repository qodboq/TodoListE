//
//  NoItemsView.swift
//  TodoListE
//
//  Created by Erik Valigurský on 13/06/2024.
//

import SwiftUI

struct NoItemsView: View {
    
    @State private var animate: Bool = false
    
    
    var body: some View {

            VStack {
                Text("Task free day ?")
                    .font(.title)
                    .fontWeight(.semibold)
                  Spacer()
                NavigationLink(destination: AddView()) {
                   Text("Add Something 🤩")
                        .foregroundStyle(Color.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(animate ? Color.red : Color.black)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 10), style: .continuous))
                        .padding(50)
//                        .padding([.bottom], 10)
                }
            }.onAppear(perform: {
                addAnimation()
            })
        
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
    func addAnimation () {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
            Animation
                .easeInOut(duration: 2)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NoItemsView()
}
