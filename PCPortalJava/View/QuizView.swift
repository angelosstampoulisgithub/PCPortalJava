//
//  QuizView.swift
//  PCPortalJava
//
//  Created by Angelos Staboulis on 24/5/26.
//

import SwiftUI

struct QuizView: View {
    @StateObject private var vm = QuizViewModel()
    
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
        ZStack(alignment: .top) {

            // MARK: - Fullscreen background
            backgroundGradient
                .ignoresSafeArea(.container, edges: .top)

            // MARK: - Icon at the top
            Image(.icon)
                .resizable()
                .frame(width:340,height:100)

            // MARK: - Quiz content
            VStack(spacing: 20) {

                Spacer().frame(height: 120) 

                if vm.currentIndex < vm.questions.count {
                    let q = vm.questions[vm.currentIndex]

                    Text("Ερώτηση \(vm.currentIndex + 1) / \(vm.questions.count)")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))

                    Text(q.question)
                        .font(.title3.bold())
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)

                    VStack(spacing: 12) {
                        ForEach(q.options.indices, id: \.self) { index in
                            Button {
                                vm.selectedIndex = index
                            } label: {
                                HStack {
                                    Text(q.options[index])
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(vm.selectedIndex == index ? .yellow : .white.opacity(0.4), lineWidth: 2)
                                )
                            }
                        }
                    }
                    .padding(.horizontal)

                    Button("Επόμενο") {
                        vm.submitAnswer()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.yellow)
                    .disabled(vm.selectedIndex == nil)

                } else {
                    VStack(spacing: 16) {
                        Text("Τέλος Quiz!")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)

                        Text("Σκορ: \(vm.score) / \(vm.questions.count)")
                            .font(.title2)
                            .foregroundColor(.white)

                        Button("Ξανά") {
                            vm.reset()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.yellow)
                    }
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Quiz Java")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Απάντηση", isPresented: $vm.showResult) {
            Button("OK") {
                vm.nextQuestion()
            }
        } message: {
            if let selected = vm.selectedIndex {
                let correct = vm.questions[vm.currentIndex].correctIndex
                Text(selected == correct ? "Σωστά!" : "Λάθος!")
            }
        }
    }

}
      
