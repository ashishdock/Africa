//
//  InsertGalleryView.swift
//  Africa
//
//  Created by Ashish Sharma on 12/31/2022.
//

import SwiftUI

struct InsetGalleryView: View {
    //MARK: - PROPERTY
    let animal: Animal
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id:\.self) { item in // pull elements from the animal.gallery, since the photos don't have IDs, therefore, use the names as unique IDs in order to work in foreach
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }//: LOOP
            }//: HSTACK
        }//: SCROLLVIEW
    }//: BODY
}

//MARK: - PREVIEW
struct InsetGalleryView_Previews: PreviewProvider {
    static var animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetGalleryView(animal: animals[0])
    }
}
