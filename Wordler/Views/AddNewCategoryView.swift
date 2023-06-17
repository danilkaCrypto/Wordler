//
//  AddNewCategoryView.swift
//  Wordler
//
//  Created by danilka on 17.06.2023.
//

import SwiftUI

struct AddNewCategoryView: View {
    @State private var title = ""
    @EnvironmentObject var categoryViewModel: CategoryViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            VStack {
                HStack {
                    
                    Spacer()
                    
                    Text("New category")
                        .offset(x: 10)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Spacer()
                    
                    Button {
                        categoryViewModel.isShowAddCategory.toggle()
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(.black)
                    }
                    
                    
                }
                
                TextFieldView(text: $title, icon: "", title: "Title")
                    
                
                Spacer()
                
                Button {
                    categoryViewModel.isShowAddCategory.toggle()
                } label: {
                    TranslateButton(text: "Save")
                }

                
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 15)
            

            
            
        }
        
        .frame(width: UIScreen.main.bounds.width - 75, height: UIScreen.main.bounds.height / 2.5)
        .background(Color.lightGray)
        .cornerRadius(25)
        .padding(.vertical, 10)
    }
}

struct AddNewCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCategoryView()
    }
}
