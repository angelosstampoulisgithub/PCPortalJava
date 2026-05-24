//
//  BioViewModel.swift
//  PCPortalJava
//
//  Created by Angelos Staboulis on 24/5/26.
//

import Foundation
@MainActor
class BioViewModel: ObservableObject {
    @Published var bio: Bio

    init() {
        self.bio = Bio(
            title: "James Gosling",
            subtitle: "Δημιουργός της Java",
            text: """
Ο James Arthur Gosling (γεν. 1955) είναι Καναδός επιστήμονας υπολογιστών και ο δημιουργός της Java στη Sun Microsystems.

Σχεδίασε την αρχιτεκτονική της Java, τον πρώτο compiler και την JVM, εισάγοντας το “Write Once, Run Anywhere”.

Έχει εργαστεί σε Google, Liquid Robotics και Amazon Web Services.
"""
        )
    }
}
