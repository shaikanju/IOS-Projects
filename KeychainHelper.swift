import Foundation
import Security

class KeychainHelper {
    static let shared = KeychainHelper()

    private init() {}

    func set(_ value: Bool, forKey key: String) {
        guard let data = try? JSONEncoder().encode(value) else { return }
        let query = [
            kSecValueData: data,
            kSecAttrAccount: key,
            kSecClass: kSecClassGenericPassword
        ] as CFDictionary

        SecItemDelete(query)
        SecItemAdd(query, nil)
    }

    func get(forKey key: String) -> Bool? {
        let query = [
            kSecAttrAccount: key,
            kSecClass: kSecClassGenericPassword,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ] as CFDictionary

        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query, &dataTypeRef)

        guard status == errSecSuccess,
              let data = dataTypeRef as? Data,
              let value = try? JSONDecoder().decode(Bool.self, from: data) else {
            return nil
        }

        return value
    }
}

