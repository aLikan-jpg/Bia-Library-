//
//  BookDetailViewModel.swift
//  BIA-Books
//
//  Created by Alikin Nikita Romanovich on 30.03.2023.
//

import Foundation


class BookDetailViewModel  : ViewModelDetailType  {
    
    var pickedBook : Dynamic<BookInfo?> = Dynamic(nil)
    var bookId: String
    
    private var fetcher = NetworkDataFetcher(networking: NetworkService())
    var labels = ["Дизайн",  "Разработка", "1С"]
    
    init(bookId: String) {
        self.bookId = bookId
        loadBookInfo(bookId: bookId)
    }
    
    func numberOfRows() -> Int {
        return labels.count
    }
    
    private func loadBookInfo(bookId : String) {
        fetcher.getBookInfo(params: ["bookId" : bookId]) { [weak self] bookDetail in
            if let book = bookDetail {
                self?.pickedBook.value = book
            }
        }
    }
    
    func reserveBook(bookId : String) {
        //request for reserve
    }
}

