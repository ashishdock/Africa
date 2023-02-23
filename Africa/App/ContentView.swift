//
//  ContentView.swift
//  Africa
//
//  Created by Ashish Sharma on 12/31/2022.
//

import SwiftUI


struct ContentView: View {
    //MARK: - PROPERTIES
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: UIImpactFeedbackGenerator.FeedbackStyle.medium)
    
    @State private var isGridViewActive: Bool = false
    
//    var gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())] // default count is 1
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
  
    // MARK: - FUNCTIONS
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1) // use this syntax when using inside a function
        gridColumn = gridLayout.count
        print("Grid number: \(gridColumn)")
        
        // TOOLBAR IMAGE
        // We are shwowing the icon of the next arrangement of icons
        switch(gridColumn) {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    
    var body: some View {
        //MARK: - BODY
        
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            } //: NAVIGATION LINK
                        } //: FOR EACH
                        CreditsView()
                            .modifier(CenterModifier())
                            
                    }//: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, content: {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                } //: NAVIGATION LINK
                            } //: FOR EACH
                        }) //: LAZY VGRID
                        .padding(10)
                        .animation(.easeIn)
                    } //:SCROLL VIEW
                } //:ELSE
            } //: GROUP
            .navigationBarTitle("Africa", displayMode: NavigationBarItem.TitleDisplayMode.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack (spacing: 16) {
                        
                        // LIST VIEW
                        Button(action: {
                            print("List view is activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        } //: BUTTON
                        
                        //GRID VIEW
                        Button(action: {
                            print("Grid view is activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                            
                        }) {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        } //: BUTTON

                    } //:HSTACK
                } //: TOOLBARITEMS
            } //: TOOLBAR
        }//: NAVIGATION
    }
}


//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
