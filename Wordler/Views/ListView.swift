//
//  ListView.swift
//  Wordler
//
//  Created by danilka on 17.06.2023.
//

import SwiftUI
import RealmSwift

struct ListView: View {
    
    @State private var searched = ""
    @EnvironmentObject var listViewModel: ListViewModel
    @EnvironmentObject var categoryViewModel: CategoryViewModel
    
    @ObservedResults(WordItem.self, sortDescriptor: SortDescriptor(keyPath: "mainWord", ascending: true)) var wordItems
    
    @State private var sortedType = ""
    @State private var isFilter = false
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 15) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.init(hex: 0xb6b6b6))
                        TextField("Search", text: $searched)
                    }
                    .padding(10)
                    .background(Color.myGray)
                    .clipShape(Capsule())
                    .searchable(text: $searched, collection: $wordItems, keyPath: \.mainWord)
                    
                    
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            CategoryView(text: "🇺🇸", size: 31)
                                .onTapGesture {
                                    withAnimation {
                                        isFilter = false
                                    }
                                    
                                    }
                                    
                            CategoryView(text: "Transport", size: 18)
                                .onTapGesture {
                                    withAnimation {
                                        isFilter = true
                                        sortedType = "CAR"
                                    }
                                }
                            
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
                        if isFilter {
                            ForEach(wordItems.filter({ item in
                                item.mainWord == sortedType
                            }), id: \.id) { item in
                                WordCard(cardItem: item) {
                                    $wordItems.remove(item)
                                }
                            }
                        } else {
                            ForEach(wordItems, id: \.id) { item in
                                WordCard(cardItem: item) {
                                    $wordItems.remove(item)
                                }
                            }
                        }
                        


                    }
                    
                    
                }
                .padding(.horizontal, 15)
                
                
            }
            
            Button {
                withAnimation {
                    listViewModel.isShowAddView.toggle()
                }
                
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 36))
                    .foregroundColor(.white)
                    .padding(20)
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
    
    @State private var offsetX: CGFloat = 0
    @State private var showNote = true
    
    var cardItem: WordItem
    
    var onDelete: ()->()
    
    
    var body: some View {
        ZStack(alignment: .trailing) {
            
            removeIcon()
            
            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(cardItem.location)
                        .font(.system(size: 31))
                        .offset(y: 5)
                    
                    Text(!cardItem.wordNote.isEmpty ? "\(cardItem.mainWord)*" : cardItem.mainWord)
                        .font(.system(size: 30, weight: .semibold))
                    Text(cardItem.wordTranslate)
                        .font(.system(size: 20, weight: .regular))
                }

                
                
                if !cardItem.wordNote.isEmpty{
                    if showNote {
                        Divider()
                        VStack(alignment: .leading) {
                            Text("Note")
                                .font(.system(size: 18, weight: .regular))
                                .foregroundColor(.black.opacity(0.6))
                            Text(cardItem.wordNote)
                        }
                    }
                    
                    
                }


            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 15)
            .padding(.bottom, 15)
            .padding(.top, 5)
            .background(Color.myGray)
            .cornerRadius(25)
            .offset(x: offsetX)
            .gesture(DragGesture()
                .onChanged{ value in
                    if value.translation.width < 0 {
                        offsetX = value.translation.width
                    }
                }
                .onEnded{ value in
                    withAnimation {
                        
                        if screenSize().width * 0.6 < -value.translation.width {
                            
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            
                            withAnimation {
                                offsetX = -screenSize().width
                                onDelete()
                            }

                        }
                        else {
                            offsetX = .zero
                        }
                        
                    }
                    
                }
            )
            .onTapGesture {
                withAnimation {
                    showNote.toggle()
                }
            }
            
        }
        
    }
    
    @ViewBuilder
    func removeIcon() -> some View {
        Image(systemName: "xmark")
            .resizable()
            .frame(width: 10, height: 10)
            .offset(x: 30)
            .offset(x: offsetX * 0.5)
            .scaleEffect(CGSize(width: 0.1 * -offsetX * 0.08, height: 0.1 * -offsetX * 0.08))
    }
    
}

extension View {
    func screenSize() -> CGSize {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        
        return window.screen.bounds.size
    }
}


