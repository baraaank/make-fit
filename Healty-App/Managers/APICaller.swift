//
//  APICaller.swift
//  Healty-App
//
//  Created by BaranK Kutlu on 2.01.2022.
//

import Foundation


final class APICaller {
    static let shared = APICaller()
    
    private init() {}
    
    struct Constants {
        static let baseAPIURL = "http://192.168.1.20:8000"
    }
    
    enum APIError: Error {
        case failedToGetData
    }
    
    enum HTTPMethod: String {
        case GET
        case PUT
        case POST
        case DELETE
        case PATCH
    }
    
    private func createRequest(
        with url: URL?,
        type: HTTPMethod,
        completion: @escaping (URLRequest) -> Void
    ) {
        
        guard let apiURL = url else {
            return
        }
        
        var request = URLRequest(url: apiURL)
        request.httpMethod = type.rawValue
        request.timeoutInterval = Double.infinity
        completion(request)
    }
    
    public func logInUser(email: String, password: String, completion: @escaping (Result<UserResultsResponse, Error>) -> Void) {
        createRequest(with: URL(string: Constants.baseAPIURL + "/users/login"), type: .POST) { baseRequest in
            var request = baseRequest
            
            let parameters: [String: Any] = [
                "email": email,
                "password": password
            ]
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(UserResponse.self, from: data)
                    completion(.success(result.results))
                    print(result.results.token)
                    
                } catch {
                    print("catch")
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    public func createUser(email: String, name: String, surname: String, password: String, completion: @escaping (Bool) -> Void) {
        createRequest(with: URL(string: Constants.baseAPIURL + "/users/register"), type: .POST) { baseRequest in
            var request = baseRequest
            
            let parameters: [String: Any] = [
                "email": email,
                "name": name,
                "surName": surname,
                "password": password
            ]
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
                guard let data = data, error == nil else {
                    completion(false)
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(ReturnResponse.self, from: data)
                    completion(result.results.isUserCreated!)
                } catch {
                    print("catch register user")
                    completion(false)
                }
            }
            task.resume()
        }
    }
    
    public func calculateCalorie(_id: String, calorie: Int, token: String, completion: @escaping (Bool) -> Void) {
        createRequest(with: URL(string: Constants.baseAPIURL + "/users/calculatedCalorie/\(_id)"), type: .POST) { baseRequest in
            var request = baseRequest
            
            let parameters: [String: Any] = [
                "calorie": calorie
            ]
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
                guard let data = data, error == nil else {
                    completion(false)
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(ReturnResponse.self, from: data)
                    completion(result.results.isCalorieCalculated!)
                } catch {
                    print("catchhhing")
                    completion(false)
                }
                
            }
            task.resume()
            
        }
    }
    
    
    public func getFoods(token: String, completion: @escaping (Result <FoodResultResponse, Error>) -> Void) {
        createRequest(with: URL(string: Constants.baseAPIURL + "/foods"), type: .GET) { baseRequest in
            
            var request = baseRequest
            
        
            
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
                
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
 
                do {
                    
                    
                    let res = try JSONDecoder().decode(FoodResponse.self, from: data)
                    completion(.success(res.results))
                    print(res.results)

                    
                    
                } catch {
                    completion(.failure(error))
                }
                
            }
            task.resume()
        }
    }
    
    public func getUserProfile(token: String, _id: String, completion: @escaping (Result<UserInfo, Error>) -> Void) {
        createRequest(with: URL(string: Constants.baseAPIURL + "/user/\(_id)"), type: .GET) { baseRequest in
            var request = baseRequest
            
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(GetUserResponse.self, from: data)
                    completion(.success(result.results.user))
                    
                } catch {
                    completion(.failure(error))
                }
            }
            task.resume()
            
        }
    }
    
   
}
