//
//  QuizViewModel.swift
//  PCPortalJava
//
//  Created by Angelos Staboulis on 24/5/26.
//

import Foundation

@MainActor
class QuizViewModel: ObservableObject {
    @Published var questions: [QuizQuestion] = []
    @Published var currentIndex: Int = 0
    @Published var selectedIndex: Int? = nil
    @Published var score: Int = 0
    @Published var showResult: Bool = false

    init() {
        loadQuestions()
    }

    private func loadQuestions() {
        questions = [
            QuizQuestion(
                question: "Ποιος δημιούργησε τη Java;",
                options: ["James Gosling", "Dennis Ritchie", "Guido van Rossum", "Bjarne Stroustrup"],
                correctIndex: 0
            ),
            QuizQuestion(
                question: "Ποιο είναι το motto της Java;",
                options: ["Write once, run anywhere", "Compile everywhere", "Run once", "Portable C++"],
                correctIndex: 0
            ),
            QuizQuestion(
                question: "Ποιο keyword χρησιμοποιείται για κληρονομικότητα;",
                options: ["extends", "inherits", "super", "implements"],
                correctIndex: 0
            ),
            QuizQuestion(
                question: "Ποιο από τα παρακάτω είναι primitive type;",
                options: ["String", "Integer", "boolean", "BigDecimal"],
                correctIndex: 2
            ),
            QuizQuestion(
                question: "Ποιο μέρος της Java εκτελεί bytecode;",
                options: ["JDK", "JRE", "JVM", "JAR"],
                correctIndex: 2
            )
        ]
    }

    func submitAnswer() {
        guard let selected = selectedIndex else { return }
        if selected == questions[currentIndex].correctIndex {
            score += 1
        }
        showResult = true
    }

    func nextQuestion() {
        selectedIndex = nil
        currentIndex += 1
    }

    func reset() {
        currentIndex = 0
        selectedIndex = nil
        score = 0
    }
}
