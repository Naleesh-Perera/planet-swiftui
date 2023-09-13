//  ViewExtentions.swift
//  Planet
//  Created by Naleesh Jeffrey on 2023-09-13.

import SwiftUI

extension View{
    
    //MARK: Center View
    @ViewBuilder
    func alignCenter(_ axis: Axis) -> some View {
        switch axis {
        case .horizontal:
            HStack(spacing:0){
                Spacer()
                self
                Spacer()
            }
        case .vertical:
            VStack(spacing:0){
                Spacer()
                self
                Spacer()
            }
        }
    }
    
    //MARK: Left Align View
    @ViewBuilder
    func alignLeft() -> some View {
        HStack(spacing:0){
            self
            Spacer()
        }
    }
    
    //MARK: Right Align View
    @ViewBuilder
    func alignRight() -> some View {
        HStack(spacing:0){
            Spacer()
            self
        }
    }
    
}
