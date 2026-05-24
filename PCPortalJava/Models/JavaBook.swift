//
//  JavaBook.swift
//  PCPortalJava
//
//  Created by Angelos Staboulis on 24/5/26.
//

import Foundation
struct JavaBook: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let level: String
    let notes: String
}
