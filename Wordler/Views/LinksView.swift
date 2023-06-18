//
//  LinksView.swift
//  Wordler
//
//  Created by danilka on 17.06.2023.
//

import SwiftUI
import RealmSwift

struct LinksView: View {
    
    @EnvironmentObject var linksViewModel: LinksViewModel
    
    @ObservedResults(LinkModel.self) var links
    
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    
                    ForEach(links, id: \.id) { link in
                        LinkCardView(link: link) { _ in
                            withAnimation {
                                $links.remove(link)
                            }
                            
                        }
                    }
                    
                    
                }
                
            }
            
            Button {
                linksViewModel.isShowAddView.toggle()
            } label: {
                
                Image(systemName: "plus")
                    .font(.system(size: 36))
                    .foregroundColor(.white)
                    .padding(20)
                    .background(Color.accentColor)
                    .clipShape(Circle())
            }
            .padding(.trailing, 5)
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

struct LinkCardView: View {
    
    @EnvironmentObject var linksViewModel: LinksViewModel
    var link: LinkModel
    var onDelete: (Bool)->()
    
    var body: some View {
        
        HStack {
            HStack {
                Image(systemName: "link")
                Text(link.title)
            }
            
            Spacer()
            
            Button {
                onDelete(true)
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.black)
            }

            
            
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(Color.myGray)
        .cornerRadius(15)
        .onTapGesture {
            linksViewModel.isShowLinkContent.toggle()
            linksViewModel.openUrl = link.url
        }
        
    }
}

struct LinksView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
