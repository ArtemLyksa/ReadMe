//
//  DetailView.swift
//  ReadMe
//
//  Created by Artem Lyksa on 1/31/22.
//

import SwiftUI
import class PhotosUI.PHPickerViewController

struct DetailView: View {
    let book: Book
    @State var showImagePicker = false
    @State var presentDialog = false
    @Binding var image: Image?
    
    var body: some View {
        VStack(alignment: .leading) {
            TitleAndAuthorStack(book: book,
                                titleFont: .title,
                                authorFont: .title2)
            VStack {
                
                Book.Image(
                    image: image,
                    title: book.title,
                    size: nil,
                    cornerRadius: 16)
                    .scaledToFit()
                
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
