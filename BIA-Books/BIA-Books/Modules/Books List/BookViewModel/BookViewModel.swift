//
//  BookViewModel.swift
//  BIA-Books
//
//  Created by Alikin Nikita Romanovich on 06.03.2023.
//

import Foundation

class BooksViewModel {
    
    var bookList: Dynamic<[BookList]?> = Dynamic(nil)
    private var fetcher = NetworkDataFetcher(networking: NetworkService())
    let bookListTags = ["Дизайн", "1C", "Разработка", "Тестирование", "Системный анализ", "Управление проектами", "Бухгалтерия"]
    
    func numberOfTags() -> Int {
        return bookListTags.count
    }
    
    func loadBookList() {
        fetcher.getBookList(params: [:]) { [weak self] response in
            
            let books = response.compactMap { $0 }
            if !books.isEmpty {
                self?.bookList.value = books
            } else {
                print("Не удалось загрузить список книг")
            }
        }
    }
}
