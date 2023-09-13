//  LoadingViewModifier.swift
//  Planet
//  Created by Naleesh Jeffrey on 2023-09-13.

import SwiftUI

enum ProgressStyle{
    case progress
    case listProgress(title : String)
}

// MARK: - Progress
struct Progress: ViewModifier{
    
    @Binding var isLoading: Bool
    
    func body(content: Content) -> some View {
        if isLoading{
            VStack{
                Spacer()
                ProgressView()
                Spacer()
            }
        }else{
            content
        }
    }
}

// MARK: - LoadingListView
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

// MARK: - ListProgress
struct ListProgress: ViewModifier{
    
    @Binding var isLoading: Bool
    let title : String
    
    func body(content: Content) -> some View {
        if isLoading{
            LoadingListView(title: title)
        }else{
            content
        }
    }
}

extension View {
    @ViewBuilder
    func loading(_ isLoading: Binding<Bool>, style : ProgressStyle = .progress) -> some View{
        switch style {
        case .progress:
            self.modifier(Progress(isLoading: isLoading))
        case .listProgress((let title)):
            self.modifier(ListProgress(isLoading: isLoading, title: title))
        }
    }
}
