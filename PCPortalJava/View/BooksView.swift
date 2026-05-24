//
//  BooksView.swift
//  PCPortalJava
//
//  Created by Angelos Staboulis on 24/5/26.
//

import SwiftUI
struct BooksView: View {
    @StateObject private var vm = BooksViewModel()

    private var portalBlue: Color {
        Color(red: 0.05, green: 0.38, blue: 0.68)
    }

    private var portalBlueLight: Color {
        Color(red: 0.22, green: 0.63, blue: 0.88)
    }

    private var backgroundGradient: LinearGradient {
        LinearGradient(
            colors: [portalBlueLight, portalBlue],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {

                // MARK: - Icon πάνω από τη λίστα
                Image("icon")
                    .resizable()
                    .frame(width:340,height:100)

                // MARK: - Λίστα βιβλίων
                List(vm.books) { book in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(book.title)
                            .font(.headline)
                            .foregroundStyle(.white)

                        Text(book.author)
                            .font(.subheadline)
                            .foregroundColor(.white)

                        Text("Επίπεδο: \(book.level)")
                            .font(.footnote)
                            .foregroundColor(.white)

                        Text(book.notes)
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 4)
                    .listRowBackground(Color.clear)
                }
                .scrollContentBackground(.hidden)
            }
            .background(
                backgroundGradient
                    .ignoresSafeArea(.container, edges: .top)
            )
            .navigationTitle("Βιβλία Java")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
