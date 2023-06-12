//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by TanjilaNur-00115 on 28/3/23.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var framework: Framework
    
    var body: some View {
        VStack {
            XDismissButton(isShowingDetailView: $isShowingDetailView)
            
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .font(.body)
                .padding()
            Spacer()
            Button {
                isShowingSafariView = true
            }label:{
                AFButton(title: "Learn More")
            }
        }
        .padding()
        .fullScreenCover(isPresented: $isShowingSafariView) {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(isShowingDetailView: .constant(false), framework: MockData.sampleFramework)
    }
}
