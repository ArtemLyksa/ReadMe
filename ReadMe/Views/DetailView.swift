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
    @Binding var image: Image?
    
    var body: some View {
        VStack(alignment: .leading) {
            TitleAndAuthorStack(book: book,
                                titleFont: .title,
                                authorFont: .title2)
            VStack {
                Book.Image(image: image, title: book.title, size: nil, cornerRadius: 16)
                    .scaledToFit()
                Button("Update image…") {
                    showImagePicker = true
                }
                .padding()
            }
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showImagePicker) {
            PHPickerViewController.View(image: $image)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init(), image: .constant(nil))
            .previewedInAllColorSchemes
    }
}
