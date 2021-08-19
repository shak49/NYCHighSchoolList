//
//  HighSchoolController.swift
//  HighSchoolList_Demo
//
//  Created by Shak Feizi on 8/9/21.
//

import UIKit


class HighSchoolController {
    // Shak notes: Properties
    static let sharedInstance: HighSchoolController = HighSchoolController()
    var schoolArray: [HighSchool]? = []
    var highSchool: HighSchool?
    // URLs
    // https://data.cityofnewyork.us/resource/f9bf-2cp4.json
    // https://data.cityofnewyork.us/resource/s3k6-pzi2.json
    
    // Shak notes: Fetching Data from API
    func fetchHighSchoolName(completion: @escaping(Result<Any, NetworkError>) -> Void) {
        // URL
        let baseURL = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")
        guard let finalURL = baseURL else { return completion(.failure(.invalidURL)) }
        // URLRequest
        var request = URLRequest(url: finalURL)
        request.httpMethod = "GET"
        // URLSession
        URLSession.shared.dataTask(with: request) { data, response, error in
            // Handling response and error
            if let error = error { return completion(.failure(.thrownError(error))) }
            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
            }
            // Unwrapping data
            guard let data = data else { return completion(.failure(.noData)) }
            print(data)
            // Decode data
            do {
                let highSchoolName = try JSONSerialization.jsonObject(with: data, options: [])
                return completion(.success(highSchoolName))
            } catch {
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
    func fetchSATHighSchool(completion: @escaping(Result<Any, NetworkError>) -> Void) {
        // URL
        let baseURL = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json")
        guard let finalURL = baseURL else { return completion(.failure(.invalidURL)) }
        // URLRequest
        var request = URLRequest(url: finalURL)
        request.httpMethod = "GET"
        // URLSession
        URLSession.shared.dataTask(with: request) { data, response, error in
            // Handling response and error
            if let error = error { return completion(.failure(.thrownError(error))) }
            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
            }
            // Unwrapping data
            guard let data = data else { return completion(.failure(.noData)) }
            print(data)
            // Decode data
            do {
                let highSchoolSAT = try JSONSerialization.jsonObject(with: data, options: [])
                return completion(.success(highSchoolSAT))
            } catch {
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
} //End of class







