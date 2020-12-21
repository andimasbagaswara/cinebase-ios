//
//  LibraryViewModel.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 21/12/20.
//

import Foundation
import CoreData
import Combine

class LibraryViewModel: ObservableObject {
    
    @Published var loadingState = LoadingState.loading
    @Published var items = [ItemViewModel]()
    
    init() {
        fetchAllItems()
    }
    
    func deleteItem(_ itemVM: ItemViewModel) {
        CoreDataManager.shared.deleteItem(id: itemVM.id.intValue)
        fetchAllItems()
    }
    
    func fetchAllItems() {
        self.items = CoreDataManager.shared.getAllItems().map(ItemViewModel.init)
        print(self.items)
    }
}
