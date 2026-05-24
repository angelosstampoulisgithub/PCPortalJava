//
//  ContentView.swift
//  PCPortalJava
//
//  Created by Angelos Staboulis on 24/5/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack { BioView() }
                .tabItem { Label("Βιογραφικό", systemImage: "person.text.rectangle") }
            
            NavigationStack { BooksView() }
                .tabItem { Label("Βιβλία", systemImage: "book.closed") }
            
            NavigationStack { QuizView() }
                .tabItem { Label("Quiz", systemImage: "questionmark.circle") }
            NavigationStack { LocationView() }
                .tabItem { Label("Τοποθεσία", systemImage: "mappin.circle") }
        }
    }
}

#Preview {
    ContentView()
}
