//
//  LinkShowView.swift
//  Wordler
//
//  Created by danilka on 18.06.2023.
//

import SwiftUI

struct LinkShowView: View {
    @EnvironmentObject var linksViewModel: LinksViewModel
    
    @Binding var url: String
    @State private var isLoaded = false
    @State private var title = ""
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 0) {
                HStack{
                    Circle()
                        .frame(width: 30)
                        .foregroundColor(isLoaded ? Color.accentColor : Color.black)
                    Spacer()
                    
                    Text(title)
                        .fontWeight(.bold)
                        
                    Spacer()
                    
                    Button {
                        linksViewModel.isShowLinkContent.toggle()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    }

                }
                .padding(.bottom, 10)
                .padding(.horizontal, 15)
                
                .background(Color.myGray)
                WebView(url: $url) { isLoad in
                    self.isLoaded = isLoad
                }
            }
            
        }
        .onAppear {
            if let url = URL(string: url) {
                self.title = url.host ?? ""
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
