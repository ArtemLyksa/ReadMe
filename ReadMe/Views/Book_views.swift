//
//  Book_views.swift
//  ReadMe
//
//  Created by Artem Lyksa on 1/31/22.
//

import SwiftUI

extension Book {
    
    struct Image: View {
        let title: String
        
        var body: some View {
            SwiftUI.Image(title: title)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .font(.title.weight(.light))
                .foregroundColor(.secondary.opacity(0.5))
        }
    }
}

extension Image {
    
    init(title: String) {
        guard
            let char = title.first,
            case let symbol = "\(char.lowercased()).square",
            UIImage(systemName: symbol) != nil
        else {
            self.init(systemName: "book"); return
        }
        self.init(systemName: symbol)
    }
}

struct Book_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            Book.Image(title: Book().title)
            Book.Image(title: "")
            Book.Image(title: "🤓")
        }
    }
}
