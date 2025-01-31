//
//  VerseView.swift
//  FaithMind
//
//  Created by Giventus Marco Victorio Handojo on 31/01/25.
//

import SwiftUI

struct VerseView: View {
    
    let vm = ViewModel()
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack(alignment: .center, spacing: 16) {
                    VStack{
                        Spacer()
                        
                        switch vm.status {
                        case .notStarted:
                            EmptyView()
                        case .fetching:
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                        case .success:
                            
                            Text(vm.bibleVerse.text)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .padding()
                                .padding(.horizontal)
                            Text(vm.bibleVerse.reference)
                                .font(.subheadline)
                                .foregroundColor(.gray)

                        case .failed(let error):
                            Text(error.localizedDescription)
                                .foregroundColor(.red)
                        }
                        Spacer()
                    }

                    Button {
                        Task{
                            await vm.getData(isDaily: false)
                        }
                    } label: {
                        Text("Refresh Verse")
                            .foregroundStyle(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .clipShape(.rect(cornerRadius: 15))
                            
                    }
                    .padding()
                    
                    Spacer(minLength: 95)
                }
                
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .ignoresSafeArea()
        .onAppear {
            Task {
                await vm.getData(isDaily: true)
            }
        }
    }
}

#Preview {
    VerseView()
}

