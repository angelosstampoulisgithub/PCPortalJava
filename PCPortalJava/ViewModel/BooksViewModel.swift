//
//  BooksViewModel.swift
//  PCPortalJava
//
//  Created by Angelos Staboulis on 24/5/26.
//

import Foundation

@MainActor
class BooksViewModel: ObservableObject {
    @Published var books: [JavaBook] = []

    init() {
        loadBooks()
    }

    private func loadBooks() {
        books = [
            JavaBook(
                title: "Effective Java",
                author: "Joshua Bloch",
                level: "Μέσο–Προχωρημένο",
                notes: "Best practices για σοβαρή ανάπτυξη."
            ),
            JavaBook(
                title: "Head First Java",
                author: "Kathy Sierra, Bert Bates",
                level: "Αρχάριο–Μέσο",
                notes: "Εξαιρετικό για αρχάριους."
            ),
            JavaBook(
                title: "Java: The Complete Reference",
                author: "Herbert Schildt",
                level: "Αρχάριο–Μέσο",
                notes: "Καλύπτει όλη τη γλώσσα."
            ),
            JavaBook(
                title: "Core Java Volume I",
                author: "Cay S. Horstmann",
                level: "Αρχάριο–Μέσο",
                notes: "Πολύ καλή εισαγωγή στη Java SE με πρακτικά παραδείγματα."
            ),
            JavaBook(
                title: "Java Performance",
                author: "Scott Oaks",
                level: "Προχωρημένο",
                notes: "Εμβάθυνση σε JVM tuning, garbage collection και performance."
            )
        ]
    }
}
