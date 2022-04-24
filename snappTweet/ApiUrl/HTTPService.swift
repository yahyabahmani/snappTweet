//
//  HTTPService.swift
//  snappTweet
//
//  Created by yahya on 4/23/22.
//

import Foundation
import Alamofire

final class HTTPService {
  
class func request<T:Codable>(method: HTTPMethod, parameter: Dictionary<String, Any>? = nil,andUrl url:String,succeeded: @escaping ((T)->()),failure failed: @escaping ((Error)->())) {
      let headers: HTTPHeaders = [.authorization(bearerToken: ApiURL.token)]

        print("ib-log***\(url)^^^^^")
      AF.request(url, method: method, parameters: parameter, headers: headers).validate(statusCode: 200...320).response { response in
            switch  response.result {

            case .success:
            guard let value = response.data else {return}
            do {
                let objectPromote  = try JSONDecoder().decode(T.self, from: value)
                
                succeeded(objectPromote)
            } catch {
                print(error)
              failed(ClientError.parser )
                
            }
            case .failure(_):
              failed(parseError(statusCode: response.response?.statusCode))
            }
        }
}
  class func parseError(statusCode: Int?) -> ClientError {
      guard let statusCode = statusCode else {
        return .unknown(message: ClientError.unknown(message: "").errorDescription)
      }
      switch statusCode {
      case 204:
          return .noContent
      case 401:
          return .unauthenticated
      case 500:
          return .internalServer
      default:
          let message = "error_on_connection_to_server_with_code \(statusCode)"
          return .unknown(message: message)
      }
  }
}
enum ClientError: Error {
    case unknown(message: String?)
    case unauthenticated
    case internalServer
    case parser
    case noContent
    case database
}
extension ClientError: LocalizedError {
   var errorDescription: String? {
        switch self {
        case .internalServer:
            return "Server Error"
        case .unauthenticated:
            return "unauthenticated error."
        case .parser:
            return "Parser error."
        case .unknown(let message):
          return "Unknown error \(message ?? "")"
        case .noContent:
            return "No Content"
        case .database:
          return "database Error"
        }
    }
}
