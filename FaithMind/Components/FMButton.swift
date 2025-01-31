//
//  FHButton.swift
//  FaithMind
//
//  Created by Giventus Marco Victorio Handojo on 31/01/25.
//

import SwiftUI

struct FMButton: View {
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text("Get Verse")
                .foregroundStyle(.white)
                .padding()
                .background(Color.blue)
                .clipShape(.rect(cornerRadius: 15))
               
        }
        .frame(width: .infinity)
       

    }
}

#Preview {
    FMButton(action: {print("")})
}
