//
//  AddNewLinkView.swift
//  Wordler
//
//  Created by danilka on 17.06.2023.
//

import SwiftUI

struct AddNewLinkView: View {
    @State private var title = ""
    @State private var link = ""
    
    @EnvironmentObject var linksViewModel: LinksViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                
                Spacer()
                Text("New link")
                    .offset(x: 10)
                    .font(.system(size: 28, weight: .semibold))
                
                Spacer()
                
                Button {
                    linksViewModel.isShowAddView.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 23, height: 23)
                        .foregroundColor(.black)
                }


            }
            
            VStack(spacing: 15) {
                TextFieldView(text: $title, icon: "", title: "Title")
                TextFieldView(text: $link, icon: "", title: "Link")
            }
            
            Spacer()
            Button {
                linksViewModel.isShowAddView.toggle()
            } label: {
                GreenButton(text: "Save")
            }

            
        }
        .padding(.horizontal, 15)
        .padding(.top, 5)
        .background(Color.white)
    }
}

struct AddNewLinkView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewLinkView()
    }
}
