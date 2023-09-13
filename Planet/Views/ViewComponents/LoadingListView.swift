//  LoadingListView.swift
//  Planet
//  Created by Naleesh Jeffrey on 2023-09-13.

import SwiftUI

struct LoadingListView: View {
    
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .alignLeft()
                .padding(.top,50)
            ProgressView()
                .alignCenter(.vertical)
        }
        .padding(.horizontal,20)
    }
}
