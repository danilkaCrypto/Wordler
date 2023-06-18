//
//  LinksViewModel.swift
//  Wordler
//
//  Created by danilka on 17.06.2023.
//

import Foundation
import SwiftUI

class LinksViewModel: ObservableObject {
    @Published var isShowAddView = false
    
    @Published var isShowLinkContent = false
    @Published var openUrl = ""
}
