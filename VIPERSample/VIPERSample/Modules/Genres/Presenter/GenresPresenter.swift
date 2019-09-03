//
//  GenresPresenter.swift
//  VIPERSample
//
//  Created User on 9/3/19.
//  Copyright © 2019 User. All rights reserved.
//
//  This file was generated by the ♻️ RMVIPER generator
//

import UIKit

class GenresPresenter: GenresPresenterProtocol
{
    weak var view: GenresViewControllerProtocol?
    var interactor: GenresInteractorInputProtocol?
    var wireFrame: GenresWireframeProtocol?
    fileprivate var genresList: [Genre]?
    
    func viewDidLoad()
    {
        view?.setupView()
        view?.showLoading()
        interactor?.retrieveGenres()
    }
    
    func didSelectCell(index indexPath: IndexPath)
    {
        guard let list = genresList else { return }
        let genre = list[indexPath.row]
        wireFrame?.showBooks(from: view, for: genre)
    }
    
    func numberOfCells() -> Int
    {
        return genresList?.count ?? 0
    }
    
    func cellViewModel(index indexPath: IndexPath) -> Genre?
    {
        guard let list = genresList else { return nil }
        let genre = list[indexPath.row]
        return genre
    }
    
    func refreshAllData()
    {
        interactor?.retrieveGenres()
    }
}

extension GenresPresenter: GenresInteractorOutputProtocol
{
    func didRetrieveGenres(_ genres: [Genre])
    {
        genresList = genres
        
        executeInMain { [weak self] in
            self?.view?.reloadData()
        }
        
        executeAfter(seconds: 0.3) { [weak self] in
            self?.view?.hideLoading()
        }
    }
    
    func failedToRetrieveGenres(_ error: ErrorType)
    {
        executeInMain { [weak self] in
            self?.view?.hideLoading()
            self?.view?.showError(error)
        }
    }
}
