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
  @State var currentFilter = "All"

  var body: some View {
    apController.filterBy(type: currentFilter) // Filter by types first

    // Need to add return to NavigationView, or the below if statement thinks the one liners are trying to implicitly return a View
    if sortAlphabetical {
      apController.sortByAlphabetical()
    } else {
      apController.sortByMovieAppearance()
    }

    // returns single view
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
            withAnimation {  // creates a shuffle effect
              sortAlphabetical.toggle() // toggles state change, View refreshed and re-sorted
            }
          } label: {
            if sortAlphabetical {
              Image(systemName: "film")
            } else {
              Image(systemName: "textformat")
            }
          }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Menu {
            Picker("Filter", selection: $currentFilter.animation()) { // $currentFilter bound to Picker, will update State and cause re-render also adds animation picker menu bounces out
              ForEach(apController.typeFilters, id:\.self) { type in // make string array identifiable
                HStack {
                  Text(type)

                  Spacer()

                  Image(systemName: apController.typeIcon(for: type))  // icon names in switch statement in controller
                }
              }
            }
          } label: {
            Image(systemName: "slider.horizontal.3")
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
