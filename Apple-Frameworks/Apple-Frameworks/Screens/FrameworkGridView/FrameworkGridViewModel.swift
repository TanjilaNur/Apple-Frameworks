//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by TanjilaNur-00115 on 28/3/23.
//

import Foundation
import SwiftUI

final class FrameworkGridViewModel: ObservableObject{
    var selectedFramework: Framework? {
        didSet{ isShwoingDetailsView = true }
    }
    
    @Published var isShwoingDetailsView = false
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
}
