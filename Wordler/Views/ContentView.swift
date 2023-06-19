//
//  ContentView.swift
//  Wordler
//
//  Created by danilka on 17.06.2023.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @State var selected = 1
    
    @ObservedObject var listViewModel = ListViewModel()
    @ObservedObject var linksViewModel = LinksViewModel()
    @ObservedObject var categoryViewModel = CategoryViewModel()
    
    init() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        
        ZStack {
            TabView(selection: $selected) {
                ListView()
                    .environmentObject(listViewModel)
                    .environmentObject(categoryViewModel)
                    .tag(1)
                    .tabItem {
                        HStack {
                            Text("List")
                            Image(systemName: "list.dash")
                        }
                        
                    }
                
                WordsView()
                    .tag(2)
                    .tabItem {
                        HStack {
                            Text("Words")
                            Image(systemName: "textformat.abc")
                        }
                        
                    }
                
                LinksView()
                    .environmentObject(linksViewModel)
                    .padding(.horizontal, 15)
                    .tag(3)
                    .tabItem {
                        HStack {
                            Text("Links")
                            Image(systemName: "link")
                        }
                    }
                    
            }
            .ignoresSafeArea(.all)
            .padding(.top, 10)
            .blur(radius: categoryViewModel.isShowAddCategory ? 100 : 0)
            .animation(.default, value: categoryViewModel.isShowAddCategory)
            
            if listViewModel.isShowAddView {
                AddNewWordView()
                    .environmentObject(listViewModel)

            }
            
            if linksViewModel.isShowAddView {
                AddNewLinkView()
                    .environmentObject(linksViewModel)
            }
            
            if categoryViewModel.isShowAddCategory {
                withAnimation(.default) {
                    AddNewCategoryView()
                        .environmentObject(categoryViewModel)
                        .shadow(radius: 15)
                }

            }
            
            if linksViewModel.isShowLinkContent {
                withAnimation {
                    LinkShowView(url: $linksViewModel.openUrl)
                        .environmentObject(linksViewModel)
                        
                }

            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
