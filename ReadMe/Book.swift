//
//  Book.swift
//  ReadMe
//
//  Created by Artem Lyksa on 1/31/22.
//
import Combine

class Book: ObservableObject {
    
    @Published var title: String
    @Published var author: String
    @Published var microReview: String
    @Published var readMe: Bool
    
    init(
        title: String = "",
        author: String = "",
        microReview: String = "",
        readMe: Bool = true
    ) {
        self.title = title
        self.author = author
        self.microReview = microReview
        self.readMe = readMe
    }
}

extension Book: Hashable, Identifiable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Book: Equatable {
    
    static func == (lhs: Book, rhs: Book) -> Bool {
        return lhs === rhs
    }
    
}
