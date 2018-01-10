//
//  SwiftGen.swift
//  list-github-repository
//
//  Created by Mateus Gonçalves on 10/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

protocol StoryboardType {
    static var storyboardName: String { get }
}

extension StoryboardType {
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: self.storyboardName, bundle: Bundle(for: BundleToken.self))
    }
}

struct SceneType<T: Any> {
    let storyboard: StoryboardType.Type
    let identifier: String
    
    func instantiate() -> T {
        guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
        }
        return controller
    }
}

struct InitialSceneType<T: Any> {
    let storyboard: StoryboardType.Type
    
    func instantiate() -> T {
        guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
            fatalError("ViewController is not of the expected class \(T.self).")
        }
        return controller
    }
}

protocol SegueType: RawRepresentable { }

extension UIViewController {
    func perform<S: SegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
        performSegue(withIdentifier: segue.rawValue, sender: sender)
    }
}

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
enum StoryboardScene {
    enum Main: StoryboardType {
        static let storyboardName = "Main"
        
        static let initialScene = InitialSceneType<UINavigationController>(storyboard: Main.self)
        
        static let pullRequestStoryboard = SceneType<list_github_repository.PullRequestTableViewController>(storyboard: Main.self, identifier: "PullRequestStoryboard")
        
        static let repositoryStorybord = SceneType<list_github_repository.RepositoryTableViewController>(storyboard: Main.self, identifier: "RepositoryStorybord")
    }
}

enum StoryboardSegue {
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

private final class BundleToken {}
