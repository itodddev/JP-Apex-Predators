//
//  ContentView.swift
//  JP Apex Predators
//
//  Created by Todd James on 6/26/22.
//

import SwiftUI

struct ContentView: View {
  let apController = PredatorController() // create instance of a Predator Controller and runs init to decode JSON data
  @State var sortAlphabetical = false

  var body: some View {

    // Need to add return NavigationView, or the below if statement thinks the one line codes are trying to implicitly return a View
    if sortAlphabetical {
      apController.sortByAlphabetical()
    } else {
      apController.sortByMovieAppearance()
    }

    // returns signle view
    return NavigationView {
      List {
        ForEach(apController.apexPredators) { predator in
          NavigationLink(destination: PredatorDetail(predator: predator)) {
            PredatorRow(predator: predator)
          }
        }
      }
      .navigationTitle("Apex Predators")
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            sortAlphabetical.toggle() // toggles state change, View refreshed and re-sorted
          } label: {
            if sortAlphabetical {
              Image(systemName: "film")
            } else {
              Image(systemName: "textformat")
              
            }
          }
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
