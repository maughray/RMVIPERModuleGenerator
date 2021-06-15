//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  Unidirectional VIPER, generated by the ♻️ RMVIPER generator
//

import UIKit

class ___VARIABLE_productName:identifier___Wireframe: ___VARIABLE_productName:identifier___WireframeProtocol
{
    static func assemblyModule() -> UIViewController
    {
        let viewController = ___VARIABLE_productName:identifier___ViewController.instantiate()
        let presenter: ___VARIABLE_productName:identifier___PresenterProtocol = ___VARIABLE_productName:identifier___Presenter()
        let interactor: ___VARIABLE_productName:identifier___InteractorProtocol = ___VARIABLE_productName:identifier___Interactor()
        let wireFrame: ___VARIABLE_productName:identifier___WireframeProtocol = ___VARIABLE_productName:identifier___Wireframe()
        
        viewController.interactor = interactor
        presenter.view = viewController
        presenter.wireFrame = wireFrame
        interactor.presenter = presenter
        
        return viewController
    }
}