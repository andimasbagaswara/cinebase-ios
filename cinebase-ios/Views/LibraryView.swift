//
//  LibraryView.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 19/12/20.
//

import SwiftUI

struct LibraryView: View {
    
    @ObservedObject private var libraryVM = LibraryViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(self.libraryVM.items, id: \.id) { (itemVM) in
                    NavigationLink(
                        destination: MovieDetailScreen(id: itemVM.id.intValue),
                        label: {
                            LibraryItem(itemVM: itemVM)
                        })
                }
            }
        }
        .onAppear(perform: {
            self.libraryVM.fetchAllItems()
        })
    }
}

struct LibraryItem: View {
    
    let itemVM: ItemViewModel
    
    var body: some View {
        HStack(alignment: .top, spacing: nil, content: {
            URLImage(url: itemVM.backdropPath)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(10)
                .frame(width: Constants.heightRatio * 100, height: Constants.heightRatio * 100, alignment: .center)
                .clipped()
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: nil, content: {
                Text(itemVM.title)
                    .font(.customHeading)
                    .foregroundColor(.black)
                Text(itemVM.genre)
                    .font(.customBody)
                    .foregroundColor(.gray)
                HStack(alignment: .center, spacing: nil, content: {
                    Image(systemName: "star.fill")
                        .font(.system(size: 10))
                        .foregroundColor(.yellow)
                    Text("\(itemVM.rating, specifier: "%.1f")/10")
                        .font(.customBody)
                        .foregroundColor(.gray)
                })
            })
            Spacer()
        })
        .padding()
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
