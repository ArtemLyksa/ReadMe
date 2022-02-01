//
//  Book_views.swift
//  ReadMe
//
//  Created by Artem Lyksa on 1/31/22.
//

import SwiftUI

struct TitleAndAuthorStack: View {
    let book: Book
    let titleFont: Font
    let authorFont: Font
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(book.title)
                .font(titleFont)
            Text(book.author)
                .font(authorFont)
                .foregroundColor(.secondary)
        }
    }
}

extension Book {
    
    struct Image: View {
        let image: SwiftUI.Image?
        let title: String
        var size: CGFloat?
        let cornerRadius: CGFloat
        
        var body: some View {
            if let image = image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: size, height: size)
                    .cornerRadius(cornerRadius)
            } else {
                SwiftUI.Image(title: title)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .font(.title.weight(.light))
                    .foregroundColor(.secondary.opacity(0.5))   
            }
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

extension Book.Image {
    ///A preview image
    init(title: String) {
        self.init(image: nil, title: title, cornerRadius: .init())
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
