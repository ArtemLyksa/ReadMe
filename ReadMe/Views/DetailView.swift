//
//  DetailView.swift
//  ReadMe
//
//  Created by Artem Lyksa on 1/31/22.
//

import SwiftUI

struct DetailView: View {
    let book: Book
    
    var body: some View {
        VStack(alignment: .leading) {
            TitleAndAuthorStack(book: book,
                                titleFont: .title,
                                authorFont: .title2)
            Book.Image(title: book.title, size: nil)
            Spacer()
        }
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init())
    }
}
