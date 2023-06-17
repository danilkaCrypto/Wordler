//
//  AddNewWordView.swift
//  Wordler
//
//  Created by danilka on 17.06.2023.
//

import SwiftUI

struct AddNewWordView: View {
    
    @State private var category = ""
    @State private var word = ""
    @State private var translation = ""
    @State private var note = ""
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                
                Spacer()
                Text("New word")
                    .offset(x: 10)
                    .font(.system(size: 28, weight: .semibold))
                
                Spacer()
                
                Button {
                    listViewModel.isShowAddView.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 23, height: 23)
                        .foregroundColor(.black)
                }


            }
            
            HStack {
                Text("🇺🇸")
                    .font(.system(size: 31))
                
                Picker(selection: $category) {
                    ForEach(0..<5) { category in
                        Text("Category\(category)")
                    }
                } label: {
                    Text("Select category")
                }
                .padding(.horizontal, 10)
                .background(Color.myGray)
                .clipShape(Capsule())

            }
            
            VStack(spacing: 15) {
                TextFieldView(text: $word, icon: "", title: "Word")
                TextFieldView(text: $translation, icon: "", title: "Translation")
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Note")
                    .padding(.horizontal, 15)
                    .font(.system(size: 20))
                    .foregroundColor(.black.opacity(0.5))
                TextEditor(text: $note)
                    .scrollContentBackground(.hidden)
                    .padding(15)
                    .background(Color.myGray)
                    .cornerRadius(15)
                    .frame(height: UIScreen.main.bounds.height / 3)
                    
            }
            
            Spacer()
            Button {
                listViewModel.isShowAddView.toggle()
            } label: {
                GreenButton(text: "Save")
            }

            
        }
        .padding(.horizontal, 15)
        .padding(.top, 5)
        .background(Color.white)
    }
}

struct AddNewWordView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewWordView()
    }
}



