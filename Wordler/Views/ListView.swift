//
//  ListView.swift
//  Wordler
//
//  Created by danilka on 17.06.2023.
//

import SwiftUI

struct ListView: View {
    
    @State private var searched = ""
    @EnvironmentObject var listViewModel: ListViewModel
    @EnvironmentObject var categoryViewModel: CategoryViewModel
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 15) {
                    TextFieldView(text: $searched, icon: "magnifyingglass", title: "Search")
                    
                    
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            CategoryView(text: "🇺🇸", size: 31)
                            CategoryView(text: "Transport 🚘", size: 18)
                            
                            Button {
                                categoryViewModel.isShowAddCategory.toggle()
                            } label: {
                                CategoryView(text: "+", size: 18)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                            }
                            
                        }
                        
                        .padding(.horizontal, 15)
                    }
                    .padding(.horizontal, -15)
                    
                    VStack(spacing: 15) {
                        WordCard()
                        WordCard()
                        WordCard()
                    }
                    
                    
                }
                .padding(.horizontal, 15)
                
                
            }
            
            Button {
                listViewModel.isShowAddView.toggle()
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .padding(15)
                    .background(Color.accentColor)
                    .clipShape(Circle())
            }
            .padding(.trailing, 20)
            .padding(.bottom, 20)

            
        }
        
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CategoryView: View {
    
    var text: String
    var size: CGFloat
    
    var body: some View {
        Text(text)
            .font(.system(size: size))
            .padding(.horizontal, 15)
            .padding(.vertical, size > 18 ? 3 : 11)
            .background(Color.myGray)
            .clipShape(Capsule())
    }
}

struct WordCard: View {
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("🇺🇸")
                .font(.system(size: 31))
                .offset(y: 5)
            Text("Car")
                .font(.system(size: 30, weight: .semibold))
            Text("Машина")
                .font(.system(size: 20, weight: .regular))
            
            Divider()
            
            Text("Note")
                .font(.system(size: 18, weight: .regular))
                .foregroundColor(.black.opacity(0.6))
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis suscipit libero tellus, quis sagittis metus venenatis iaculis.")
        }
        .frame(width: .infinity)
        .padding(.horizontal, 15)
        .padding(.bottom, 15)
        .padding(.top, 5)
        .background(Color.myGray)
        .cornerRadius(25)
        

    }
    
}


