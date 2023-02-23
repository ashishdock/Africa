//
//  CreditsView.swift
//  Africa
//
//  Created by Ashish Sharma on 01/01/2023.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
    Copyright © Ashish
    All Rights Reserved
    We got iPhone dev covered.
    Made with ❤️
    """)
            .font(.footnote)
            .multilineTextAlignment(.center)
            
        } //: VSTACK
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
