//
//  DetailView.swift
//  ReadMe
//
//  Created by Artem Lyksa on 1/31/22.
//

import SwiftUI
import class PhotosUI.PHPickerViewController

struct DetailView: View {
    @ObservedObject var book: Book
    @State var showImagePicker = false
    @State var presentDialog = false
    @Binding var image: Image?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                    book.readMe.toggle()
                } label: {
                    Image(systemName: book.readMe ? "bookmark.fill" : "bookmark")
                        .font(.system(size: 48, weight: .light))
                }
                
                TitleAndAuthorStack(book: book,
                                    titleFont: .title,
                                    authorFont: .title2)
            }
            Divider()
                .padding(.vertical)
            TextField("Write your review", text: $book.microReview)
            Divider()
                .padding(.vertical)
            
            VStack {
                
                Book.Image(
                    image: image,
                    title: book.title,
                    size: nil,
                    cornerRadius: 16)
                    .scaledToFit()
                    .accessibilityIdentifier("book_image")
                
                HStack {
                    if image != nil {
                        Spacer()
                        Button("Delete image") {
                            presentDialog = true
                        }
                    }
                    Spacer()
                    Button("Update image…") {
                        showImagePicker = true
                    }
                    Spacer()
                }
                .padding()
            }
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showImagePicker) {
            PHPickerViewController.View(image: $image)
        }
        .confirmationDialog("Delete image for \(book.title)",
                            isPresented: $presentDialog) {
            Button("Delete", role: .destructive) { image = nil }
        } message: {
            Text("Delete image for \(book.title)")
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init(), image: .constant(nil))
            .previewedInAllColorSchemes
    }
}
