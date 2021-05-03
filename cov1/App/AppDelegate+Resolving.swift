//
//  AppDelegate+Resolving.swift
//  cov1
//
//  Created by Tobias P on 03.04.21.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    //register { TestDataAddressExplorerRepository() as AddressExplorerRepository }.scope(application)
    register { DataRepository() as DataRepository }.scope(application)
  }
}
