//
//  Copyright (c) 2021 gematik GmbH
//  
//  Licensed under the EUPL, Version 1.2 or – as soon they will be approved by
//  the European Commission - subsequent versions of the EUPL (the Licence);
//  You may not use this work except in compliance with the Licence.
//  You may obtain a copy of the Licence at:
//  
//      https://joinup.ec.europa.eu/software/page/eupl
//  
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the Licence is distributed on an "AS IS" basis,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the Licence for the specific language governing permissions and
//  limitations under the Licence.
//  
//

@_implementationOnly import COpenSSL
import Foundation

/// DiffieHellman sharedSecret protocol
public protocol DiffieHellman {
    /// The associated PublicKey type
    associatedtype PublicKey

    /// Compute a shared secret using the given public key
    ///
    /// - Note: This protocol assumes the implementation has access [or represents] the private or
    ///         pre-shared secret information.
    ///
    /// - Parameter peerKey: the public key material to derive a shared secret in conjunction
    ///                         with its own private information.
    /// - Returns: The shared secret in raw bytes
    /// - Throws: `OpenSSLError` in case this operation was not supported
    func sharedSecret(with peerKey: PublicKey) throws -> Data
}
