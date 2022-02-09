//
//  ContentView.swift
//  ReadMe
//
//  Created by Artem Lyksa on 1/31/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var library: Library
    @State var isCreatingBook = false
    
    var body: some View {
        NavigationView {
            List {
                Button {
                    isCreatingBook.toggle()
                } label: {
                    Spacer()
                    VStack(alignment: .center, spacing: 6) {
                        Image(systemName: "book.circle")
                            .font(.system(size: 60))
                        Text("Add New Book")
                            .font(.title2)
                    }
                    Spacer()
                }
                .buttonStyle(.borderless)
                .padding(.vertical, 8)
                .sheet(isPresented: $isCreatingBook, content: {
                    AddBookView.init()
                })
                
                ForEach(Section.allCases, id: \.self) {
                    SectionView(section: $0)
                }
                .navigationTitle("My Library")
            }
        }
        
    }
}

private struct BookRow: View {
    @ObservedObject var book: Book
    @EnvironmentObject var library: Library
    
    var body: some View {
        NavigationLink(destination: DetailView(book: book)) {
            HStack {
                Book.Image(
                    image: library.images[book],
                    title: book.title,
                    size: 80,
                    cornerRadius: 12
                )
                VStack(alignment: .leading, spacing: 4) {
                    TitleAndAuthorStack(book: book, titleFont: .title2, authorFont: .title3)
                    if !book.microReview.isEmpty {
                        Text(book.microReview)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .lineLimit(1)
                Spacer()
                Image(systemName: book.readMe ? "bookmark.fill" : "bookmark")
                    .font(.system(size: 48, weight: .light))
                    .foregroundColor(.accentColor)
            }
            .padding(.vertical)
        }
    }
}

private struct SectionView: View {
    let section: Section
    @EnvironmentObject var library: Library
    var title: String {
        switch section {
        case .readMe: return "Read Me!"
        case .finished: return "Finished!"
        }
    }
    
    var body: some View {
        if let books = library.sortedBooks[section] {
            SwiftUI.Section {
                ForEach(books) { book in
                    BookRow(book: book)
                }
            } header: {
                ZStack {
                    Image("BookTexture")
                        .resizable()
                        .scaledToFit()
                    
                    Text(title)
                        .font(.custom("American Typewriter", size: 24))
                        .foregroundColor(.primary)
                }
                .listRowInsets(.init())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Library())
    }
}
