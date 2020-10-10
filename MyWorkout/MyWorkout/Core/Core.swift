//
//  Core.swift
//  MyWorkout
//
//  Created by João Palma on 09/10/2020.
//

struct Core {
    static func initialize() {
        _registerServices()
        _registerViewModels()
        _registerViewControllers()
        _startApp()
    }

    private static func _registerServices() {
        DiContainer.registerSingleton(NavigationService.self, constructor: { NavigationServiceImp() })
    }

    private static func _registerViewModels() {
        DiContainer.register(WelcomeViewModel.self, constructor: { WelcomeViewModel() })
    }

    private static func _registerViewControllers() {
        DiContainer.registerViewController(WelcomeViewModel.self, constructor: { WelcomeViewController() })
    }

    private static func _startApp() {
        let navigationService: NavigationService = DiContainer.resolve()
        navigationService.navigateAndSetAsContainer(viewModel: WelcomeViewModel.self)
    }
}
