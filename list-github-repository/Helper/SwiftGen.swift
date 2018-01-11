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
        let name = self.storyboardName
        return UIStoryboard(name: name, bundle: Bundle(for: BundleToken.self))
    }
}

struct SceneType<T: Any> {
    let storyboard: StoryboardType.Type
    let identifier: String
    
    func instantiate() -> T {
        let identifier = self.identifier
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
        let identifier = segue.rawValue
        performSegue(withIdentifier: identifier, sender: sender)
    }
}

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
enum StoryboardScene {
    enum Main: StoryboardType {
        static let storyboardName = "Main"
        
        static let initialScene = InitialSceneType<UINavigationController>(storyboard: Main.self)
        
        static let pullRequestViewController = SceneType<list_github_repository.PullRequestViewController>(storyboard: Main.self, identifier: "PullRequestViewController")
        
        static let repositoryViewController = SceneType<list_github_repository.RepositoryViewController>(storyboard: Main.self, identifier: "RepositoryViewController")
    }
}

enum StoryboardSegue {
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

private final class BundleToken {}
