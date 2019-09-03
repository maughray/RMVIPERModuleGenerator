//
//  GenresProtocols.swift
//  VIPERSample
//
//  Created User on 9/3/19.
//  Copyright © 2019 User. All rights reserved.
//
//  This file was generated by the ♻️ RMVIPER generator
//

import UIKit

//VIEW
protocol GenresViewControllerProtocol: class
{
    var presenter: GenresPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func setupView()
    func reloadData()
    func showLoading()
    func hideLoading()
    func showError(_ error: ErrorType)
}

//INTERACTOR
protocol GenresInteractorInputProtocol: class
{
    var presenter: GenresInteractorOutputProtocol? { get set }
    var dataService: LibraryServiceProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveGenres()
}

protocol GenresInteractorOutputProtocol: class
{
    // INTERACTOR -> PRESENTER
    func didRetrieveGenres(_ genres: [Genre])
    func failedToRetrieveGenres(_ error: ErrorType)
}

//PRESENTER
protocol GenresPresenterProtocol: class
{
    var view: GenresViewControllerProtocol? { get set }
    var interactor: GenresInteractorInputProtocol? { get set }
    var wireFrame: GenresWireframeProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func didSelectCell(index indexPath: IndexPath)
    func numberOfCells() -> Int
    func cellViewModel(index indexPath: IndexPath) -> Genre?
    func refreshAllData()
}

//ROUTER
protocol GenresWireframeProtocol: class
{
    func showBooks(from view: GenresViewControllerProtocol?, for genre: Genre)
}