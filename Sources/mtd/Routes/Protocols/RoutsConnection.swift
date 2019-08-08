//
//  RoutsConnection.swift
//  Application
//
//  Created by Daniel Mandea on 29/05/2019.
//

import Foundation
import PromiseKit
import CouchDB
import Application

public protocol RoutsConnection {
    func connectRouts(for database: Database?)
}
