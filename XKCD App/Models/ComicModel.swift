//
//  ComicModel.swift
//  XKCD App
//
//  Created by Tery Vezzuto on 27/07/22.
//

import Foundation

// struct to decode all comic from the api link

struct AllComics: Identifiable, Hashable, Codable {

    let id: Int
    let safeTitle: String
    let title: String
    let transcript: String
    let alt: String
    let sourceUrl: String
    let explainUrl: String
    let imgs: [ImageInfo]

    static let example = AllComics(id: 1,
                                   safeTitle: "",
                                   title: "",
                                   transcript: "",
                                   alt: "",
                                   sourceUrl: "",
                                   explainUrl: "",
                                   imgs: [ImageInfo(height: 100,
                                                    width: 100,
                                                    sourceUrl: "")])
}

// struct to decode comic images (from api link they have some properties inside an array)

struct ImageInfo: Hashable, Codable {
    let height: Int
    let width: Int
    let sourceUrl: String
}

// struct to decode the single comic

struct Comic: Hashable, Codable {
    let month: String
    let num: Int
    let year: String
    let alt: String
    let transcript: String
    let img: String
    let title: String
    let day: String

    static var example: Comic {
               Comic(month: "",
               num: 0,
               year: "",
               alt: "",
               transcript: "",
               img: "",
               title: "",
               day: "")
    }
}
