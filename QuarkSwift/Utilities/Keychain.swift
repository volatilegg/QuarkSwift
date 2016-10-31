//
//  Keychain.swift
//  QuarkSwift
//
//  Created by Do Duc on 28/10/2016.
//  Copyright © 2016 Do Duc. All rights reserved.
//

/**
 Keychain wrapper. Inpired by SwiftKeyChain - Yanko Dimitrov and QvikSwift - Qvik
 */

import Foundation

enum TMError: Error {
    case invalidResponseFormat(type: Any)
    case keychainFailed(name: String, status: OSStatus)
}

open class Keychain {
    private let accessMode: String
    private let serviceName: String
    private var accessGroup: String?

    // MARK: - Initializers
    public init(serviceName name: String = "quark.swift.keychain", mode: String = kSecAttrAccessibleWhenUnlocked as String, group: String? = nil) {
        accessMode = mode
        serviceName = name
        accessGroup = group
    }

    // MARK: - Errors handler
    private func errorFor(key: String, status: OSStatus) throws {
        if status != errSecSuccess {
            throw TMError.keychainFailed(name: key, status: status)
        }
    }

    // MARK: - KeyChainItem
    private func item(key: String) -> [String: Any] {
        var attributes: [String: Any] = [
            kSecClass as String: (kSecClassGenericPassword as String),
            kSecAttrAccessible as String: accessMode,
            kSecAttrService as String: serviceName,
            kSecAttrAccount as String: key
        ]

        if let accessGroup = accessGroup {
            attributes[kSecAttrAccessGroup as String] = accessGroup
        }

        return attributes
    }

    // MARK: - manage keychain item methods

    /**
     Updates the add keychain item.

     - param: key The keychain item to add
     - param: value The value to add
     - throws: An MaasError if something goes wrong, nil otherwise
     */
    open func add(key: String, value: Data) throws {
        var attributes = item(key: key)
        attributes[kSecValueData as String] = value

        let status = SecItemAdd(attributes as CFDictionary, nil)

        try errorFor(key: key, status: status)
    }

    /**
     Updates the given keychain item.

     - param: key The keychain item to update
     - param: value The value to update
     - throws: An MaasError if something goes wrong, nil otherwise
     */
    open func update(key: String, value: Data) throws {
        let query = item(key: key)
        let updateAttributes = [kSecValueData as String: value]

        let status = SecItemUpdate(query as CFDictionary, updateAttributes as CFDictionary)

        try errorFor(key: key, status: status)
    }

    /**
     Deletes the given keychain item.

     - param: key The keychain item to delete
     - throws: An MaasError if something goes wrong, nil otherwise
     */
    open func remove(key: String) throws {
        let query = item(key: key)

        let status = SecItemDelete(query as CFDictionary)

        try errorFor(key: key, status: status)
    }

    /**
     Fetches the given keychain item's value.

     - param: key The keychain item to fetch
     - throws: An MaasError if something goes wrong, nil otherwise
     */
    open func getData(key: String) throws -> Data? {
        var query = item(key: key)
        query[kSecReturnData as String] = kCFBooleanTrue
        query[kSecMatchLimit as String] = kSecMatchLimitOne

        var result: AnyObject?
        let status = withUnsafeMutablePointer(to: &result) {
            SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0))
        }

        if status == errSecItemNotFound { return nil }

        try errorFor(key: key, status: status)

        guard let data = result as? Data else {
            throw TMError.invalidResponseFormat(type: Data.self)
        }

        return data
    }
}
