//
//  CenterModifier.swift
//  Africa
//
//  Created by Ashish Sharma on 01/01/2023.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content:Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}
