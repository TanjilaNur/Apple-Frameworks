//
//  FrameworkgridView.swift
//  Apple-Frameworks
//
//  Created by TanjilaNur-00115 on 22/3/23.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModel.columns){
                    ForEach(MockData.frameworks, id: \.id) { framework in //id: \.id can be cleaned as swiftui easily going to get it as we conformed to identifiable
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                }
            }
            .navigationTitle("Apple Frameworks")
            .sheet(isPresented: $viewModel.isShwoingDetailsView){
                FrameworkDetailView(isShowingDetailView: $viewModel.isShwoingDetailsView, framework: viewModel.selectedFramework ?? MockData.sampleFramework)
            }
        }
    }
}

struct FrameworkgridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
            .preferredColorScheme(.dark)
    }
}


