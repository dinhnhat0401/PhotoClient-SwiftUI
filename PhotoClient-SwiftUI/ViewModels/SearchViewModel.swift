//
//  SearchViewModel.swift
//  PhotoClient-SwiftUI
//
//  Created by Đinh Văn Nhật on 2021/10/09.
//

import SwiftUI
import Combine
import PhotoClientModels

public protocol SearchViewModelProtocol {
    var keyword: String { get }
    var datasource: [SearchResultCellViewModel] { get }

    func search(_ keyword: String)
}

public class SearchViewModel: ObservableObject, SearchViewModelProtocol, Identifiable {
    @Published public var keyword: String = ""
    @Published public var datasource: [SearchResultCellViewModel] = []

    public init(_ searchImageService: SearchImageServiceProtocol) {
        self.searchImageService = searchImageService
        $keyword
          .dropFirst(1)
          .debounce(for: DispatchQueue.SchedulerTimeType.Stride.seconds(0.5), scheduler: scheduler)
          .sink(receiveValue: search)
          .store(in: &disposables)
    }

    public func search(_ keyword: String) {
        guard let service = self.searchImageService else {
            return
        }
        service.searchImage(keyword).map { responseEntity in
            return responseEntity.hits.map(SearchResultCellViewModel.init)
        }.receive(on: DispatchQueue.main).sink { [weak self] value in
            print(value)
            switch value {
            case .failure:
                self?.datasource = []
            case .finished:
                break
            }
        } receiveValue: { [weak self] results in
            self?.datasource = results
        }.store(in: &disposables)
    }

    // MARK: - private variables

    private var searchImageService: SearchImageServiceProtocol?
    private var disposables = Set<AnyCancellable>()
    private let scheduler: DispatchQueue = DispatchQueue(label: "WeatherViewModel")
}
