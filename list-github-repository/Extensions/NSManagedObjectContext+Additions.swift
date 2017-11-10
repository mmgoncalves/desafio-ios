//
//  NSManagedObjectContext+Additions.swift
//  list-github-repository
//
//  Created by Mateus Marques on 09/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import CoreData

extension NSManagedObjectContext {
    func saveSync(completion: @escaping (_ error: Error?) -> Void) {
        do {
            if self.hasChanges {
                try self.save()
                if self.parent != nil {
                    self.parent?.performAndWait {
                        do {
                            try self.parent?.save()
                            completion(nil)
                        } catch {
                            print((error as NSError))
                            completion(error)
                        }
                    }
                } else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        } catch {
            print((error as NSError))
            completion(error)
        }
    }
    // FIXME: this should be a throws method, remove the error closure to improve this
    func saveAsync(completion: @escaping (_ error: Error?) -> Void) {
        do {
            if self.hasChanges {
                try self.save()
                if self.parent != nil {
                    self.parent?.perform {
                        do {
                            try self.parent?.save()
                            completion(nil)
                        } catch {
                            print((error as NSError))
                            completion(error)
                        }
                    }
                } else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        } catch {
            print((error as NSError))
            completion(error)
        }
    }
}

