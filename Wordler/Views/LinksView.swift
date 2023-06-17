//
//  LinksView.swift
//  Wordler
//
//  Created by danilka on 17.06.2023.
//

import SwiftUI

struct LinksView: View {
    
    @EnvironmentObject var linksViewModel: LinksViewModel
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            ScrollView(showsIndicators: false) {
                VStack {
                    LinkCardView()
                }
                
            }
            
            Button {
                linksViewModel.isShowAddView.toggle()
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .padding(15)
                    .background(Color.accentColor)
                    .clipShape(Circle())
            }
            .padding(.trailing, 5)
            .padding(.bottom, 20)
        }
    }
}

struct LinkCardView: View {
    var body: some View {
        
        HStack {
            HStack {
                Image(systemName: "link")
                Text("Lorem ipsum dolor sit amet")
            }
            
            Spacer()
            
            Button {
                //
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.black)
            }

            
            
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(Color.myGray)
        .cornerRadius(15)
        
    }
}

struct LinksView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
