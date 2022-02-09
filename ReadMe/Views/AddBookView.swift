//
//  AddBookView.swift
//  ReadMe
//
//  Created by Artem Lyksa on 2/8/22.
//

import SwiftUI

struct AddBookView: View {
    @ObservedObject var book: Book = .init()
    @State var image: Image? = nil
    @EnvironmentObject var library: Library
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                TextField("Title", text: $book.title)
                TextField("Author", text: $book.author)
                ReviewAndImageView(book: .init(), image: $image)
                Spacer()
            }
            .padding()
            .navigationTitle("Got a new book?")
            .toolbar {
                ToolbarItem(placement: .status) {
                    Button("Add to library") {
                        library.addNew(book: book, image: image)
                        dismiss()
                    }
                    .disabled(
                        [book.title, book.author].contains(where: \.isEmpty)
                    )
                }
            }
            
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView(book: .init()).environmentObject(Library())
    }
}
